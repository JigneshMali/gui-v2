/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS
import Victron.Mqtt      // <-- this hook makes “mqtt/…” UIDs work

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
    property VeQuickItem  sfkV1OSTextConfirm: VeQuickItem { 
		id: sfkV1OSTextConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV1OSTextconfirm"}
    property VeQuickItem  sfkV2OSTextConfirm: VeQuickItem { 
		id: sfkV2OSTextConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV2OSTextconfirm" }
    property VeQuickItem  sfkV3OSTextConfirm: VeQuickItem { 
		id: sfkV3OSTextConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV3OSTextconfirm" }
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

    property real sfkCurrentVersion: sfkCurrentversion.value || 0.0
    property real sfkV1Version: sfkV1version.value || 0.0
    property real sfkV2Version: sfkV2version.value || 0.0
    property real sfkV3Version: sfkV3version.value || 0.0

    // Boolean properties indicating if a newer version is available
    property bool isSFKV1Newer: sfkV1Version >= sfkCurrentVersion
    property bool isSFKV2Newer: sfkV2Version >= sfkCurrentVersion
    property bool isSFKV3Newer: sfkV3Version >= sfkCurrentVersion

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
                secondaryText: qsTr("Check")
                preferredVisible: true
                onClicked: sfkFirmwareAvailableCheck.setValue(1)
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
				preferredVisible: (sfkNumberofVersions.value > 0 && sfkNumberofVersions.value < 4 ) && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsFirmwarecheckpagev1.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: sfkV2TextInstallConfirm.value
				preferredVisible: (sfkNumberofVersions.value > 1 && sfkNumberofVersions.value < 4 ) && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsFirmwarecheckpagev2.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: sfkV3TextInstallConfirm.value
				preferredVisible: sfkNumberofVersions.value > 2  && sfkNumberofVersions.value < 4 && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsFirmwarecheckpagev3.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

		}
	}
}
