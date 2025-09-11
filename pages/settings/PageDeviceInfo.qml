/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	// The uid of the service that provides the device information.
	required property string serviceUid
	// Additional settings to be loaded.
	property Component extraDeviceInfo
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

	title: CommonWords.device_info_title

	GradientListView {
		model: VisibleItemModel {

			ListText {
				text: "Connected"
				dataItem.uid: root.bindPrefix + "/Connected"
				secondaryText: CommonWords.yesOrNo(dataItem.value)
			}
			
			ListText {
				//% "Connection"
				text: qsTrId("settings_deviceinfo_connection")
				dataItem.uid: root.serviceUid + "/Mgmt/Connection"
				dataItem.invalidate: false
			}

			ListText {
				//% "Product"
				text: qsTrId("settings_deviceinfo_product")
				dataItem.uid: root.serviceUid + "/ProductName"
				dataItem.invalidate: false
			}

			ListTextField {
				//% "Name"
				text: qsTrId("settings_deviceinfo_name")
				dataItem.uid: root.serviceUid + "/CustomName"
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
				dataItem.uid: root.serviceUid + "/ProductId"
				dataItem.invalidate: false
			}

			ListFirmwareVersion {
				bindPrefix: root.serviceUid
				dataItem.invalidate: false
				preferredVisible: dataItem.valid
			}

			ListText {
				//% "Hardware version"
				text: qsTrId("settings_deviceinfo_hardware_version")
				dataItem.uid: root.serviceUid + "/HardwareVersion"
				dataItem.invalidate: false
				preferredVisible: dataItem.valid
			}

			// ListText {
			// 	text: CommonWords.vrm_instance
			// 	dataItem.uid: root.serviceUid + "/DeviceInstance"
			// 	dataItem.invalidate: false
			// }
			
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
				dataItem.uid: root.serviceUid + "/Serial"
				dataItem.invalidate: false
				preferredVisible: dataItem.valid
			}
			
			ListText {
				text: "MCU ID"
				dataItem.uid: root.bindPrefix + "/MCUid"
				dataItem.invalidate: false
				preferredVisible: dataItem.valid
			}

			ListText {
				//% "Device name"
				text: qsTrId("settings_deviceinfo_device_name")
				dataItem.uid: root.serviceUid + "/DeviceName"
				dataItem.invalidate: false
				preferredVisible: dataItem.valid
			}
		}

		footer: root.extraDeviceInfo
	}
}*/