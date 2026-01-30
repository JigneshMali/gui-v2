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

	// -------------------------------------------------
	property VeQuickItem  syncTimeOperationEnabled: VeQuickItem {
		id: syncTimeOperationEnabled
		uid: mqttPrefix + "/Info/SyncTimeOperationEnabled" 
	}
	// -------------------------------------------------
	property VeQuickItem  wrongTimeInput: VeQuickItem {
		id: wrongTimeInput
		uid: mqttPrefix + "/Info/WrongTimeInput" 
		onValueChanged:{
			if(value === 1){
				Global.showToastNotification(
					VenusOS.Notification_Info,
					qsTr("Invalid time input. Use HHMM and input must be between 0000 to 2359."),
					5000
					)
                wrongTimeInput.setValue(0);   // reset
			}
		}
	}
	// -------------------------------------------------
	property VeQuickItem  allowedStartTimeRange: VeQuickItem {
		id: allowedStartTimeRange
		uid: mqttPrefix + "/Info/AllowedStartTimeRange" 
		onValueChanged:{
			if(value === 1){
				Global.showToastNotification(
					VenusOS.Notification_Info,
					qsTr("StartTime must be between 2100 to 0400."),
					5000
					)
                allowedStartTimeRange.setValue(0);   // reset
			}
		}
	}
	// -------------------------------------------------
	property VeQuickItem  allowedMaxTimeRange: VeQuickItem {
		id: allowedMaxTimeRange
		uid: mqttPrefix + "/Info/AllowedMaxTimeRange" 
		onValueChanged:{
			if(value === 1){
				Global.showToastNotification(
					VenusOS.Notification_Info,
					qsTr("StartTime and EndTime window must be 12 hours or less."),
					5000
					)
                allowedMaxTimeRange.setValue(0);   // reset
			}
		}
	}
	// -------------------------------------------------


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


	GradientListView {
		model: ObjectModel {

			ListTextField {
				text: "Start Time (HHMM)"
				dataItem.uid: mqttPrefix + "/Info/HeatStartTime"
				dataItem.invalidate: false
				textField.maximumLength: 4
				preferredVisible: dataItem.valid
				property string oldValue: ""
				textField.onAccepted: {
					oldValue = dataItem.value
					if (textField.text.length == 1) {
						dataItem.value = "000" + textField.text  // Store only if exactly 4 digits
						// textField.text = dataItem.value             
					} else if (textField.text.length == 2) {
						dataItem.value = "00" + textField.text  // Store only if exactly 4 digits
						// textField.text = dataItem.value             
					}  else if (textField.text.length == 3) {
						dataItem.value = "0" + textField.text  // Store only if exactly 4 digits
						// textField.text = dataItem.value             
					} else if (textField.text.length == 4) {
						dataItem.value = textField.text  // Store only if exactly 4 digits
						// textField.text = dataItem.value             
					}
				}
			}
			
			ListTextField {
				text: "End Time (HHMM)"
				dataItem.uid: mqttPrefix + "/Info/HeatEndTime"
				dataItem.invalidate: false
				textField.maximumLength: 4
				preferredVisible: dataItem.valid
				textField.onAccepted: {
					if (textField.text.length == 1) {
						dataItem.value = "000" + textField.text  // Store only if exactly 4 digits
						// textField.text = dataItem.value             
					} else if (textField.text.length == 2) {
						dataItem.value = "00" + textField.text  // Store only if exactly 4 digits
						// textField.text = dataItem.value             
					}  else if (textField.text.length == 3) {
						dataItem.value = "0" + textField.text  // Store only if exactly 4 digits
						// textField.text = dataItem.value             
					} else if (textField.text.length == 4) {
						dataItem.value = textField.text  // Store only if exactly 4 digits
						// textField.text = dataItem.value             
					}
				}
			}
			
			ListText {
				text: "Synchronize Heating Time Operation"
				dataItem.uid: mqttPrefix + "/Info/SyncTimeOperationEnabled"
				preferredVisible: dataItem.valid
				secondaryText: {
					if (dataItem.value === 0) {
						qsTr("Inactive")
					} else {
						qsTr("Active")
					}
				}
			}

		}
	}


}