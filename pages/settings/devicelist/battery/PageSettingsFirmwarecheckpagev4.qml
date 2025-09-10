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


	property VeQuickItem sfkV3DownloadProgress: VeQuickItem {
		id: sfkV3DownloadProgress
		uid: "mqtt/sfksettings/0/System/SFKV4DownloadProgress"}
	property VeQuickItem sfkV3InstallProgress: VeQuickItem {
		id: sfkV3InstallProgress
		uid: "mqtt/sfksettings/0/System/SFKV4InstallProgress"}

	property VeQuickItem  installedVenusOSversion: VeQuickItem { 
		id: installedVenusOSversion  
	    uid: Global.venusPlatform.serviceUid + "/Firmware/Installed/Version"}
    	
    property VeQuickItem  sfkV3FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV3FirmwareDownloadCompleted   
		uid: "mqtt/sfksettings/0/System/SFKV4FirmwareDownloadCompleted" }
	
	property VeQuickItem  sfkV3InstallConfirmItem: VeQuickItem { 
		id: sfkV3InstallConfirmItem   
		uid: "mqtt/sfksettings/0/System/SFKV4Installconfirm" }	
	
    property VeQuickItem  sfkV3InstallConfirm: VeQuickItem { 
		id: sfkV3InstallConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV4Installconfirm" }
    property VeQuickItem  sfkFirmwareInstallationCompleted: VeQuickItem { 
		id: sfkFirmwareInstallationCompleted  
		uid: "mqtt/sfksettings/0/System/SFKFirmwareInstallationCompleted" }
    
    property VeQuickItem  sfkV3TextInstallConfirm: VeQuickItem { 
		id: sfkV3TextInstallConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV4Textinstallconfirm" }
    
    property VeQuickItem  sfkV3FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV3FirmwareDownloadConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV4Downloaded" }
    
    property VeQuickItem  sfkV3OSTextconfirm: VeQuickItem { 
		id: sfkV3OSTextconfirm 
		uid: "mqtt/sfksettings/0/System/SFKV4OSTextconfirm" }
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
    
    property VeQuickItem  sfkV3version: VeQuickItem { 
		id: sfkV3version 
	    uid: "mqtt/sfksettings/0/System/SFKV4version" }

    property real sfkCurrentVersion: sfkCurrentversion.value || 0.0
    property real sfkV3Version: sfkV3version.value || 0.0

    // Boolean properties indicating if a newer version is available
    property bool isSFKV3Newer: sfkV3Version >= sfkCurrentVersion

    property string installedVersionStr: installedVenusOSversion.value || "v0.00"
    property string requiredVersionStrv3: sfkV3OSTextconfirm.value || "v0.00"

    // Function to extract numeric version and convert to float
    function extractVersionNumber(versionString) {
        var match = versionString.match(/v?(\d+\.\d+)/);
        return match ? parseFloat(match[1]) : 0.0;
    }
	    // Convert versions to numbers
    property real installedVersion: extractVersionNumber(installedVersionStr)
    property real requiredVersionv3: extractVersionNumber(requiredVersionStrv3)

    property string versionComparisonMessagev3: (installedVersion > requiredVersionv3) ? qsTr("This driver is not compatible with your Venus OS firmware.") : installedVersion < requiredVersionv3 ? qsTr("This driver is not compatible with your Venus OS firmware.") :  qsTr("This driver is compatible with your Venus OS firmware.")
    property string versionoutdateComparisonMessagev3: (isSFKV3Newer) ? qsTr("") : qsTr("This driver is outdated.")
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
				text: qsTr("%1 %2").arg(versionComparisonMessagev3).arg(versionoutdateComparisonMessagev3)
				preferredVisible: sfkFirmwareInstallationCompleted.value === 0 
			}

			ListText {
				text: installationCompletedPulse ? firmwareInstalledMessage : qsTr("")
				preferredVisible: sfkFirmwareInstallationCompleted.value === 1 
			}

			ListButton {
				text: qsTr("Download %1").arg(sfkV3TextInstallConfirm.value)

				secondaryText:sfkV3DownloadProgress.value === 100
						? qsTr("Downloaded")
					: sfkV3FirmwareDownloadConfirm.value === 1
						? qsTr("Downloading %1%").arg(sfkV3DownloadProgress.value)
					: qsTr("Download")

				preferredVisible: (installedVersion === requiredVersionv3) && sfkFirmwareInstallationCompleted.value === 0

				onClicked: {
					if (sfkV3FirmwareDownloadConfirm.value !== 1 && sfkV3DownloadProgress.value < 100)
						sfkV3FirmwareDownloadConfirm.setValue(1)
				}
			}

			ListButton {
				text: qsTr("Install %1").arg(sfkV3TextInstallConfirm.value)

				secondaryText:sfkV3InstallProgress.value === 100
						? qsTr("Installed")
					: sfkV3InstallConfirmItem.value === 1
						? qsTr("Installing %1%").arg(sfkV3InstallProgress.value)
					: qsTr("Install")

				preferredVisible: sfkV3FirmwareDownloadCompleted.value === 1 && sfkFirmwareInstallationCompleted.value === 0

				onClicked: {
					if (sfkV3InstallConfirmItem.value !== 1 && sfkV3InstallProgress.value < 100)
						sfkV3InstallConfirmItem.setValue(1)
				}
			}

			
			ListRebootButton { }
	
		}
	}
}
