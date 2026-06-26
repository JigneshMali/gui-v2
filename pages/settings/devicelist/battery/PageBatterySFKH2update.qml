/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	required property string bindPrefix

	// -----------------------------------------
	property VeQuickItem isH2DeviceBool: VeQuickItem{
		id: isH2DeviceBool
		uid: root.bindPrefix +  "/H2DeviceBool"
	}
	property VeQuickItem h2SFKFirmwareAvailableCheck: VeQuickItem{
		id: h2SFKFirmwareAvailableCheck
		uid: root.bindPrefix +  "/H2Device/H2SFKFirmwareAvailableCheck"
	}
	property VeQuickItem loopTestValue: VeQuickItem{
		id: loopTestValue
		uid: root.bindPrefix +  "/H2Device/ESPFlashCheck"
	}
	property VeQuickItem noESPFlashFile: VeQuickItem{
		id: noESPFlashFile
		uid: root.bindPrefix +  "/H2Device/NoESPFlashFile"
	}
	property VeQuickItem h2DeviceFirmwareFlashBar: VeQuickItem{
		id: h2DeviceFirmwareFlashBar
		uid: root.bindPrefix +  "/H2Device/H2DeviceFirmwareFlashBar"
	}
	
	property VeQuickItem h2DeviceFirmware: VeQuickItem {
        uid: root.bindPrefix + "/H2DeviceFirmware"
    }
	// -----------------------------------------
	property VeQuickItem sfkV1H2version: VeQuickItem{
		id: sfkV1H2version
		uid: root.bindPrefix +  "/H2Device/SFKV1H2version"
	}
	property VeQuickItem sfkV2H2version: VeQuickItem{
		id: sfkV2H2version
		uid: root.bindPrefix +  "/H2Device/SFKV2H2version"
	}
	property VeQuickItem sfkV3H2version: VeQuickItem{
		id: sfkV3H2version
		uid: root.bindPrefix +  "/H2Device/SFKV3H2version"
	}
	property VeQuickItem sfkV4H2version: VeQuickItem{
		id: sfkV4H2version
		uid: root.bindPrefix +  "/H2Device/SFKV4H2version"
	}
	property VeQuickItem sfkV5H2version: VeQuickItem{
		id: sfkV5H2version
		uid: root.bindPrefix +  "/H2Device/SFKV5H2version"
	}
	// -----------------------------------------

	GradientListView {
		model: VisibleItemModel {
		// -----------------------------------------
            
			ListText {
                text: "Battery Firmware"
                secondaryText: h2DeviceFirmware.value
                preferredVisible: isH2DeviceBool.value === 1
            }

            ListButton {
                text: "Check for Updated Firmware"
                secondaryText: h2SFKFirmwareAvailableCheck.value === 1 ? qsTr("Cancel") : qsTr("Check")
                preferredVisible: isH2DeviceBool.value === 1
                onClicked: {
                    h2SFKFirmwareAvailableCheck.setValue(h2SFKFirmwareAvailableCheck.value === 1 ? 0 : 1)
                }
            }

			ListNavigation {
				text: sfkV1H2version.value
				preferredVisible: sfkV1H2version.value !== "" && isH2DeviceBool.value === 1 && h2SFKFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatterySFKH2FirmwareV1.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
			}

			ListNavigation {
				text: sfkV2H2version.value
				preferredVisible: sfkV2H2version.value !== "" && isH2DeviceBool.value === 1 && h2SFKFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatterySFKH2FirmwareV2.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
			}

			ListNavigation {
				text: sfkV3H2version.value
				preferredVisible: sfkV3H2version.value !== "" && isH2DeviceBool.value === 1 && h2SFKFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatterySFKH2FirmwareV3.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
			}

			ListNavigation {
				text: sfkV4H2version.value
				preferredVisible: sfkV4H2version.value !== "" && isH2DeviceBool.value === 1 && h2SFKFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatterySFKH2FirmwareV4.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
			}

			ListNavigation {
				text: sfkV5H2version.value
				preferredVisible: sfkV5H2version.value !== "" && isH2DeviceBool.value === 1 && h2SFKFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatterySFKH2FirmwareV5.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
			}
			
		// -----------------------------------------VisibleItemModel
		}
	}
}
