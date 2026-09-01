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
	property VeQuickItem  syncTimeOperationStatus: VeQuickItem {
		id: syncTimeOperationStatus
		uid: mqttPrefix + "/Info/SyncTimeOperationStatus" 
	}
	property VeQuickItem  applyChanges: VeQuickItem {
		id: applyChanges
		uid: mqttPrefix + "/Info/ApplyChanges" 
	}

	// -------------------------------------------------
	property VeQuickItem  allowedMaxTimeRange: VeQuickItem {
		id: allowedMaxTimeRange
		uid: mqttPrefix + "/Info/AllowedMaxTimeRange" 
		onValueChanged:{
			if(value === 1){
				Global.showToastNotification(
					VenusOS.Notification_Info,
					qsTr("Start Time and End Time window must be 12 hours or less."),
					5000
					)
                allowedMaxTimeRange.setValue(0);   // reset
			}
		}
	}
	// -------------------------------------------------

	GradientListView {
		model: ObjectModel {

			ListTextField {
				text: "Start Time (HHMM)"
				dataItem.uid: mqttPrefix + "/Info/HeatStartTime"
				dataItem.invalidate: false
				maximumLength: 4
				preferredVisible: dataItem.valid
			}
			
			ListTextField {
				text: "End Time (HHMM)"
				dataItem.uid: mqttPrefix + "/Info/HeatEndTime"
				dataItem.invalidate: false
				maximumLength: 4
				preferredVisible: dataItem.valid

			}
			
			ListButton {
				text: "Set Heating Schedule"
				secondaryText: (applyChanges.value=== 1) ? qsTr("Apply") : qsTr("Apply")
				preferredVisible: true
				onClicked: {
					// Trigger the apply changes action
					Global.showToastNotification(
					VenusOS.Notification_Info,
					qsTr("Heating schedule changes are being applied to the driver."),
					3000
					)
                    applyChanges.setValue(1)
				}
			}


		}
	}


}