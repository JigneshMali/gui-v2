/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS
import QtQuick.Controls.impl as CP

Page {
	id: root

	property string bindPrefix
	property alias settingsListView: settingsListView
	property VeQuickItem sfkVBDeviceInstance: VeQuickItem {
		id: sfkVBDeviceInstance
		uid: "mqtt/sfksettings/0/SfkVBDeviceInstance"
	}

	GradientListView {
		id: settingsListView

		model: VisibleItemModel {

			ListText {
				text: "Connected"
				dataItem.uid: root.bindPrefix + "/Connected"
				secondaryText: CommonWords.yesOrNo(dataItem.value)
			}

			ListText {
				//% "Connection"
				text: qsTrId("settings_deviceinfo_connection")
				dataItem.uid: root.bindPrefix + "/Mgmt/Connection"
				dataItem.invalidate: false
			}

			ListText {
				//% "Product"
				text: qsTrId("settings_deviceinfo_product")
				dataItem.uid: root.bindPrefix + "/ProductName"
				dataItem.invalidate: false
			}

			ListTextField {
				//% "Name"
				text: qsTrId("settings_deviceinfo_name")
				dataItem.uid: root.bindPrefix + "/CustomName"
				dataItem.invalidate: false
				textField.maximumLength: 32
				preferredVisible: dataItem.valid
				placeholderText: CommonWords.custom_name
			}

			ListTextField {
				//% "Name"
				text: CommonWords.vrm_instance
				dataItem.uid: root.bindPrefix + "/DeviceInstance"
				dataItem.invalidate: false
				textField.maximumLength: 4
				preferredVisible: dataItem.valid
				Connections {
						target: dataItem
						function onValueChanged() {
							if (dataItem.valid) {
								sfkVBDeviceInstance.setValue(dataItem.value)
							}
						}
				}
			}
			// ListText {
			// 	text: "sfkVBDeviceInstance"  // Directly assigning text as no translation ID exists
			// 	preferredVisible: true
			// 	secondaryText: qsTr("%1").arg(sfkVBDeviceInstance.value)
			// }
		}
	}
}
