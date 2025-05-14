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

	property VeQuickItem  installedVenusOSversion: VeQuickItem { 
		id: installedVenusOSversion  
	    uid: Global.venusPlatform.serviceUid + "/Firmware/Installed/Version"}
    property VeQuickItem  sfkV1FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV1FirmwareDownloadCompleted   
		uid: mqttprefix + "/System/SFKV1FirmwareDownloadCompleted" }
    property VeQuickItem  sfkV2FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV2FirmwareDownloadCompleted   
		uid: mqttprefix + "/System/SFKV2FirmwareDownloadCompleted" }		
    property VeQuickItem  sfkV3FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV3FirmwareDownloadCompleted   
		uid: mqttprefix + "/System/SFKV3FirmwareDownloadCompleted" }
	property VeQuickItem  sfkV1InstallConfirmItem: VeQuickItem { 
		id: sfkV1InstallConfirmItem   
		uid: mqttprefix + "/System/SFKV1Installconfirm" }
	property VeQuickItem  sfkV2InstallConfirmItem: VeQuickItem { 
		id: sfkV2InstallConfirmItem   
		uid: mqttprefix + "/System/SFKV2Installconfirm" }
	property VeQuickItem  sfkV3InstallConfirmItem: VeQuickItem { 
		id: sfkV3InstallConfirmItem   
		uid: mqttprefix + "/System/SFKV3Installconfirm" }	
	property VeQuickItem  sfkV1InstallConfirm: VeQuickItem { 
		id: sfkV1InstallConfirm   
		uid: mqttprefix + "/System/SFKV1Installconfirm" }
    property VeQuickItem  sfkV2InstallConfirm: VeQuickItem { 
		id: sfkV2InstallConfirm  
		uid: mqttprefix + "/System/SFKV2Installconfirm" }
    property VeQuickItem  sfkV3InstallConfirm: VeQuickItem { 
		id: sfkV3InstallConfirm  
		uid: mqttprefix + "/System/SFKV3Installconfirm" }
    property VeQuickItem  sfkFirmwareInstallationCompleted: VeQuickItem { 
		id: sfkFirmwareInstallationCompleted  
		uid: mqttprefix + "/System/SFKFirmwareInstallationCompleted" }
    property VeQuickItem  sfkV1TextInstallConfirm: VeQuickItem {
		id: sfkV1TextInstallConfirm  
		uid: mqttprefix + "/System/SFKV1Textinstallconfirm" }
    property VeQuickItem  sfkV2TextInstallConfirm: VeQuickItem {
		id: sfkV2TextInstallConfirm  
		uid: mqttprefix + "/System/SFKV2Textinstallconfirm" }
    property VeQuickItem  sfkV3TextInstallConfirm: VeQuickItem { 
		id: sfkV3TextInstallConfirm 
		uid: mqttprefix + "/System/SFKV3Textinstallconfirm" }
    property VeQuickItem  sfkV1FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV1FirmwareDownloadConfirm 
		uid: mqttprefix + "/System/SFKV1Downloaded" }
    property VeQuickItem  sfkV2FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV2FirmwareDownloadConfirm 
		uid: mqttprefix + "/System/SFKV2Downloaded" }
    property VeQuickItem  sfkV3FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV3FirmwareDownloadConfirm 
		uid: mqttprefix + "/System/SFKV3Downloaded" }
    property VeQuickItem  sfkV1OSTextconfirm: VeQuickItem { 
		id: sfkV1OSTextconfirm  
		uid: mqttprefix + "/System/SFKV1OSTextconfirm"}
    property VeQuickItem  sfkV2OSTextconfirm: VeQuickItem { 
		id: sfkV2OSTextconfirm 
		uid: mqttprefix + "/System/SFKV2OSTextconfirm" }
    property VeQuickItem  sfkV3OSTextconfirm: VeQuickItem { 
		id: sfkV3OSTextconfirm 
		uid: mqttprefix + "/System/SFKV3OSTextconfirm" }
    property VeQuickItem  sfkCompatibleVerisonNr: VeQuickItem {
		id: sfkCompatibleVerisonNr 
		uid: mqttprefix + "/System/SFKCompatibleVerisonNr" }
    property VeQuickItem  sfkNumberofVersions: VeQuickItem { 
		id: sfksfkNumberofVersionsvbFlag  
	   uid: mqttprefix + "/System/SFKNumberofVersions" }
    property VeQuickItem  isSFKVersionsAvailable: VeQuickItem {
		id: isSFKVersionsAvailable  
	    uid: mqttprefix + "/System/IsSFKVersionsAvailable" }
    property VeQuickItem  firmwareVersion: VeQuickItem { 
		id: firmwareVersion  
	    uid: mqttprefix + "/FirmwareVersion" }

    // Firmware availability check
    property VeQuickItem  sfkFirmwareAvailableCheck: VeQuickItem { 
		id: sfkFirmwareAvailableCheck   
	    uid: mqttprefix + "/System/SFKFirmwareAvailableCheck" }
    property VeQuickItem sfkFirmwareAvailableCheckItem: VeQuickItem { 
		id: sfkFirmwareAvailableCheckItem  
	    uid: mqttprefix + "/System/SFKFirmwareAvailableCheck" }

    property string firmwareStatusMessage: isSFKVersionsAvailable.value === 1 ? qsTr("New firmware available.") : qsTr("")
    property string firmwareInstalledMessage: qsTr("Installation completed. Please reboot the device.")

    property VeQuickItem  sfkCurrentversion: VeQuickItem { 
		id: sfkCurrentversion 
	    uid: mqttprefix + "/System/SFKcurrentversion" }
    property VeQuickItem  sfkV1version: VeQuickItem { 
		id: sfkV1version   
	    uid: mqttprefix + "/System/SFKV1version" }
    property VeQuickItem  sfkV2version: VeQuickItem {
		id: sfkV2version 
	    uid: mqttprefix + "/System/SFKV2version" }
    property VeQuickItem  sfkV3version: VeQuickItem { 
		id: sfkV3version 
	    uid: mqttprefix + "/System/SFKV3version" }

    property real sfkCurrentVersion: sfkCurrentversion.value || 0.0
    property real sfkV1Version: sfkV1version.value || 0.0
    property real sfkV2Version: sfkV2version.value || 0.0
    property real sfkV3Version: sfkV3version.value || 0.0

    // Boolean properties indicating if a newer version is available
    property bool isSFKV1Newer: sfkV1Version >= sfkCurrentVersion
    property bool isSFKV2Newer: sfkV2Version >= sfkCurrentVersion
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
		uid: mqttprefix + "/SFKVBbatteryflag"
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

			ListRadioButtonGroup {
				//% "SFK Driver Update"
				text: qsTr("Download %1").arg(sfkV3TextInstallConfirm.value)
			
				optionModel: [
					//% "Check for Updates"
					{ display: "Download", value: 1 },
					//% "Cancel"
					{ display: "Cancel", value: 0 }
				]
			
				currentIndex: sfkV3FirmwareDownloadConfirm.value === 1 ? 0 : 1
			
				onOptionClicked: function(index) {
					// Trigger the appropriate action based on the selected option
					if (optionModel[index].value === 1) {
						sfkV3FirmwareDownloadConfirm.setValue(1) // Start checking for updates
					} else {
						sfkV3FirmwareDownloadConfirm.setValue(0) // Cancel the update check
					}
				}
			
				preferredVisible: (installedVersion === requiredVersionv3 ) && sfkFirmwareInstallationCompleted.value === 0 
			}

			ListRadioButtonGroup {
				//% "SFK Driver Update"
				text: qsTr("Install %1").arg(sfkV3TextInstallConfirm.value)
			
				optionModel: [
					//% "Check for Updates"
					{ display: "Install", value: 1 },
					//% "Cancel"
					{ display: "Cancel", value: 0 }
				]
			
				currentIndex: sfkV3InstallConfirmItem.value === 1 ? 0 : 1
			
				onOptionClicked: function(index) {
					// Trigger the appropriate action based on the selected option
					if (optionModel[index].value === 1) {
						sfkV3InstallConfirmItem.setValue(1) // Start checking for updates
					} else {
						sfkV3InstallConfirmItem.setValue(0) // Cancel the update check
					}
				}
			
				preferredVisible: sfkV3FirmwareDownloadCompleted.value === 1 && sfkFirmwareInstallationCompleted.value === 0 
			}
			
			ListRebootButton { }
	
		}
	}
}
