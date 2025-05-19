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
	property VeQuickItem sfkFlag: VeQuickItem{
		id: sfkFlag
		uid: root.bindPrefix +  "/SFKbatteryflag"
	}	
	property VeQuickItem sfkvbFlag: VeQuickItem {
		id: sfkvbFlag
		uid: root.bindPrefix + "/SFKVBbatteryflag"
	}	
	property VeQuickItem versionFlag: VeQuickItem {
		id: versionFlag
		uid: root.bindPrefix +  "/SFKhardwareflag"
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
				//% "SFK pin"
				text: "Security pin"
				dataItem.uid: root.bindPrefix + "/SFKBMSPin"
				dataItem.invalidate: false
				textField.maximumLength: 6
				preferredVisible: dataItem.valid
				// placeholderText: CommonWords.custom_name
				textField.onAccepted: {
					if (textField.text.length !== 6) {
						toast.createToast(qsTr("Security Pin must be 6 digits"))
					} else {
						dataItem.value = textField.text  // Store only if exactly 6 digits
						textField.text = ""             // Clear the field for security
					}
				}
			}

			ListText {
				//% "Product ID"
				text: qsTrId("settings_deviceinfo_product_id")
				secondaryText: Utils.toHexFormat(dataItem.value)
				dataItem.uid: root.bindPrefix + "/ProductId"
				dataItem.invalidate: false
			}

			ListFirmwareVersion {
				bindPrefix: root.bindPrefix
				dataItem.invalidate: false
			}

			ListText {
				//% "Hardware version"
				text: qsTrId("settings_deviceinfo_hardware_version")
				dataItem.uid: root.bindPrefix + "/HardwareVersion"
				dataItem.invalidate: false
				preferredVisible: dataItem.valid
			}

			ListTextField {
				//% "Name"
				text: CommonWords.vrm_instance
				dataItem.uid: root.bindPrefix + "/DeviceInstance"
				dataItem.invalidate: false
				textField.maximumLength: 4
				preferredVisible: dataItem.valid
			}

			ListText {
				text: CommonWords.serial_number
				dataItem.uid: root.bindPrefix + "/Serial"
				dataItem.invalidate: false
				preferredVisible: dataItem.valid
			}

			ListText {
				text: "MCU ID"
				dataItem.uid: root.bindPrefix + "/MCUid"
				dataItem.invalidate: false
				preferredVisible: dataItem.valid
			}

			// ListNavigation {
			// 	text: "Update SFK Driver"
			// 	preferredVisible: sfkFlag.value === 1
			// 	onClicked: {
			// 		Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatteryDeviceinfoFirmwareCheck.qml",
			// 				{ "title": text, "bindPrefix": root.bindPrefix })
			// 	}
			// }

			// ListNavigation {
			// 	text: "Uninstall SFK Driver"
			// 	preferredVisible: sfkFlag.value === 1
			// 	onClicked: {
			// 		Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatteryDeviceinfoUninstallSFK.qml",
			// 				{ "title": text, "bindPrefix": root.bindPrefix })
			// 	}
			// }

			ListText {
				//% "Device name"
				text: qsTrId("settings_deviceinfo_device_name")
				dataItem.uid: root.bindPrefix + "/DeviceName"
				dataItem.invalidate: false
				preferredVisible: dataItem.valid
			}
		}
	}
}
