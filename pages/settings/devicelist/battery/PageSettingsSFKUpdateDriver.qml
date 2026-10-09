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
    property string mqttprefix: "mqtt/sfksettings/0"
    property string bindPrefix: "mqtt/sfksettings/0"

    property VeQuickItem  sfkV1InstallConfirm: VeQuickItem { 
		id: sfkV1InstallConfirm   
		uid: "mqtt/sfksettings/0/System/SFKV1Installconfirm" }
    property VeQuickItem  sfkV2InstallConfirm: VeQuickItem { 
		id: sfkV2InstallConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV2Installconfirm" }
    property VeQuickItem  sfkV3InstallConfirm: VeQuickItem { 
		id: sfkV3InstallConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV3Installconfirm" }
    property VeQuickItem  sfkV4InstallConfirm: VeQuickItem { 
		id: sfkV4InstallConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV4Installconfirm" }
    property VeQuickItem  sfkV5InstallConfirm: VeQuickItem { 
		id: sfkV5InstallConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV5Installconfirm" }
    property VeQuickItem  sfkV6InstallConfirm: VeQuickItem { 
		id: sfkV6InstallConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV6Installconfirm" }
    property VeQuickItem  sfkV7InstallConfirm: VeQuickItem { 
		id: sfkV7InstallConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV7Installconfirm" }


    property VeQuickItem  sfkFirmwareInstallationCompleted: VeQuickItem { 
		id: sfkFirmwareInstallationCompleted  
		uid: "mqtt/sfksettings/0/System/SFKFirmwareInstallationCompleted" }


    property VeQuickItem  sfkV1TextInstallConfirm: VeQuickItem {
		id: sfkV1TextInstallConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV1Textinstallconfirm" }
    property VeQuickItem  sfkV2TextInstallConfirm: VeQuickItem {
		id: sfkV2TextInstallConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV2Textinstallconfirm" }
    property VeQuickItem  sfkV3TextInstallConfirm: VeQuickItem { 
		id: sfkV3TextInstallConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV3Textinstallconfirm" }
    property VeQuickItem  sfkV4TextInstallConfirm: VeQuickItem { 
		id: sfkV4TextInstallConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV4Textinstallconfirm" }
    property VeQuickItem  sfkV5TextInstallConfirm: VeQuickItem { 
		id: sfkV5TextInstallConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV5Textinstallconfirm" }
    property VeQuickItem  sfkV6TextInstallConfirm: VeQuickItem { 
		id: sfkV6TextInstallConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV6Textinstallconfirm" }
    property VeQuickItem  sfkV7TextInstallConfirm: VeQuickItem { 
		id: sfkV7TextInstallConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV7Textinstallconfirm" }


    property VeQuickItem  sfkV1OSTextConfirm: VeQuickItem { 
		id: sfkV1OSTextConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV1OSTextconfirm"}
    property VeQuickItem  sfkV2OSTextConfirm: VeQuickItem { 
		id: sfkV2OSTextConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV2OSTextconfirm" }
    property VeQuickItem  sfkV3OSTextConfirm: VeQuickItem { 
		id: sfkV3OSTextConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV3OSTextconfirm" }
    property VeQuickItem  sfkV4OSTextConfirm: VeQuickItem { 
		id: sfkV4OSTextConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV4OSTextconfirm" }
    property VeQuickItem  sfkV5OSTextConfirm: VeQuickItem { 
		id: sfkV5OSTextConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV5OSTextconfirm" }
    property VeQuickItem  sfkV6OSTextConfirm: VeQuickItem { 
		id: sfkV6OSTextConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV6OSTextconfirm" }
    property VeQuickItem  sfkV7OSTextConfirm: VeQuickItem { 
		id: sfkV7OSTextConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV7OSTextconfirm" }



    property VeQuickItem  sfkCompatibleVerisonNr: VeQuickItem {
		id: sfkCompatibleVerisonNr 
		uid: "mqtt/sfksettings/0/System/SFKCompatibleVerisonNr" }
    property VeQuickItem  sfkNumberofVersions: VeQuickItem { 
		id: sfksfkNumberofVersionsvbFlag  
	   uid: "mqtt/sfksettings/0/System/SFKNumberofVersions" }
    property VeQuickItem  isSFKVersionsAvailable: VeQuickItem {
		id: isSFKVersionsAvailable  
	    uid: "mqtt/sfksettings/0/System/IsSFKVersionsAvailable" }
    property VeQuickItem  firmwareVersion: VeQuickItem { 
		id: firmwareVersion  
	    uid: "mqtt/sfksettings/0/FirmwareVersion" }

    // Firmware availability check
    property VeQuickItem  sfkFirmwareAvailableCheck: VeQuickItem { 
		id: sfkFirmwareAvailableCheck   
	    uid: "mqtt/sfksettings/0/System/SFKFirmwareAvailableCheck" }
    property VeQuickItem sfkFirmwareAvailableCheckItem: VeQuickItem { 
		id: sfkFirmwareAvailableCheckItem  
	    uid: "mqtt/sfksettings/0/System/SFKFirmwareAvailableCheck" }

    property string firmwareStatusMessage: isSFKVersionsAvailable.value === 1 ? qsTr("New firmware available.") : qsTr("")
    property string firmwareInstalledMessage: qsTr("Installation completed. Please reboot the device.")

    property VeQuickItem  sfkCurrentversion: VeQuickItem { 
		id: sfkCurrentversion 
	    uid: "mqtt/sfksettings/0/System/SFKcurrentversion" }

    property VeQuickItem  sfkVCurrentversion: VeQuickItem { 
		id: sfkVCurrentversion 
	    uid: "mqtt/sfksettings/0/System/SFKVcurrentversion" }	

    property VeQuickItem  sfkV1version: VeQuickItem { 
		id: sfkV1version   
	    uid: "mqtt/sfksettings/0/System/SFKV1version" }
    property VeQuickItem  sfkV2version: VeQuickItem {
		id: sfkV2version 
	    uid: "mqtt/sfksettings/0/System/SFKV2version" }
    property VeQuickItem  sfkV3version: VeQuickItem { 
		id: sfkV3version 
	    uid: "mqtt/sfksettings/0/System/SFKV3version" }
    property VeQuickItem  sfkV4version: VeQuickItem { 
		id: sfkV4version 
	    uid: "mqtt/sfksettings/0/System/SFKV4version" }
    property VeQuickItem  sfkV5version: VeQuickItem { 
		id: sfkV5version 
	    uid: "mqtt/sfksettings/0/System/SFKV5version" }
    property VeQuickItem  sfkV6version: VeQuickItem { 
		id: sfkV6version 
	    uid: "mqtt/sfksettings/0/System/SFKV6version" }
    property VeQuickItem  sfkV7version: VeQuickItem { 
		id: sfkV7version 
	    uid: "mqtt/sfksettings/0/System/SFKV7version" }

    property real sfkCurrentVersion: sfkCurrentversion.value || 0.0
    property real sfkV1Version: sfkV1version.value || 0.0
    property real sfkV2Version: sfkV2version.value || 0.0
    property real sfkV3Version: sfkV3version.value || 0.0
    property real sfkV4Version: sfkV3version.value || 0.0
    property real sfkV5Version: sfkV3version.value || 0.0
    property real sfkV6Version: sfkV3version.value || 0.0
    property real sfkV7Version: sfkV3version.value || 0.0

    // Boolean properties indicating if a newer version is available
    property bool isSFKV1Newer: sfkV1Version >= sfkCurrentVersion
    property bool isSFKV2Newer: sfkV2Version >= sfkCurrentVersion
    property bool isSFKV3Newer: sfkV3Version >= sfkCurrentVersion
    property bool isSFKV4Newer: sfkV3Version >= sfkCurrentVersion
    property bool isSFKV5Newer: sfkV3Version >= sfkCurrentVersion
    property bool isSFKV6Newer: sfkV3Version >= sfkCurrentVersion
    property bool isSFKV7Newer: sfkV3Version >= sfkCurrentVersion

    property bool installationCompletedPulse: true

    Timer {
        id: _timer
        interval: 500
        running: sfkFirmwareInstallationCompleted.value === 1
        repeat: true
        onTriggered: installationCompletedPulse = !installationCompletedPulse
    }

	GradientListView {
		model: VisibleItemModel {
			ListText {
				text: "SFK Driver Version"
				dataItem.uid: "mqtt/sfksettings/0/FirmwareVersion"
				preferredVisible: true
			}	

			ListButton {
                text: qsTr("Check for SFK driver update")
                // secondaryText: qsTr("Check")
                secondaryText: sfkFirmwareAvailableCheck.value ? qsTr("Cancel") : qsTr("Check")
                preferredVisible: true
                // onClicked: sfkFirmwareAvailableCheck.setValue(1)				
				onClicked:{
					if (sfkFirmwareAvailableCheck.value === 1)
					{
						sfkFirmwareAvailableCheck.setValue(0)
					}
					if (sfkFirmwareAvailableCheck.value === 0)
					{
						sfkFirmwareAvailableCheck.setValue(1)
					}
				}
            }		
			
			ListText {
				text: "SFK Drivers Available"
				dataItem.uid: "mqtt/sfksettings/0/System/SFKNumberofVersions"
				preferredVisible: (( isSFKVersionsAvailable.value === 1) || ( sfkNumberofVersions.value > 0 ) ) &&  (sfkFirmwareInstallationCompleted.value === 0)
			}

			ListText {
				text: installationCompletedPulse ? firmwareInstalledMessage : qsTr("")
				preferredVisible:sfkFirmwareInstallationCompleted.value === 1 
			}

			ListNavigation {
				text: sfkV1TextInstallConfirm.value
				preferredVisible: (sfkNumberofVersions.value > 0 && sfkNumberofVersions.value < 8 ) && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsFirmwarecheckpagev1.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: sfkV2TextInstallConfirm.value
				preferredVisible: (sfkNumberofVersions.value > 1 && sfkNumberofVersions.value < 8 ) && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsFirmwarecheckpagev2.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: sfkV3TextInstallConfirm.value
				preferredVisible: sfkNumberofVersions.value > 2  && sfkNumberofVersions.value < 8 && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsFirmwarecheckpagev3.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: sfkV4TextInstallConfirm.value
				preferredVisible: sfkNumberofVersions.value > 3  && sfkNumberofVersions.value < 8 && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsFirmwarecheckpagev4.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: sfkV5TextInstallConfirm.value
				preferredVisible: sfkNumberofVersions.value > 4  && sfkNumberofVersions.value < 8 && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsFirmwarecheckpagev5.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: sfkV6TextInstallConfirm.value
				preferredVisible: sfkNumberofVersions.value > 5  && sfkNumberofVersions.value < 8 && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsFirmwarecheckpagev6.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: sfkV7TextInstallConfirm.value
				preferredVisible: sfkNumberofVersions.value > 6 && sfkNumberofVersions.value < 8 && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsFirmwarecheckpagev7.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

		}
	}
}
