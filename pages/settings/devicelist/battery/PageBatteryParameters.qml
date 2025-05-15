/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix

	property VeQuickItem sfkFlag: VeQuickItem{
		id: sfkFlag
		uid: root.bindPrefix +  "/SFKbatteryflag"
	}	
	property VeQuickItem sfkvbFlag: VeQuickItem {
		id: sfkvbFlag
		uid: root.bindPrefix + "/SFKVBbatteryflag"
	}	
	property VeQuickItem versionFlag: VeQuickItem {
		id: versionFlag
		uid: root.bindPrefix +  "/SFKhardwareflag"
		}
	property VeQuickItem nrOfcell: VeQuickItem {
		id: nrOfcell
		uid: root.bindPrefix +   "/System/NrOfCellsPerBattery"
		}	

	GradientListView {
		model: VisibleItemModel {

			ListText {
				text: "Please Restart device to see changes."  // Directly assigning text as no translation ID exists
				// dataItem.uid: root.bindPrefix + "/Info/ChargeMode"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}

			ListText {
				text: "Charge Mode"  // Directly assigning text as no translation ID exists
				dataItem.uid: root.bindPrefix + "/Info/ChargeMode"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}
			
			ListQuantity {
				//% "Charge Voltage Limit (CVL)"
				text: qsTrId("batteryparameters_charge_voltage_limit_cvl")
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeVoltage"
				preferredVisible: !sfkFlag  // Control visibility based on your condition
				unit: VenusOS.Units_Volt_DC
			}

			ListRadioButtonGroup {
				text: "Charge Voltage Limit (CVL)"
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeVoltage"
				preferredVisible: sfkFlag  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1V").arg(nrOfcell.value*(3.400)), value: 3.400 },
					{ display: qsTr("%1V").arg(nrOfcell.value*(3.450)), value: 3.450 },
					{ display: qsTr("%1V %2").arg(nrOfcell.value*(3.500)).arg("[DEFAULT]"), value: 3.500 },
					{ display: qsTr("%1V").arg(nrOfcell.value*(3.550)), value: 3.550 },
					{ display: qsTr("%1V").arg(nrOfcell.value*(3.600)), value: 3.600 },					
				]
			}

			ListText {
				text: "Charge Limitation"  // Directly assigning text as no translation ID exists
				dataItem.uid: root.bindPrefix + "/Info/ChargeLimitation"  // Directly reading from the required path
				preferredVisible: sfkFlag  // Control visibility based on your condition
			}

			ListRadioButtonGroup {
				text: "Charge Current Limit (CCL)"
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeCurrent"
				preferredVisible: sfkFlag  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1A").arg(40.0), value: 40 },
					{ display: qsTr("%1A").arg(50.0), value: 50 },
					{ display: qsTr("%1A").arg(60.0), value: 60 },
					{ display: qsTr("%1A %2").arg(70.0).arg("[DEFAULT]"), value: 70 },
					{ display: qsTr("%1A").arg(80.0), value: 80 },
					{ display: qsTr("%1A").arg(90.0), value: 90 }
				]
			}

			ListQuantity {
				//% "Charge Current Limit (CCL)"
				text: qsTrId("batteryparameters_charge_current_limit_ccl")
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeCurrent"
				preferredVisible: !sfkFlag  // Control visibility based on your condition
				unit: VenusOS.Units_Amp
			}

			ListText {
				text: "Discharge Limitation"  // Directly assigning text as no translation ID exists
				dataItem.uid: root.bindPrefix + "/Info/DischargeLimitation"  // Directly reading from the required path
				preferredVisible: sfkFlag  // Control visibility based on your condition
			}

			ListRadioButtonGroup {
				text: "Discharge Current Limit (DCL)"
				dataItem.uid: root.bindPrefix + "/Info/MaxDischargeCurrent"
				preferredVisible: sfkFlag  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1A").arg(50.0), value: 50 },
					{ display: qsTr("%1A").arg(60.0), value: 60 },
					{ display: qsTr("%1A").arg(70.0), value: 70 },
					{ display: qsTr("%1A").arg(80.0), value: 80 },
					{ display: qsTr("%1A %2").arg(90.0).arg("[DEFAULT]"), value: 90 },
					{ display: qsTr("%1A").arg(100.0), value: 100 }
				]
			}

			ListQuantity {
				//% "Discharge Current Limit (DCL)"
				text: qsTrId("batteryparameters_discharge_current_limit_dcl")
				dataItem.uid: root.bindPrefix + "/Info/MaxDischargeCurrent"
				preferredVisible: !sfkFlag  // Control visibility based on your condition
				unit: VenusOS.Units_Amp
			}

			ListRadioButtonGroup {
				text: "SOC Reset Voltage"
				dataItem.uid: root.bindPrefix + "/Info/SOCResetVoltage"
				preferredVisible: sfkFlag  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1V").arg(3.500), value: 3.500 },
					{ display: qsTr("%1V").arg(3.550), value: 3.550 },
					{ display: qsTr("%1V %2").arg(3.600).arg("[DEFAULT]"), value: 3.600 },
					{ display: qsTr("%1V").arg(3.650), value: 3.650 }
				]
			}

			ListRadioButtonGroup {
				text: "Min Cell Voltage"
				dataItem.uid: root.bindPrefix + "/Info/MinCellVoltage"
				preferredVisible: sfkFlag  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1V").arg(2.700), value: 2.700 },
					{ display: qsTr("%1V").arg(2.800), value: 2.800 },
					{ display: qsTr("%1V %2").arg(2.900).arg("[DEFAULT]"), value: 2.900 },
					{ display: qsTr("%1V").arg(3.000), value: 3.000 }
				]
			}

			ListRadioButtonGroup {
				text: "Max Cell Voltage"
				dataItem.uid: root.bindPrefix + "/Info/MaxCellVoltage"
				preferredVisible: sfkFlag  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1V %2").arg(3.500).arg("[DEFAULT]"), value: 3.500 },
					{ display: qsTr("%1V").arg(3.550), value: 3.550 },
					{ display: qsTr("%1V").arg(3.600), value: 3.600 }
				]
			}

			ListRadioButtonGroup {
				text: "Float Cell Voltage"
				dataItem.uid: root.bindPrefix + "/Info/FloatCellVoltage"
				preferredVisible: sfkFlag  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1V %2").arg(3.325).arg("[DEFAULT]"), value: 3.325 },
					{ display: qsTr("%1V").arg(3.350), value: 3.350 },
					{ display: qsTr("%1V").arg(3.375), value: 3.375 }
				]
			}

			ListRadioButtonGroup {
				text: "Poll Rate"
				dataItem.uid: root.bindPrefix + "/BMSPollrate"
				preferredVisible: sfkFlag  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("1 Second"), value: 1000 },
					{ display: qsTr("2 Seconds %1").arg("[DEFAULT]"), value: 2000 },
					{ display: qsTr("3 Seconds"), value: 3000 }
				]
			}

			ListNavigation {
				text: "Regulate Max SOC Options"
				preferredVisible: sfkFlag  // Control visibility based on your condition
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatteryParametersRegulateSoc.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
			}

			ListQuantity {
				//% "Low Voltage Disconnect (always ignored)"
				text: qsTrId("batteryparameters_low_voltage_disconnect_always_ignored")
				dataItem.uid: root.bindPrefix + "/Info/BatteryLowVoltage"
				preferredVisible: dataItem.valid
				showAccessLevel: VenusOS.User_AccessType_Service
				unit: VenusOS.Units_Volt_DC
			}

			ListText {
				//: Shows if the battery requests charging: yes or no
				//% "Requests Charging"
				text: qsTrId("batteryparameters_charge_request")
				dataItem.uid: root.bindPrefix + "/Info/ChargeRequest"
				preferredVisible: dataItem.valid
				secondaryText: CommonWords.yesOrNo(dataItem.value)
			}
		}
	}
}
