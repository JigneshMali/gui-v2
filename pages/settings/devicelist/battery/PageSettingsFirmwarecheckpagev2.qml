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
    // choose D-Bus vs MQTT prefix automatically
    property string bindPrefix:BackendConnection.type === BackendConnection.MqttSource ? "mqtt/" + sfkService : sfkService

	property VeQuickItem  installedVenusOSversion: VeQuickItem { 
		id: installedVenusOSversion  
	    uid: Global.venusPlatform.serviceUid + "/Firmware/Installed/Version"}
    property VeQuickItem  sfkV1FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV1FirmwareDownloadCompleted   
		uid: root.bindPrefix + "/System/SFKV1FirmwareDownloadCompleted" }
    property VeQuickItem  sfkV2FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV2FirmwareDownloadCompleted   
		uid: root.bindPrefix + "/System/SFKV2FirmwareDownloadCompleted" }		
    property VeQuickItem  sfkV3FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV3FirmwareDownloadCompleted   
		uid: root.bindPrefix + "/System/SFKV3FirmwareDownloadCompleted" }
	property VeQuickItem  sfkV1InstallConfirmItem: VeQuickItem { 
		id: sfkV1InstallConfirmItem   
		uid: root.bindPrefix + "/System/SFKV1Installconfirm" }
	property VeQuickItem  sfkV2InstallConfirmItem: VeQuickItem { 
		id: sfkV2InstallConfirmItem   
		uid: root.bindPrefix + "/System/SFKV2Installconfirm" }
	property VeQuickItem  sfkV3InstallConfirmItem: VeQuickItem { 
		id: sfkV3InstallConfirmItem   
		uid: root.bindPrefix + "/System/SFKV3Installconfirm" }	
	property VeQuickItem  sfkV1InstallConfirm: VeQuickItem { 
		id: sfkV1InstallConfirm   
		uid: root.bindPrefix + "/System/SFKV1Installconfirm" }
    property VeQuickItem  sfkV2InstallConfirm: VeQuickItem { 
		id: sfkV2InstallConfirm  
		uid: root.bindPrefix + "/System/SFKV2Installconfirm" }
    property VeQuickItem  sfkV3InstallConfirm: VeQuickItem { 
		id: sfkV3InstallConfirm  
		uid: root.bindPrefix + "/System/SFKV3Installconfirm" }
    property VeQuickItem  sfkFirmwareInstallationCompleted: VeQuickItem { 
		id: sfkFirmwareInstallationCompleted  
		uid: root.bindPrefix + "/System/SFKFirmwareInstallationCompleted" }
    property VeQuickItem  sfkV1TextInstallConfirm: VeQuickItem {
		id: sfkV1TextInstallConfirm  
		uid: root.bindPrefix + "/System/SFKV1Textinstallconfirm" }
    property VeQuickItem  sfkV2TextInstallConfirm: VeQuickItem {
		id: sfkV2TextInstallConfirm  
		uid: root.bindPrefix + "/System/SFKV2Textinstallconfirm" }
    property VeQuickItem  sfkV3TextInstallConfirm: VeQuickItem { 
		id: sfkV3TextInstallConfirm 
		uid: root.bindPrefix + "/System/SFKV3Textinstallconfirm" }
    property VeQuickItem  sfkV1FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV1FirmwareDownloadConfirm 
		uid: root.bindPrefix + "/System/SFKV1Downloaded" }
    property VeQuickItem  sfkV2FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV2FirmwareDownloadConfirm 
		uid: root.bindPrefix + "/System/SFKV2Downloaded" }
    property VeQuickItem  sfkV3FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV3FirmwareDownloadConfirm 
		uid: root.bindPrefix + "/System/SFKV3Downloaded" }
    property VeQuickItem  sfkV1OSTextconfirm: VeQuickItem { 
		id: sfkV1OSTextconfirm  
		uid: root.bindPrefix + "/System/SFKV1OSTextconfirm"}
    property VeQuickItem  sfkV2OSTextconfirm: VeQuickItem { 
		id: sfkV2OSTextconfirm 
		uid: root.bindPrefix + "/System/SFKV2OSTextconfirm" }
    property VeQuickItem  sfkV3OSTextconfirm: VeQuickItem { 
		id: sfkV3OSTextconfirm 
		uid: root.bindPrefix + "/System/SFKV3OSTextconfirm" }
    property VeQuickItem  sfkCompatibleVerisonNr: VeQuickItem {
		id: sfkCompatibleVerisonNr 
		uid: root.bindPrefix + "/System/SFKCompatibleVerisonNr" }
    property VeQuickItem  sfkNumberofVersions: VeQuickItem { 
		id: sfksfkNumberofVersionsvbFlag  
	   uid: root.bindPrefix + "/System/SFKNumberofVersions" }
    property VeQuickItem  isSFKVersionsAvailable: VeQuickItem {
		id: isSFKVersionsAvailable  
	    uid: root.bindPrefix + "/System/IsSFKVersionsAvailable" }
    property VeQuickItem  firmwareVersion: VeQuickItem { 
		id: firmwareVersion  
	    uid: root.bindPrefix + "/FirmwareVersion" }

    // Firmware availability check
    property VeQuickItem  sfkFirmwareAvailableCheck: VeQuickItem { 
		id: sfkFirmwareAvailableCheck   
	    uid: root.bindPrefix + "/System/SFKFirmwareAvailableCheck" }
    property VeQuickItem sfkFirmwareAvailableCheckItem: VeQuickItem { 
		id: sfkFirmwareAvailableCheckItem  
	    uid: root.bindPrefix + "/System/SFKFirmwareAvailableCheck" }

    property string firmwareStatusMessage: isSFKVersionsAvailable.value === 1 ? qsTr("New firmware available.") : qsTr("")
    property string firmwareInstalledMessage: qsTr("Installation completed. Please reboot the device.")

    property VeQuickItem  sfkCurrentversion: VeQuickItem { 
		id: sfkCurrentversion 
	    uid: root.bindPrefix + "/System/SFKcurrentversion" }
    property VeQuickItem  sfkV1version: VeQuickItem { 
		id: sfkV1version   
	    uid: root.bindPrefix + "/System/SFKV1version" }
    property VeQuickItem  sfkV2version: VeQuickItem {
		id: sfkV2version 
	    uid: root.bindPrefix + "/System/SFKV2version" }
    property VeQuickItem  sfkV3version: VeQuickItem { 
		id: sfkV3version 
	    uid: root.bindPrefix + "/System/SFKV3version" }

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
	property VeQuickItem nrOfcell: VeQuickItem {
		id: nrOfcell
		uid: root.bindPrefix +   "/System/NrOfCellsPerBattery"
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

			ListRadioButtonGroup {
				//% "SFK Driver Update"
				text: qsTr("Download %1").arg(sfkV2TextInstallConfirm.value)
			
				optionModel: [
					//% "Check for Updates"
					{ display: "Download", value: 1 },
					//% "Cancel"
					{ display: "Cancel", value: 0 }
				]
			
				currentIndex: sfkV2FirmwareDownloadConfirm.value === 1 ? 0 : 1
			
				onOptionClicked: function(index) {
					// Trigger the appropriate action based on the selected option
					if (optionModel[index].value === 1) {
						sfkV2FirmwareDownloadConfirm.setValue(1) // Start checking for updates
					} else {
						sfkV2FirmwareDownloadConfirm.setValue(0) // Cancel the update check
					}
				}
			
				preferredVisible: (installedVersion === requiredVersionv2 ) && sfkFirmwareInstallationCompleted.value === 0 
			}

			ListRadioButtonGroup {
				//% "SFK Driver Update"
				text: qsTr("Install %1").arg(sfkV2TextInstallConfirm.value)
			
				optionModel: [
					//% "Check for Updates"
					{ display: "Install", value: 1 },
					//% "Cancel"
					{ display: "Cancel", value: 0 }
				]
			
				currentIndex: sfkV2InstallConfirmItem.value === 1 ? 0 : 1
			
				onOptionClicked: function(index) {
					// Trigger the appropriate action based on the selected option
					if (optionModel[index].value === 1) {
						sfkV2InstallConfirmItem.setValue(1) // Start checking for updates
					} else {
						sfkV2InstallConfirmItem.setValue(0) // Cancel the update check
					}
				}
			
				preferredVisible: sfkV2FirmwareDownloadCompleted.value === 1 && sfkFirmwareInstallationCompleted.value === 0 
			}
			
			ListRebootButton { }
	
		}
	}
}
