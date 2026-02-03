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
	property VeQuickItem totalBatteryCount: VeQuickItem {
		id: totalBatteryCount
		uid: mqttPrefix + "/Batteries/TotalBatteryCount"
	}
	property VeQuickItem settingBatteryCount: VeQuickItem {
		id: settingBatteryCount
		uid: mqttPrefix + "/Batteries/SettingBatteryCount"
	}
	property VeQuickItem allVersion64bool: VeQuickItem {
		id: allVersion64bool
		uid: mqttPrefix + "/Batteries/AllVersion64"
	}
	property VeQuickItem  syncTimeOperationEnabled: VeQuickItem {
		id: syncTimeOperationEnabled
		uid: mqttPrefix + "/Info/SyncTimeOperationEnabled" 
	}
    property VeQuickItem  sfksettingsHeatSynchronizeActiveValue: VeQuickItem { 
		id: sfksettingsHeatSynchronizeActiveValue
		uid: "mqtt/sfksettings/0/Info/HeatSynchronizeActive" 
        property bool completed: false   // track if 100% already reached
		onValueChanged: { 
				if (value === undefined)
                return;
				if (heatSynchronizeActiveValue.value === 1 && value === 100 && !completed) {
                var msg = qsTr("Set to Externally Managed. All batteries are in low temp charge heating mode.")
                // var msg = qsTr("Set to Externally Managed. Process is %1% completed.").arg(value)
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
				{ display: qsTr("2°C - 10°C"), value: 0 },
				{ display: qsTr("5°C - 13°C"), value: 1 },
				{ display: qsTr("8°C - 16°C"), value: 2 }
				// { display: qsTr("30°C - 34°C"), value: 0 },
				// { display: qsTr("34°C - 38°C"), value: 1 },
				// { display: qsTr("38°C - 40°C"), value: 2 }
			];
		} else {
			return [
				{ display: qsTr("35°F - 50°F"), value: 0 },
				{ display: qsTr("41°F - 55°F"), value: 1 },
				{ display: qsTr("46°F - 60°F"), value: 2 }
				// { display: qsTr("86°F - 93.2°F"), value: 0 },
				// { display: qsTr("93.2°F - 100.4°F"), value: 1 },
				// { display: qsTr("100.4°F - 104°F"), value: 2 }
			];
		}
	}

	GradientListView {
		model: ObjectModel {

			ListText {
				text: qsTr("All batteries must have compatible hardware version (v6.4) to use Synchronized Heating.")
				preferredVisible: allVersion64bool.value === 0
			}
			
			// ListButton {
			// 	text: "Synchronized Heating"
			// 	secondaryText: (heatSynchronizeActiveValue.value=== 0) ? qsTr("Enable") : qsTr("Disable")
			// 	preferredVisible: allVersion64bool.value === 1 
			// 	onClicked: Global.dialogLayer.open(confirmLowTempModesetoDialog)
			// }
			ListSwitch {
				text: "Synchronized Heating"
				dataItem.uid: mqttPrefix + "/Info/HeatSynchronizeActive"
				preferredVisible: true
				// onClicked: Global.dialogLayer.open(confirmLowTempModesetoDialog)
				onClicked: {
					if (!checked) {
						heatSynchronizeActiveValue.setValue(0)
						Global.dialogLayer.open(confirmLowTempModesetoDialog)
					}
					else if(checked){
						heatSynchronizeActiveValue.setValue(1)
						Global.dialogLayer.open(confirmLowTempModesetoDialog)
					}
				}

			}

			ListText {
				//% "Firmware Version"
				text:  qsTr("Setting to Externally Managed. Setting Battery %1 of %2 to low temp charge heating mode.").arg(settingBatteryCount.value).arg(totalBatteryCount.value)
				// text:  qsTr("Setting to Externally Managed. Please wait until the process is completed... Progress: %1%").arg(heatingModeProgressbar.value)
				preferredVisible: heatSynchronizeActiveValue.value === 1 && heatingModeProgressbar.value !== 100  && allVersion64bool.value === 1 
			}

			ListRadioButtonGroup {
				text: "Temperature Range"
				dataItem.uid: mqttPrefix + "/Info/SynchronizedLowTempOptions"
				optionModel: sfkSyncLowTempOptions()	
				preferredVisible: heatingModeProgressbar.value === 100 && ( heatSynchronizeActiveValue.value === 1 || heatSynchronizeActiveValue.value === 0) && allVersion64bool.value === 1 
			}
			
			ListRadioButtonGroup {
				text: "Minimum SOC"
				dataItem.uid: mqttPrefix + "/Info/SynchronizedMinSOC"
				preferredVisible: heatingModeProgressbar.value === 100 && ( heatSynchronizeActiveValue.value === 1 || heatSynchronizeActiveValue.value === 0) && allVersion64bool.value === 1 
				optionModel: [
					{ display: qsTr("%1%").arg(20), value: 20 },
					{ display: qsTr("%1%").arg(25), value: 25 },
					{ display: qsTr("%1% %2").arg(30).arg("[DEFAULT]"), value: 30 },
					{ display: qsTr("%1%").arg(35), value: 35 },
					{ display: qsTr("%1%").arg(40), value: 40 },
					{ display: qsTr("%1%").arg(45), value: 45 },
					{ display: qsTr("%1%").arg(50), value: 50 }
				]
			}

			ListSwitch {
				text: "Scheduled Heating"
				dataItem.uid: mqttPrefix + "/Info/SyncTimeOperationEnabled"
				preferredVisible: true
				onClicked: {
					if (!checked) {
						syncTimeOperationEnabled.setValue(0)
					}
					else if(checked){
						syncTimeOperationEnabled.setValue(1)
					}
				}
			}

			ListNavigation {
				text: "Heating Schedule"
				preferredVisible: syncTimeOperationEnabled.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsVirtualBatterySynchronizedHeatingTimeoperation.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
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
						qsTr("Synchronized Heating is enabled."),
						5000
                		)
					}
					else if (heatSynchronizeActiveValue.value=== 1)
					{
						heatSynchronizeActiveValue.setValue(0)
						sfksettingsHeatSynchronizeActiveValue.setValue(0)
						Global.showToastNotification(
						VenusOS.Notification_Info,
						qsTr("Synchronized Heating is disabled."),
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