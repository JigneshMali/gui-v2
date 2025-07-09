/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix
	// Add VeQuickItem to observe the selected logic
	property VeQuickItem sfkVirtualBatteryLogic: VeQuickItem {
		id: sfkVirtualBatteryLogic
		uid: "mqtt/sfksettings/0/SfkVirtualBatteryLogic"
	}

	GradientListView {
		model: ObjectModel {

			ListSwitch {
				text: "Virtual Battery"
				dataItem.uid: "mqtt/sfksettings/0/SfkVirtualBatteryActive"
				preferredVisible: true
			}
			
			ListRadioButtonGroup {
				text: "Virtual Battery Logic"
				dataItem.uid: "mqtt/sfksettings/0/SfkVirtualBatteryLogic"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
                    { display: qsTr( "Dbus Monitor"), value: 0 },
                    { display: qsTr( "Vedbus Item Import"), value: 1 }
				]
			}
			
			ListRadioButtonGroup {
				text: "Float Compensation"
				dataItem.uid: "mqtt/sfksettings/0/Info/FloatCompensation"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("0 mV"), value: 0 },
					{ display: qsTr("100 mV %1").arg("[DEFAULT]"), value: 100 },
					{ display: qsTr("200 mV"), value: 200 },
					{ display: qsTr("300 mV"), value: 300 },
					{ display: qsTr("400 mV"), value: 400 },
					{ display: qsTr("500 mV"), value: 500 }
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

			ListRebootButton { }

		}
	}
	// React to changes using Connections on the VeQuickItem
	Connections {
		target: sfkVirtualBatteryLogic
		onValueChanged: {
			Global.showToastNotification(
				VenusOS.Notification_Info,
				qsTr("Please reboot device to see changes"),
				5000
			)
		}
	}

}