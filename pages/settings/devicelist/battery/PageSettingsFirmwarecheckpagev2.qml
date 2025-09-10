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

	property VeQuickItem sfkV1DownloadProgress: VeQuickItem {
		id: sfkV1DownloadProgress
		uid: "mqtt/sfksettings/0/System/SFKV1DownloadProgress"}
	property VeQuickItem sfkV1InstallProgress: VeQuickItem {
		id: sfkV1InstallProgress
		uid: "mqtt/sfksettings/0/System/SFKV1InstallProgress"}
	property VeQuickItem sfkV2DownloadProgress: VeQuickItem {
		id: sfkV2DownloadProgress
		uid: "mqtt/sfksettings/0/System/SFKV2DownloadProgress"}
	property VeQuickItem sfkV2InstallProgress: VeQuickItem {
		id: sfkV2InstallProgress
		uid: "mqtt/sfksettings/0/System/SFKV2InstallProgress"}

	property VeQuickItem sfkV3DownloadProgress: VeQuickItem {
		id: sfkV3DownloadProgress
		uid: "mqtt/sfksettings/0/System/SFKV3DownloadProgress"}
	property VeQuickItem sfkV3InstallProgress: VeQuickItem {
		id: sfkV3InstallProgress
		uid: "mqtt/sfksettings/0/System/SFKV3InstallProgress"}


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
    property string requiredVersionStrv2: sfkV2OSTextconfirm.value || "v0.00"

    // Function to extract numeric version and convert to float
    function extractVersionNumber(versionString) {
        var match = versionString.match(/v?(\d+\.\d+)/);
        return match ? parseFloat(match[1]) : 0.0;
    }
	    // Convert versions to numbers
    property real installedVersion: extractVersionNumber(installedVersionStr)
    property real requiredVersionv2: extractVersionNumber(requiredVersionStrv2)

    property string versionComparisonMessagev2: (installedVersion > requiredVersionv2) ? qsTr("This driver is not compatible with your Venus OS firmware.") : installedVersion < requiredVersionv2 ? qsTr("This driver is not compatible with your Venus OS firmware.") :  qsTr("This driver is compatible with your Venus OS firmware.")
    property string versionoutdateComparisonMessagev2: (isSFKV2Newer) ? qsTr("") : qsTr("This driver is outdated.")
    property bool installationCompletedPulse: true

	property VeQuickItem sfkFlag: VeQuickItem{
		id: sfkFlag
		uid: mqttprefix +  "/SFKbatteryflag"
	}	
	property VeQuickItem sfkvbFlag: VeQuickItem {
		id: sfkvbFlag
		uid: "mqtt/sfksettings/0/SFKVBbatteryflag"
	}	
	property VeQuickItem versionFlag: VeQuickItem {
		id: versionFlag
		uid: mqttprefix +  "/SFKhardwareflag"
		}
	property VeQuickItem nrOfcell: VeQuickItem {
		id: nrOfcell
		uid: mqttprefix +   "/System/NrOfCellsPerBattery"
		}	

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
				text: qsTr("%1 %2").arg(versionComparisonMessagev2).arg(versionoutdateComparisonMessagev2)
				preferredVisible: sfkFirmwareInstallationCompleted.value === 0 
			}

			ListText {
				text: installationCompletedPulse ? firmwareInstalledMessage : qsTr("")
				preferredVisible: sfkFirmwareInstallationCompleted.value === 1 
			}

			ListButton {
				text: qsTr("Download %1").arg(sfkV2TextInstallConfirm.value)

				secondaryText:sfkV2DownloadProgress.value === 100
						? qsTr("Downloaded")
					: sfkV2FirmwareDownloadConfirm.value === 1
						? qsTr("Downloading %1%").arg(sfkV2DownloadProgress.value)
					: qsTr("Download")

				preferredVisible: (installedVersion === requiredVersionv2) && sfkFirmwareInstallationCompleted.value === 0

				onClicked: {
					if (sfkV2FirmwareDownloadConfirm.value !== 1 && sfkV2DownloadProgress.value < 100)
						sfkV2FirmwareDownloadConfirm.setValue(1)
				}
			}

			ListButton {
				text: qsTr("Install %1").arg(sfkV2TextInstallConfirm.value)

				secondaryText:sfkV2InstallProgress.value === 100
						? qsTr("Installed")
					: sfkV2InstallConfirmItem.value === 1
						? qsTr("Installing %1%").arg(sfkV2InstallProgress.value)
					: qsTr("Install")

				preferredVisible: sfkV2FirmwareDownloadCompleted.value === 1 && sfkFirmwareInstallationCompleted.value === 0

				onClicked: {
					if (sfkV2InstallConfirmItem.value !== 1 && sfkV2InstallProgress.value < 100)
						sfkV2InstallConfirmItem.setValue(1)
				}
			}
			
			ListRebootButton { }
	
		}
	}
}
