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