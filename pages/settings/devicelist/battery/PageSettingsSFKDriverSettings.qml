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

	property VeQuickItem nrOfcell: VeQuickItem {
		id: nrOfcell
		uid: "mqtt/sfksettings/0/System/NrOfCellsPerBattery"
		}	
	
	property VeQuickItem sfkbatteriesServiceRestart: VeQuickItem {
		id: sfkbatteriesServiceRestart
		uid: "mqtt/sfksettings/0/RestartService"
		}
	
	property VeQuickItem sfkSaveSettingsEnabled: VeQuickItem {
		id: sfkSaveSettingsEnabled
		uid: "mqtt/sfksettings/0/Info/SaveSettingsEnabled"
		}	

	property VeQuickItem sfkVBDeviceInstance: VeQuickItem {
		id: sfkVBDeviceInstance
		uid: "mqtt/sfksettings/0/SfkVBDeviceInstance"
	}

	property VeQuickItem cvlCheckfloatbool: VeQuickItem {
		id: cvlCheckfloatbool
		uid: "mqtt/sfksettings/0/Info/CvlCheckfloat"
	}	

	property VeQuickItem floatCheckCvlbool: VeQuickItem {
		id: floatCheckCvlbool
		uid: "mqtt/sfksettings/0/Info/FloatCheckCvl"
	}
	
	// Dynamic MQTT path base
	property string mqttPrefix: "mqtt/battery/" + sfkVBDeviceInstance.value

	property VeQuickItem sfkvbServiceRestart: VeQuickItem {
		id: sfkvbServiceRestart
		uid: mqttPrefix + "/RestartService"
	}

	GradientListView {
		model: VisibleItemModel {

			ListText {
				text: "Please Restart device to see changes."  // Directly assigning text as no translation ID exists
				// dataItem.uid: "mqtt/sfksettings/0/Info/ChargeMode"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}
			
			ListRadioButtonGroup {
				text: "Connection Type"
				dataItem.uid: "mqtt/sfksettings/0/Bms_Connection_Type"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("RJ-45 / RS-485"), value: 1 },
					{ display: qsTr("USB-C"), value: 2 },
					{ display: qsTr("Auto Detect (Slower Detection)"), value: 0 }
				]
			}
            
			ListRadioButtonGroup {
				text: "Charge Voltage Limit (CVL)"
				dataItem.uid: "mqtt/sfksettings/0/Info/MaxChargeVoltage"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.400)), value: 3.400 },
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.425)), value: 3.425 },
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.450)), value: 3.450 },
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.475)), value: 3.475 },
                    { display:qsTr("%1V %2").arg(nrOfcell.value*(3.500)).arg("[DEFAULT]"), value: 3.500 },
                    { display:qsTr("%1V").arg(nrOfcell.value*(3.525)), value: 3.525 },
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.550)), value: 3.550 },
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.575)), value: 3.575 },
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.600)), value: 3.600 }				
				]
				onOptionClicked:{
					if(cvlCheckfloatbool.value === 1){
					Global.showToastNotification(VenusOS.Notification_Info,qsTr("Cvl can not be less than float."), 8000)
					cvlCheckfloatbool.setValue(0)
					}
				}
			}

			ListRadioButtonGroup {
				text: "Charge Current Limit (CCL)"
				dataItem.uid: "mqtt/sfksettings/0/Info/MaxChargeCurrent"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1A").arg(40.0), value: 40 },
					{ display: qsTr("%1A").arg(50.0), value: 50 },
					{ display: qsTr("%1A").arg(60.0), value: 60 },
					{ display: qsTr("%1A %2").arg(70.0).arg("[DEFAULT]"), value: 70 },
					{ display: qsTr("%1A").arg(80.0), value: 80 },
					{ display: qsTr("%1A").arg(90.0), value: 90 }
				]
            }

			ListRadioButtonGroup {
				text: "Discharge Current Limit (DCL)"
				dataItem.uid: "mqtt/sfksettings/0/Info/MaxDischargeCurrent"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1A").arg(50.0), value: 50 },
					{ display: qsTr("%1A").arg(60.0), value: 60 },
					{ display: qsTr("%1A").arg(70.0), value: 70 },
					{ display: qsTr("%1A").arg(80.0), value: 80 },
					{ display: qsTr("%1A %2").arg(90.0).arg("[DEFAULT]"), value: 90 },
					{ display: qsTr("%1A").arg(100.0), value: 100 }
				]
			}

			ListRadioButtonGroup {
				text: "Min Cell Voltage"
				dataItem.uid: "mqtt/sfksettings/0/Info/MinCellVoltage"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1V").arg(2.700), value: 2.700 },
					{ display: qsTr("%1V").arg(2.800), value: 2.800 },
					{ display: qsTr("%1V %2").arg(2.900).arg("[DEFAULT]"), value: 2.900 },
					{ display: qsTr("%1V").arg(3.000), value: 3.000 }
				]
			}

			// ListRadioButtonGroup {
			// 	text: "Max Cell Voltage"
			// 	dataItem.uid: "mqtt/sfksettings/0/Info/MaxCellVoltage"
			// 	preferredVisible: true  // Control visibility based on your condition
			// 	optionModel: [
			// 		{ display: qsTr("%1V %2").arg(3.500).arg("[DEFAULT]"), value: 3.500 },
			// 		{ display: qsTr("%1V").arg(3.550), value: 3.550 },
			// 		{ display: qsTr("%1V").arg(3.600), value: 3.600 }
			// 	]
			// }

			ListRadioButtonGroup {
				text: "Float Cell Voltage"
				dataItem.uid: "mqtt/sfksettings/0/Info/FloatCellVoltage"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.250)).arg((3.250)), value: 3.250 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.275)).arg((3.275)), value: 3.275 },
					{ display: qsTr("%1V (%2V/cell) [DEFAULT]").arg(nrOfcell.value*(3.300)).arg((3.300)), value: 3.300 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.325)).arg((3.325)), value: 3.325 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.350)).arg((3.350)), value: 3.350 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.375)).arg((3.375)), value: 3.375 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.400)).arg((3.400)), value: 3.400 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.425)).arg((3.425)), value: 3.425 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.450)).arg((3.450)), value: 3.450 }
				]
				onOptionClicked:{
					if(floatCheckCvlbool.value === 1 ){
					Global.showToastNotification(VenusOS.Notification_Info,qsTr("Float can not be higher than cvl."), 8000)
					floatCheckCvlbool.setValue(0)
					}
				}
			}

			ListRadioButtonGroup {
				text: "Poll Rate"
				dataItem.uid: "mqtt/sfksettings/0/BMSPollrate"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("1 Second"), value:  1000 },
					{ display: qsTr("2 Seconds"), value: 2000 },
					{ display: qsTr("3 Seconds"), value: 3000 },
					{ display: qsTr("4 Seconds"), value: 4000 },
					{ display: qsTr("5 Seconds %1").arg("[DEFAULT]"), value: 5000 },
					{ display: qsTr("6 Seconds"), value: 6000 },
					{ display: qsTr("7 Seconds"), value: 7000 },
					{ display: qsTr("8 Seconds"), value: 8000 },
					{ display: qsTr("9 Seconds"), value: 9000 },
					{ display: qsTr("10 Seconds"), value: 10000 },
					{ display: qsTr("11 Seconds"), value: 11000 },
					{ display: qsTr("12 Seconds"), value: 12000 }

				]
			}
			
			ListRadioButtonGroup {
				text: "Absorption to Float transition time"
				dataItem.uid: "mqtt/sfksettings/0/Info/MaxVoltageTimeSec"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("5 Mins"), value:  300 },
					{ display: qsTr("10 Mins"), value: 600 },
					{ display: qsTr("15 Mins %1").arg("[DEFAULT]"), value: 900 },
					{ display: qsTr("20 Mins"), value: 1200 },
					{ display: qsTr("25 Mins"), value: 1500 },
					{ display: qsTr("30 Mins"), value: 1800 }
				]
			}
			
			ListRadioButtonGroup {
				text: "Charge Voltage Compensation"
				dataItem.uid: "mqtt/sfksettings/0/Info/VoltageDrop"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("0 mV"), value:  0 },
					{ display: qsTr("25 mV"), value: 25 },
					{ display: qsTr("50 mV %1").arg("[DEFAULT]"), value: 50 },
					{ display: qsTr("75 mV"), value: 75 },
					{ display: qsTr("100 mV"), value: 100 },
					{ display: qsTr("125 mV"), value: 125 },
					{ display: qsTr("150 mV"), value: 150 },
					{ display: qsTr("175 mV"), value: 175 },
					{ display: qsTr("200 mV"), value: 200 }
				]			
			}

			ListRadioButtonGroup {
				text: "Float to Bulk Transition SOC"
				dataItem.uid: "mqtt/sfksettings/0/Info/FloatToBulkSOCLimit"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("60 %"), value: 60 },
					{ display: qsTr("65 %"), value: 65 },
					{ display: qsTr("70 %"), value: 70 },
					{ display: qsTr("75 %"), value: 75 },
					{ display: qsTr("80 % [DEFAULT]"), value: 80 },
					{ display: qsTr("85 %"), value: 85 },
					{ display: qsTr("90 %"), value: 90 }
				]
			}
			ListRadioButtonGroup {
				text: "BMS Detection Delay"
				dataItem.uid: "mqtt/sfksettings/0/BmsDetectionDelay"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("5 Seconds"), value: 5 },
					{ display: qsTr("10 Seconds [DEFAULT]"), value: 10 },
					{ display: qsTr("15 Seconds"), value: 15 },
					{ display: qsTr("20 Seconds"), value: 20 }
				]
				onOptionClicked:{
					Global.showToastNotification(VenusOS.Notification_Info,qsTr("Please restart device to see changes."), 5000)
				}
			}

			ListSwitch {
				text: "Detail Logging"
				dataItem.uid: "mqtt/sfksettings/0/Log/SfkDetailLogging"
				preferredVisible: true
			}

			ListSwitch {
				text: "Debug Logging"
				dataItem.uid: "mqtt/sfksettings/0/Log/SfkDebugLogging"
				preferredVisible: true
			}

			ListButton {
				text: qsTr("Apply Changes")
				secondaryText: qsTr("Save Changes w/o Restart")
				preferredVisible: true
				onClicked: Global.dialogLayer.open(saveSFKSettingsDialog)
			}
			
			ListButton {
				text: qsTr("Restart Service")
				secondaryText: qsTr("Save Changes and Restart")
				preferredVisible: true
				onClicked: Global.dialogLayer.open(confirmRestartDialog)
			}
		}
	}
	
	Component {
		id: confirmRestartDialog
		ModalWarningDialog {
			title: qsTr("Restart Service")
			description: qsTr("This will restart the main SFK Venus OS Driver & Virtual Battery (if active). %1").arg("DVCC may detect BMS lost momentarily while the driver is being restarted.")
			// dialogDoneOptions: "OkAndCancel"  // error of int expected 
			dialogDoneOptions: VenusOS.ModalDialog_DoneOptions_OkAndCancel
			onClosed: function() {
				globalDialogResult  = result 
				if (globalDialogResult  === 1) {
					Global.showToastNotification(
						VenusOS.Notification_Info,
						qsTr("Main SFK Venus OS Driver service restarting...."),
						5000
                	)
					sfkbatteriesServiceRestart.setValue(1)
					if (sfkvbServiceRestart.valid) 
					{
						sfkvbServiceRestart.setValue(1)
					}
					}
				globalDialogResult  = 0   // Reset after processing
			}
		}
	}
	Component {
		id: saveSFKSettingsDialog
		ModalWarningDialog {
			title: qsTr("Apply Changes")
			description: qsTr("This will apply changes without restarting the driver.")
			// dialogDoneOptions: "OkAndCancel"  // error of int expected 
			dialogDoneOptions: VenusOS.ModalDialog_DoneOptions_OkAndCancel
			onClosed: function() {
				globalDialogResult  = result 
				if (globalDialogResult  === 1) {
					sfkSaveSettingsEnabled.setValue(1)
					Global.showToastNotification(
						VenusOS.Notification_Info,
						qsTr("Changes are being applied to the driver."),
						8000
                	)
					}
				globalDialogResult  = 0   // Reset after processing
			}
		}
	}
}
