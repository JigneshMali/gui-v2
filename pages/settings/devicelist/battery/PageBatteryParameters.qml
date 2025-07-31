/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix
	property int globalDialogResult: 0   // <--- Global result variable	


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
	property VeQuickItem heatingTest: VeQuickItem {
		id: heatingTest
		uid: root.bindPrefix +   "/System/SFKHeatingTestAction"
	}

	GradientListView {
		model: VisibleItemModel {

			ListButton {
				text: qsTr("Heating Test")
				secondaryText: qsTr("Heating Test")
				preferredVisible: true
				onClicked: Global.dialogLayer.open(confirmRestartDialog)
			}

			ListText {
				text: "Charge Mode"  // Directly assigning text as no translation ID exists
				dataItem.uid: root.bindPrefix + "/Info/ChargeMode"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}

			ListText {
				text: "Charge Limitation"  // Directly assigning text as no translation ID exists
				dataItem.uid: root.bindPrefix + "/Info/ChargeLimitation"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}
			ListText {
				text: "Discharge Limitation"  // Directly assigning text as no translation ID exists
				dataItem.uid: root.bindPrefix + "/Info/DischargeLimitation"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}

			ListQuantity {
				//% "Charge Voltage Limit (CVL)"
				text: qsTrId("batteryparameters_charge_voltage_limit_cvl")
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeVoltage"
				preferredVisible:sfkvbFlag  // Control visibility based on your condition
				unit: VenusOS.Units_Volt_DC
			}

			ListQuantity {
				//% "Charge Current Limit (CCL)"
				text: qsTrId("batteryparameters_charge_current_limit_ccl")
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeCurrent"
				preferredVisible: sfkvbFlag  // Control visibility based on your condition
				unit: VenusOS.Units_Amp
			}

			ListQuantity {
				//% "Discharge Current Limit (DCL)"
				text: qsTrId("batteryparameters_discharge_current_limit_dcl")
				dataItem.uid: root.bindPrefix + "/Info/MaxDischargeCurrent"
				preferredVisible: sfkvbFlag  // Control visibility based on your condition
				unit: VenusOS.Units_Amp
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
	Component {
		id: confirmRestartDialog
		ModalWarningDialog {
			title: qsTr("Heating Test")
			description: qsTr("This will start Heating Test.")
			// dialogDoneOptions: "OkAndCancel"  // error of int expected 
			dialogDoneOptions: VenusOS.ModalDialog_DoneOptions_OkAndCancel
			onClosed: function() {
				globalDialogResult  = result 
				if (globalDialogResult  === 1) {
					heatingTest.setValue(1)
					Global.showToastNotification(
						VenusOS.Notification_Info,
						qsTr("  Heating Test starting..."),
						5000
                	)
					}
				globalDialogResult  = 0   // Reset after processing
			}
		}
	}
}
