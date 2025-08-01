/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import QtQuick.Window
import Victron.VenusOS

Page {
	id: root

	property int cardWidth: cardsView.count > 2
			? Theme.geometry_controlCard_minimumWidth
			: Theme.geometry_controlCard_maximumWidth

	topLeftButton: VenusOS.StatusBar_LeftButton_ControlsActive
	width: parent.width
	anchors {
		top: parent.top
		bottom: parent.bottom
		bottomMargin: Theme.geometry_controlCardsPage_bottomMargin
	}

	// The cards list view is made up of:
	// - Header - ESS card
	// - Per-device Control Cards for EVCS, Generators, Inverter/chargers
	BaseListView {
		id: cardsView

		anchors {
			fill: parent
			leftMargin: Theme.geometry_controlCardsPage_horizontalMargin
			rightMargin: Theme.geometry_controlCardsPage_horizontalMargin
		}
		spacing: Theme.geometry_controlCardsPage_spacing
		orientation: ListView.Horizontal

		header: BaseListLoader {
			active: systemType.value === "ESS" || systemType.value === "Hub-4"
			sourceComponent: BaseListItem {
				width: root.cardWidth + cardsView.spacing
				height: cardsView.height
				background.visible: false
				KeyNavigationHighlight.active: false

				ESSCard {
					width: root.cardWidth
					height: cardsView.height
				}
			}

			VeQuickItem {
				id: systemType
				uid: Global.system.serviceUid + "/SystemType"
			}
		}

		model: controlCardModel
		delegate: BaseListLoader {
			id: deviceDelegate

			required property Device device

			width: root.cardWidth
			height: cardsView.height
			sourceComponent: {
				const serviceType = BackendConnection.serviceTypeFromUid(device.serviceUid)
				if (serviceType === "evcharger") {
					return evcsComponent
				} else if (serviceType === "generator") {
					return generatorComponent
				}
				return inverterChargerComponent
			}

			Component {
				id: evcsComponent

				EVCSCard {
					width: root.cardWidth
					serviceUid: deviceDelegate.device.serviceUid
				}
			}

			Component {
				id: generatorComponent

				GeneratorCard {
					width: root.cardWidth
					serviceUid: deviceDelegate.device.serviceUid
				}
			}

			Component {
				id: inverterChargerComponent

				InverterChargerCard {
					width: root.cardWidth
					serviceUid: deviceDelegate.device.serviceUid
					name: deviceDelegate.device.name
				}
			}
		}
	}

	AggregateDeviceModel {
		id: controlCardModel

		sortBy: AggregateDeviceModel.SortBySourceModel | AggregateDeviceModel.SortByDeviceName
		sourceModels: [
			evChargerModel,
			generatorModel,
			Global.inverterChargers.veBusDevices,
			Global.inverterChargers.acSystemDevices,
			Global.inverterChargers.inverterDevices
		]
	}

	// A model of evcharger services that represent controllable EV chargers, i.e. those with a
	// valid /Mode value. Global.evChargers.model cannot be used in the control cards, as it
	// includes services without a /Mode, such as Energy Meters configured as EV chargers.
	ServiceDeviceModel {
		id: evChargerModel

		serviceTypes: ["evcharger"]
		modelId: "evcharger"
		deviceDelegate: Device {
			id: device

			required property string uid
			readonly property bool isRealCharger: valid && _chargerMode.valid
			property bool addedToModel

			readonly property VeQuickItem _chargerMode: VeQuickItem {
				uid: device.serviceUid + "/Mode"
			}

			serviceUid: uid
			onIsRealChargerChanged: {
				if (isRealCharger && !addedToModel) {
					evChargerModel.addDevice(device)
					addedToModel = true
				} else if (!isRealCharger && addedToModel) {
					evChargerModel.removeDevice(device.serviceUid)
					addedToModel = false
				}
			}

			Component.onDestruction: {
				if (addedToModel) {
					evChargerModel.removeDevice(device.serviceUid)
				}
			}
		}
	}

	// A model of generator services with /Enabled=1, i.e. those that have the startstop1 feature
	// for starting/stopping the generator.
	ServiceDeviceModel {
		id: generatorModel

		serviceTypes: ["generator"]
		modelId: "generator"
		deviceDelegate: Device {
			id: generatorDevice

			required property string uid
			readonly property bool controllable: valid && _enabled.valid && _enabled.value === 1
			property bool addedToModel

			readonly property VeQuickItem _enabled: VeQuickItem {
				uid: generatorDevice.serviceUid + "/Enabled"
			}

			serviceUid: uid
			onControllableChanged: {
				if (controllable && !addedToModel) {
					generatorModel.addDevice(generatorDevice)
					addedToModel = true
				} else if (!controllable && addedToModel) {
					generatorModel.removeDevice(generatorDevice.serviceUid)
					addedToModel = false
				}
			}

			Component.onDestruction: {
				if (addedToModel) {
					generatorModel.removeDevice(generatorDevice.serviceUid)
				}
			}
		}
	}
}
