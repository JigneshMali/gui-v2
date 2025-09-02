/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix
	property int lowtempDialogResult: 0   // <--- Global result variable	
	property VeQuickItem sfkVBDeviceInstance: VeQuickItem {
		id: sfkVBDeviceInstance
		uid: "mqtt/sfksettings/0/SfkVBDeviceInstance"
	}
		// Dynamic MQTT path base
	property string mqttPrefix: "mqtt/battery/" + sfkVBDeviceInstance.value
	property VeQuickItem heatSynchronizeActiveValue: VeQuickItem {
		id: heatSynchronizeActiveValue
		uid: mqttPrefix + "/Info/HeatSynchronizeActive"
	}
	property VeQuickItem heatingModeProgressbar: VeQuickItem {
		id: heatingModeProgressbar
		uid: mqttPrefix + "/Batteries/HeatingmodeProgressbar"
	}
    property VeQuickItem  sfksettingsHeatSynchronizeActiveValue: VeQuickItem { 
		id: sfksettingsHeatSynchronizeActiveValue
		uid: "mqtt/sfksettings/0/Info/HeatSynchronizeActive" 
        property bool completed: false   // track if 100% already reached
		onValueChanged: { 
				if (value === undefined)
                return;
				if (heatSynchronizeActiveValue.value === 1 && value === 100 && !completed) {
                var msg = qsTr("Set to Externally Managed. Process is %1% completed.").arg(value)
				Global.showToastNotification(
						VenusOS.Notification_Info,
						msg,
						3000
                		)
                if (value >= 100) {
                    completed = true   // stop further toasts
                }
            }
		}
	}

	function isCelsius() {
		return Global.systemSettings.temperatureUnit === VenusOS.Units_Temperature_Celsius;
	}

	function sfkSyncLowTempOptions() {
		if (isCelsius()) {
			return [
				// { display: qsTr("2°C - 10°C"), value: 0 },
				// { display: qsTr("5°C - 13°C"), value: 1 },
				// { display: qsTr("8°C - 16°C"), value: 2 }
				{ display: qsTr("30°C - 34°C"), value: 0 },
				{ display: qsTr("34°C - 38°C"), value: 1 },
				{ display: qsTr("38°C - 40°C"), value: 2 }
			];
		} else {
			return [
				// { display: qsTr("35°F - 50°F"), value: 0 },
				// { display: qsTr("41°F - 55°F"), value: 1 },
				// { display: qsTr("46°F - 60°F"), value: 2 }
				{ display: qsTr("86°F - 93.2°F"), value: 0 },
				{ display: qsTr("93.2°F - 100.4°F"), value: 1 },
				{ display: qsTr("100.4°F - 104°F"), value: 2 }
			];
		}
	}

	GradientListView {
		model: ObjectModel {

			// ListRadioButtonGroup {
			// 	text: "Enable Series Balance"
			// 	dataItem.uid: mqttPrefix + "/System/BalanceSeriesBatteries"
			// 	optionModel: [
			// 		{ display: qsTr("Yes"), value: "YES" },
			// 		{ display: qsTr("No"), value: "NO" }
			// 	]
			// }

			// ListSwitch {
			// 	text: "Synchronized Heating"
			// 	dataItem.uid:  mqttPrefix + "/Info/HeatSynchronizeActive"
			// 	preferredVisible: true
			// 	onClicked: Global.dialogLayer.open(confirmLowTempModesetoDialog)
			// }
			
			ListButton {
				text: "Synchronized Heating"
				secondaryText: (heatSynchronizeActiveValue.value=== 0) ? qsTr("Enable") : qsTr("Disable")
				preferredVisible: true
				onClicked: Global.dialogLayer.open(confirmLowTempModesetoDialog)
			}
			ListText {
				//% "Firmware Version"
				text:  qsTr("Setting to Externally Managed. Please wait until the process is completed... Progress: %1%").arg(heatingModeProgressbar.value)
				// dataItem.uid: mqttPrefix + "/Batteries/HeatingmodeProgressbar"
				preferredVisible: heatSynchronizeActiveValue.value === 1 && heatingModeProgressbar.value !== 100 
			}

			ListRadioButtonGroup {
				text: "Temperature Range"
				dataItem.uid: mqttPrefix + "/Info/SynchronizedLowTempOptions"
				optionModel: sfkSyncLowTempOptions()	
				preferredVisible: heatingModeProgressbar.value === 100 && ( heatSynchronizeActiveValue.value === 1 || heatSynchronizeActiveValue.value === 0)
			}
		}
	}

	Component {
		// id: confirmRestartDialog
		id: confirmLowTempModesetoDialog
		ModalWarningDialog {
			title: qsTr("Synchronized Heating")
			description: (heatSynchronizeActiveValue.value=== 0) ? qsTr("This will set the heating mode for all connected batteries to Externally Managed. Do you want to proceed?") : qsTr("Synchronized Heating is being disabled. Do you want to proceed?")
			// //% "Yes"
			// acceptText: qsTrId("common_words_yes")
			// //% "No"
			// rejectText: qsTrId("common_words_no")
			dialogDoneOptions: VenusOS.ModalDialog_DoneOptions_OkAndCancel
			onClosed: function() {
				lowtempDialogResult  = result 
				if (lowtempDialogResult  === 1) {
					if(heatSynchronizeActiveValue.value=== 0)
					{
						heatSynchronizeActiveValue.setValue(1)
						sfksettingsHeatSynchronizeActiveValue.setValue(1)
						Global.showToastNotification(
						VenusOS.Notification_Info,
						qsTr("Synchronized Heating set to Externally Managed."),
						5000
                		)
					}
					else if (heatSynchronizeActiveValue.value=== 1)
					{
						heatSynchronizeActiveValue.setValue(0)
						sfksettingsHeatSynchronizeActiveValue.setValue(0)
						Global.showToastNotification(
						VenusOS.Notification_Info,
						qsTr("Synchronized Heating is disabled"),
						5000
                		)
					}
					// Global.showToastNotification(
					// 	VenusOS.Notification_Info,
					// 	qsTr("Setting all connected batteries to Externally Managed."),
					// 	5000
                	// )
					}
				lowtempDialogResult  = 0   // Reset after processing
			}
		}
	}

}