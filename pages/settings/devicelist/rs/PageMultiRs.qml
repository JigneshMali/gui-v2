/*
** Copyright (C) 2024 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix
	readonly property bool multiPhase: numberOfPhases.isValid && numberOfPhases.value >= 2 && !_phase.isValid
	readonly property int trackerCount: numberOfTrackers.value || 0

	VeQuickItem {
		id: numberOfPhases
		uid: root.bindPrefix + "/Ac/NumberOfPhases"
	}

	VeQuickItem {
		id: _phase
		uid: root.bindPrefix + "/Settings/System/AcPhase"
	}

	VeQuickItem {
		id: numberOfTrackers
		uid: root.bindPrefix + "/NrOfTrackers"
	}

	VeQuickItem {
		id: pvTotalPower
		uid: root.bindPrefix + "/Yield/Power"
	}

	VeQuickItem {
		id: pvVoltage
		uid: root.bindPrefix + "/Pv/V"
	}

	GradientListView {
		model: ObjectModel {
			ListTextItem {
				text: CommonWords.state
				secondaryText: Global.system.systemStateToText(dataItem.value)
				dataItem.uid: root.bindPrefix + "/State"
			}

			ListQuantityItem {
				text: CommonWords.state_of_charge
				dataItem.uid: root.bindPrefix + "/Soc"
				unit: VenusOS.Units_Percentage
			}

			ListTemperatureItem {
				text: CommonWords.battery_temperature
				dataItem.uid: root.bindPrefix + "/Dc/0/Temperature"
				allowed: dataItem.isValid
			}

			ActiveAcInputTextItem {
				bindPrefix: root.bindPrefix
			}

			Loader {
				width: parent ? parent.width : 0
				sourceComponent: root.multiPhase ? threePhaseTables : singlePhaseAcInOut
			}

			ListDcOutputQuantityGroup {
				text: CommonWords.dc
				bindPrefix: root.bindPrefix
			}

			Loader {
				width: parent ? parent.width : 0
				sourceComponent: root.trackerCount === 1 ? singleTrackerComponent
						: root.trackerCount > 1 ? multiTrackerComponent
						: null
			}

			ListQuantityItem {
				//% "Total yield"
				text: qsTrId("settings_multirs_total_yield")
				allowed: root.trackerCount > 0
				unit: VenusOS.Units_Energy_KiloWattHour
				dataItem.uid: root.bindPrefix + "/Yield/User"
			}

			ListQuantityItem {
				//% "System yield"
				text: qsTrId("settings_multirs_system_yield")
				allowed: root.trackerCount > 0
				unit: VenusOS.Units_Energy_KiloWattHour
				dataItem.uid: root.bindPrefix + "/Yield/System"
			}

			ListTextItem {
				text: CommonWords.error
				dataItem.uid: root.bindPrefix + "/ErrorCode"
				secondaryText: dataItem.isValid ? ChargerError.description(dataItem.value) : dataItem.invalidText
			}

			ListRelayState {
				dataItem.uid: root.bindPrefix + "/Relay/0/State"
			}

			ListNavigationItem {
				text: CommonWords.daily_history
				allowed: root.trackerCount > 0
				onClicked: {
					//: Multi RS historic PV data information. %1 = Multi RS name
					//% "%1 History"
					const title = qsTrId("settings_multirs_history_name").arg(root.title)
					Global.pageManager.pushPage("/pages/solar/SolarHistoryPage.qml",
							{ "title": title, "solarHistory": solarHistory })
				}

				SolarHistory {
					id: solarHistory
					bindPrefix: root.bindPrefix
					deviceName: root.title
					trackerCount: root.trackerCount
				}
			}

			ListNavigationItem {
				text: CommonWords.overall_history
				allowed: root.trackerCount > 0
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/inverter/PageSolarStats.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigationItem {
				text: CommonWords.alarm_status
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/rs/PageRsAlarms.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigationItem {
				text: CommonWords.device_info_title
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/PageDeviceInfo.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}
		}
	}

	Component {
		id: singlePhaseAcInOut

		Column {
			readonly property string singlePhaseName: _phase.value === 2 ? "L3"
					: _phase.value === 1 ? "L2"
					: "L1"  // _phase.value === 0 || !_phase.isValid

			PVCFListQuantityGroup {
				//: %1 = phase name (e.g. L1, L2, L3)
				//% "AC in %1"
				text: qsTrId("settings_multirs_ac_in_phase").arg(singlePhaseName)
				data: AcPhase { serviceUid: root.bindPrefix + "/Ac/In/1/" + singlePhaseName }
			}

			PVCFListQuantityGroup {
				//: %1 = phase name (e.g. L1, L2, L3)
				//% "AC out %1"
				text: qsTrId("settings_multirs_ac_out_phase").arg(singlePhaseName)
				data: AcPhase { serviceUid: root.bindPrefix + "/Ac/Out/" + singlePhaseName }
			}
		}
	}

	Component {
		id: threePhaseTables

		ThreePhaseIOTable {
			width: parent ? parent.width : 0
			phaseCount: numberOfPhases.value || 0
			inputPhaseUidPrefix: root.bindPrefix + "/Ac/In/1"
			outputPhaseUidPrefix: root.bindPrefix + "/Ac/Out"
			voltPrecision: 1
		}
	}

	Component {
		id: singleTrackerComponent

		ListQuantityGroup {
			readonly property real pvCurrent: (pvVoltage.value || 0) === 0 || !pvTotalPower.isValid ? NaN
					: pvTotalPower.value / pvVoltage.value

			//% "PV"
			text: qsTrId("settings_multirs_pv")
			textModel: [
				{ value: pvVoltage.value, unit: VenusOS.Units_Volt_DC },
				{ value: pvCurrent, unit: VenusOS.Units_Amp, visible: pvVoltage.isValid },
				{ value: pvTotalPower.value, unit: VenusOS.Units_Watt },
			]
		}
	}

	Component {
		id: multiTrackerComponent

		Column {
			width: parent ? parent.width : 0

			ListQuantityItem {
				//% "Total PV Power"
				text: qsTrId("settings_multirs_total_pv_power")
				dataItem.uid: root.bindPrefix + "/Yield/Power"
				unit: VenusOS.Units_Watt
			}

			ListItem {
				//% "Trackers"
				text: qsTrId("settings_multirs_trackers")

				bottomContentChildren: [
					QuantityTable {
						headerVisible: false
						rowCount: root.trackerCount
						units: [
							{ unit: VenusOS.Units_None },
							{ unit: VenusOS.Units_Volt_DC },
							{ unit: VenusOS.Units_Amp },
							{ unit: VenusOS.Units_Watt },
						]
						valueForModelIndex: function(trackerIndex, column) {
							const tracker = trackerObjects.objectAt(trackerIndex)
							if (column === 0) {
								return Global.solarChargers.formatTrackerName(tracker.name,
										trackerIndex, root.trackerCount, root.title,
										VenusOS.TrackerName_NoDevicePrefix)
							} else if (column === 1) {
								return tracker.voltage
							} else if (column === 2) {
								return tracker.current
							} else if (column === 3) {
								return tracker.power
							}
						}

						Instantiator {
							id: trackerObjects
							model: root.trackerCount
							delegate: QtObject {
								required property int index
								readonly property real power: _power.isValid ? _power.value : NaN
								readonly property real voltage: _voltage.isValid ? _voltage.value : NaN
								readonly property real current: !_power.isValid || !_voltage.isValid || voltage === 0 ? NaN : power / voltage
								readonly property string name: _name.value || ""

								readonly property VeQuickItem _voltage: VeQuickItem { uid: root.bindPrefix + "/Pv/" + index + "/V" }
								readonly property VeQuickItem _power: VeQuickItem { uid: root.bindPrefix + "/Pv/" + index + "/P" }
								readonly property VeQuickItem _name: VeQuickItem { uid: root.bindPrefix + "/Pv/" + index + "/Name" }
							}
						}
					}
				]
			}
		}
	}
}
