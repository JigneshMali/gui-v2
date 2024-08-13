/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

//
// Allows the "mode" to be changed for inverter, vebus, and acsystem services. Different mode
// options are displayed depending on the service type.
//

ModalDialog {
	id: root

	property string serviceUid
	property int mode

	readonly property string serviceType: BackendConnection.serviceTypeFromUid(serviceUid)
	readonly property bool showInverterModesOnly: serviceType === "inverter" && isInverterChargerItem.value !== 1

	title: showInverterModesOnly
			 //% "Inverter mode"
		   ? qsTrId("controlcard_inverter_mode")
			 //% "Inverter / Charger mode"
		   : qsTrId("controlcard_inverter_charger_mode")
	height: header.height + contentHeight + footer.height

	contentItem: Column {
		anchors {
			top: parent.top
			left: parent.left
			right: parent.right
			margins: Theme.geometry_modalDialog_content_horizontalMargin
		}

		Repeater {
			id: repeater

			readonly property bool isMulti: root.serviceType === "inverter" ? isInverterChargerItem.value === 1
					: root.serviceType === "vebus" ? numberOfAcInputs.value !== 0
					: root.serviceType === "acsystem" ? true
					: false     // unsupported service

			// Options for inverter services
			readonly property var inverterModel: [
				{ value: VenusOS.Inverter_Mode_On },
				{ value: VenusOS.Inverter_Mode_Eco },
				{ value: VenusOS.Inverter_Mode_Off },
			]

			// Options for vebus and acsystem services
			readonly property var inverterChargerModel: [
				{ value: VenusOS.InverterCharger_Mode_On, enabled: true },
				{ value: VenusOS.InverterCharger_Mode_ChargerOnly, enabled: isMulti },
				{ value: VenusOS.InverterCharger_Mode_InverterOnly, enabled: isMulti },
				{ value: VenusOS.InverterCharger_Mode_Off, enabled: true },
				{
					value: VenusOS.InverterCharger_Mode_Passthrough,
					visible: root.serviceType === "acsystem",
					enabled: hasAcPassthroughSupport.value === 1,
				}
			]

			width: parent.width
			model: root.showInverterModesOnly ? inverterModel : inverterChargerModel
			delegate: buttonStyling
		}
	}

	VeQuickItem {
		id: isInverterChargerItem
		uid: root.serviceUid + "/IsInverterCharger"
	}

	VeQuickItem {
		id: numberOfAcInputs
		uid: root.serviceUid + "/Ac/NumberOfAcInputs"
	}

	VeQuickItem {
		id: hasAcPassthroughSupport
		uid: root.serviceUid + "/Capabilities/HasAcPassthroughSupport"
	}

	Component {
		id: buttonStyling

		RadioButtonControlValue {
			enabled: modelData.enabled !== false
			visible: modelData.visible !== false
			button.checked: modelData.value === root.mode
			label.text: root.showInverterModesOnly
					? Global.inverterChargers.inverterModeToText(modelData.value)
					: Global.inverterChargers.inverterChargerModeToText(modelData.value)
			separator.visible: model.index !== repeater.count - 1
			onClicked: root.mode = modelData.value
		}
	}
}
