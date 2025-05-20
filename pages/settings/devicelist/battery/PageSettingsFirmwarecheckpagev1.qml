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


	property VeQuickItem  installedVenusOSversion: VeQuickItem { 
		id: installedVenusOSversion  
	    uid: Global.venusPlatform.serviceUid + "/Firmware/Installed/Version"}	
    property VeQuickItem  sfkV1FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV1FirmwareDownloadCompleted   
		uid: "mqtt/sfksettings/0/System/SFKV1FirmwareDownloadCompleted" }
    property VeQuickItem  sfkV2FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV2FirmwareDownloadCompleted   
		uid: "mqtt/sfksettings/0/System/SFKV2FirmwareDownloadCompleted" }		
    property VeQuickItem  sfkV3FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV3FirmwareDownloadCompleted   
		uid: "mqtt/sfksettings/0/System/SFKV3FirmwareDownloadCompleted" }
	property VeQuickItem  sfkV1InstallConfirmItem: VeQuickItem { 
		id: sfkV1InstallConfirmItem   
		uid: "mqtt/sfksettings/0/System/SFKV1Installconfirm" }
	property VeQuickItem  sfkV2InstallConfirmItem: VeQuickItem { 
		id: sfkV2InstallConfirmItem   
		uid: "mqtt/sfksettings/0/System/SFKV2Installconfirm" }
	property VeQuickItem  sfkV3InstallConfirmItem: VeQuickItem { 
		id: sfkV3InstallConfirmItem   
		uid: "mqtt/sfksettings/0/System/SFKV3Installconfirm" }	
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
    property VeQuickItem  sfkV1FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV1FirmwareDownloadConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV1Downloaded" }
    property VeQuickItem  sfkV2FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV2FirmwareDownloadConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV2Downloaded" }
    property VeQuickItem  sfkV3FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV3FirmwareDownloadConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV3Downloaded" }
    property VeQuickItem  sfkV1OSTextconfirm: VeQuickItem { 
		id: sfkV1OSTextconfirm  
		uid: "mqtt/sfksettings/0/System/SFKV1OSTextconfirm"}
    property VeQuickItem  sfkV2OSTextconfirm: VeQuickItem { 
		id: sfkV2OSTextconfirm 
		uid: "mqtt/sfksettings/0/System/SFKV2OSTextconfirm" }
    property VeQuickItem  sfkV3OSTextconfirm: VeQuickItem { 
		id: sfkV3OSTextconfirm 
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

    property string installedVersionStr: installedVenusOSversion.value || "v0.00"
    property string requiredVersionStrv1: sfkV1OSTextconfirm.value || "v0.00"

    // Function to extract numeric version and convert to float
    function extractVersionNumber(versionString) {
        var match = versionString.match(/v?(\d+\.\d+)/);
        return match ? parseFloat(match[1]) : 0.0;
    }
	    // Convert versions to numbers
    property real installedVersion: extractVersionNumber(installedVersionStr)
    property real requiredVersionv1: extractVersionNumber(requiredVersionStrv1)

    property string versionComparisonMessagev1: (installedVersion > requiredVersionv1) ? qsTr("This driver is not compatible with your Venus OS firmware.") : installedVersion < requiredVersionv1 ? qsTr("This driver is not compatible with your Venus OS firmware.") :  qsTr("This driver is compatible with your Venus OS firmware.")
    property string versionoutdateComparisonMessagev1: (isSFKV1Newer) ? qsTr("") : qsTr("This driver is outdated.")
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
				id: remotePort
				text: CommonWords.firmware_version
				secondaryText: FirmwareVersion.versionText(dataItem.value, "venus")
				dataItem.uid: Global.venusPlatform.serviceUid + "/Firmware/Installed/Version"
			}

			ListText {
				text: qsTr("%1 %2").arg(versionComparisonMessagev1).arg(versionoutdateComparisonMessagev1)
				preferredVisible: sfkFirmwareInstallationCompleted.value === 0 
			}

			ListText {
				text: installationCompletedPulse ? firmwareInstalledMessage : qsTr("")
				preferredVisible: sfkFirmwareInstallationCompleted.value === 1 
			}

			ListButton {
                text:  qsTr("Download %1").arg(sfkV1TextInstallConfirm.value)
                secondaryText: qsTr("Download")
                preferredVisible:  (installedVersion === requiredVersionv1 ) && sfkFirmwareInstallationCompleted.value === 0 
                onClicked: sfkV1FirmwareDownloadConfirm.setValue(1)
            }

			ListButton {
                text:   qsTr("Install %1").arg(sfkV1TextInstallConfirm.value)
                secondaryText: qsTr("Install")
                preferredVisible:  sfkV1FirmwareDownloadCompleted.value === 1 && sfkFirmwareInstallationCompleted.value === 0 
                onClicked: sfkV1InstallConfirmItem.setValue(1)
            }
			
			ListRebootButton { }
	
		}
	}
}
