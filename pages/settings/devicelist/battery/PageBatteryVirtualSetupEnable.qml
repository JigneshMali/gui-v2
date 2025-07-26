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
	// Add VeQuickItem to observe the selected logic
	property VeQuickItem sfkVirtualBatteryLogic: VeQuickItem {
		id: sfkVirtualBatteryLogic
		uid: "mqtt/sfksettings/0/SfkVirtualBatteryLogic"
	}

	property VeQuickItem sfkVBDeviceInstance: VeQuickItem {
		id: sfkVBDeviceInstance
		uid: "mqtt/sfksettings/0/SfkVBDeviceInstance"
	}
	
	// Dynamic MQTT path base
	property string mqttPrefix: "mqtt/battery/" + sfkVBDeviceInstance.value

	property VeQuickItem sfkvbServiceRestart: VeQuickItem {
		id: sfkvbServiceRestart
		uid: mqttPrefix + "/RestartService"
	}
	
	GradientListView {
		model: ObjectModel {

			ListSwitch {
				text: "Virtual Battery"
				dataItem.uid: "mqtt/sfksettings/0/SfkVirtualBatteryActive"
				preferredVisible: true
			}

			ListNavigation {
				text: "Battery Configuration"
				preferredVisible: true
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsSFKVirtualSetupSystem.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
			}
			
			ListRadioButtonGroup {
				text: "Charge Mode Transition"
				dataItem.uid: "mqtt/sfksettings/0/Info/SfkVbChargeModeOptions"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
                    { display: qsTr("All Batteries in Float"), value: 0 },
                    { display: qsTr("Common Charge Status"), value: 1 }
				]
			}

			ListSwitch {
				text: "Detail Logging"
				dataItem.uid: "mqtt/sfksettings/0/Log/SfkVbDetailLogging"
				preferredVisible: true
			}

			ListSwitch {
				text: "Debug Logging"
				dataItem.uid: "mqtt/sfksettings/0/Log/SfkVbDebugLogging"
				preferredVisible: true
			}
		
			ListButton {
				text: qsTr("Apply Changes")
				secondaryText: qsTr("Restart Virtual Battery")
				preferredVisible: true
				onClicked: Global.dialogLayer.open(confirmRestartDialog)
			}

			// ListRebootButton { }

		}
	}

	Component {
		id: confirmRestartDialog
		ModalWarningDialog {
			title: qsTr("Apply Changes")
			description: qsTr("This will restart the SFK Virtual Battery.")
			// dialogDoneOptions: "OkAndCancel"  // error of int expected 
			dialogDoneOptions: VenusOS.ModalDialog_DoneOptions_OkAndCancel
			onClosed: function() {
				globalDialogResult  = result 
				if (globalDialogResult  === 1) {
					sfkvbServiceRestart.setValue(1)
					Global.showToastNotification(
						VenusOS.Notification_Info,
						qsTr("Virtual Battery service restarting..."),
						5000
                	)
					}
				globalDialogResult  = 0   // Reset after processing
			}
		}
	}
	// React to changes using Connections on the VeQuickItem
	Connections {
    target: sfkVirtualBatteryLogic
    function onValueChanged() {
        Global.showToastNotification(
            VenusOS.Notification_Info,
            qsTr("Please reboot device to see changes"),
            5000
			)
		}
	}


}