/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS
// import Victron.Mqtt      // <-- this hook makes “mqtt/…” UIDs work
Page {
	id: root
    property string sfkService: "com.victronenergy.sfksettings"
    property string bindPrefix: "mqtt/sfksettings/0"


	property VeQuickItem sfkVBDeviceInstance: VeQuickItem {
		id: sfkVBDeviceInstance
		uid: "mqtt/sfksettings/0/SfkVBDeviceInstance"
	}
	
	// Dynamic MQTT path base
	property string mqttPrefix: "mqtt/battery/" + sfkVBDeviceInstance.value
	property VeQuickItem sfkSubmitDriverHelpFile: VeQuickItem {
		id: sfkSubmitDriverHelpFile
		uid: "mqtt/sfksettings/0/System/SFKSubmitDriverHelpFile"
	}
	property VeQuickItem sfkSubmitDriverHelpFileProgress: VeQuickItem {
		id: sfkSubmitDriverHelpFileProgress
		uid: "mqtt/sfksettings/0/System/SFKSubmitDriverHelpFileProgress"
	}

	GradientListView {
		model: VisibleItemModel {
			
			ListText {
				//% "Firmware Version"
				text:  qsTr("SFK Driver Version")
				dataItem.uid:"mqtt/sfksettings/0/FirmwareVersion"
				preferredVisible: true
			}

			ListNavigation {
				text: qsTr("Update SFK Driver")
				preferredVisible:  true
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsSFKUpdateDriver.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: qsTr("Uninstall SFK Driver")
				preferredVisible:  true
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsSFKUninstallDriver.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: "Virtual Battery"
				preferredVisible: true
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatteryVirtualSetupEnable.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
			}

			ListNavigation {
				text: "Driver Settings"
				preferredVisible: true
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsSFKDriverSettings.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
			}
			
			ListButton 
			{
				text: qsTr("Submit Diagnostic Report")
				secondaryText:sfkSubmitDriverHelpFileProgress.value === 100
						? qsTr("Submitted")
					: sfkSubmitDriverHelpFile.value === 1
						? qsTr("Submitting %1%").arg(sfkSubmitDriverHelpFileProgress.value)
					: qsTr("Submit")

				preferredVisible: true
				onClicked:{
					if (sfkSubmitDriverHelpFile.value === 1)
					{
						sfkSubmitDriverHelpFile.setValue(0)
					}
					if (sfkSubmitDriverHelpFile.value === 0)
					{
						sfkSubmitDriverHelpFile.setValue(1)
						Global.showToastNotification(
							VenusOS.Notification_Info,
							qsTr("Submitting Diagnostic Report..."),
							5000
						)
					}
				}
			}

		}


	}
}
