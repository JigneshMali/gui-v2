/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS
// import Victron.Mqtt      // <-- this hook makes “mqtt/…” UIDs work
import QtQuick.Templates as T
Page {
	id: root
    property string sfkService: "com.victronenergy.sfksettings"
    property string mqttprefix: "mqtt/sfksettings/0"
    property string bindPrefix: "mqtt/sfksettings/0"


	property VeQuickItem sfkV5DownloadProgress: VeQuickItem {
		id: sfkV5DownloadProgress
		uid: "mqtt/sfksettings/0/System/SFKV5DownloadProgress"}
	property VeQuickItem sfkV5InstallProgress: VeQuickItem {
		id: sfkV5InstallProgress
		uid: "mqtt/sfksettings/0/System/SFKV5InstallProgress"}

	property VeQuickItem  installedVenusOSversion: VeQuickItem { 
		id: installedVenusOSversion  
	    uid: Global.venusPlatform.serviceUid + "/Firmware/Installed/Version"}
    	
    property VeQuickItem  sfkV5FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV5FirmwareDownloadCompleted   
		uid: "mqtt/sfksettings/0/System/SFKV5FirmwareDownloadCompleted" }
	
	property VeQuickItem  sfkV5InstallConfirmItem: VeQuickItem { 
		id: sfkV5InstallConfirmItem   
		uid: "mqtt/sfksettings/0/System/SFKV5Installconfirm" }	
	
    property VeQuickItem  sfkV5InstallConfirm: VeQuickItem { 
		id: sfkV5InstallConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV5Installconfirm" }
    property VeQuickItem  sfkFirmwareInstallationCompleted: VeQuickItem { 
		id: sfkFirmwareInstallationCompleted  
		uid: "mqtt/sfksettings/0/System/SFKFirmwareInstallationCompleted" }
    
    property VeQuickItem  sfkV5TextInstallConfirm: VeQuickItem { 
		id: sfkV5TextInstallConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV5Textinstallconfirm" }
    
    property VeQuickItem  sfkV5FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV5FirmwareDownloadConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV5Downloaded" }
    
    property VeQuickItem  sfkV5OSTextconfirm: VeQuickItem { 
		id: sfkV5OSTextconfirm 
		uid: "mqtt/sfksettings/0/System/SFKV5OSTextconfirm" }
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
    
    property VeQuickItem  sfkV5version: VeQuickItem { 
		id: sfkV5version 
	    uid: "mqtt/sfksettings/0/System/SFKV5version" }

    property real sfkCurrentVersion: sfkCurrentversion.value || 0.0
    property real sfkV5VersionReal: sfkV5version.value || 0.0

    // Boolean properties indicating if a newer version is available
    property bool isSFKV5Newer: sfkV5VersionReal >= sfkCurrentVersion

    property string installedVersionStr: installedVenusOSversion.value || "v0.00"
    property string requiredVersionStrV5: sfkV5OSTextconfirm.value || "v0.00"

    // Function to extract numeric version and convert to float
    function extractVersionNumber(versionString) {
        var match = versionString.match(/v?(\d+\.\d+)/);
        return match ? parseFloat(match[1]) : 0.0;
    }
	    // Convert versions to numbers
    property real installedVersion: extractVersionNumber(installedVersionStr)
    property real requiredVersionV5: extractVersionNumber(requiredVersionStrV5)

    property string versionComparisonMessageV5: (installedVersion > requiredVersionV5) ? qsTr("This driver is not compatible with your Venus OS firmware.") : installedVersion < requiredVersionV5 ? qsTr("This driver is not compatible with your Venus OS firmware.") :  qsTr("This driver is compatible with your Venus OS firmware.")
    property string versionoutdateComparisonMessageV5: (isSFKV5Newer) ? qsTr("") : qsTr("This driver is outdated.")
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
				text: qsTr("%1 %2").arg(versionComparisonMessageV5).arg(versionoutdateComparisonMessageV5)
				preferredVisible: sfkFirmwareInstallationCompleted.value === 0 
			}

			ListText {
				text: installationCompletedPulse ? firmwareInstalledMessage : qsTr("")
				preferredVisible: sfkFirmwareInstallationCompleted.value === 1 
			}

			ListButton {
				text: qsTr("Download %1").arg(sfkV5TextInstallConfirm.value)

				secondaryText:sfkV5DownloadProgress.value === 100
						? qsTr("Downloaded")
					: sfkV5FirmwareDownloadConfirm.value === 1
						? qsTr("Downloading %1%").arg(sfkV5DownloadProgress.value)
					: qsTr("Download")

				preferredVisible: (installedVersion === requiredVersionV5) && sfkFirmwareInstallationCompleted.value === 0

				onClicked: {
					if (sfkV5FirmwareDownloadConfirm.value !== 1 && sfkV5DownloadProgress.value < 100)
						sfkV5FirmwareDownloadConfirm.setValue(1)
				}
			}

			ListButton {
				text: qsTr("Install %1").arg(sfkV5TextInstallConfirm.value)

				secondaryText:sfkV5InstallProgress.value === 100
						? qsTr("Installed")
					: sfkV5InstallConfirmItem.value === 1
						? qsTr("Installing %1%").arg(sfkV5InstallProgress.value)
					: qsTr("Install")

				preferredVisible: sfkV5FirmwareDownloadCompleted.value === 1 && sfkFirmwareInstallationCompleted.value === 0

				onClicked: {
					if (sfkV5InstallConfirmItem.value !== 1 && sfkV5InstallProgress.value < 100)
						sfkV5InstallConfirmItem.setValue(1)
				}
			}

			
			// ListRebootButton { }
			ListButton {
				// id: root

				text: CommonWords.reboot
				//% "Reboot now"
				secondaryText: qsTrId("reboot_button_reboot_now")
				writeAccessLevel: VenusOS.User_AccessType_User
				onClicked: Global.dialogLayer.open(confirmRebootDialogComponent)
				preferredVisible: sfkFirmwareInstallationCompleted.value === 1 
				Component {
					id: confirmRebootDialogComponent

					ModalWarningDialog {
						//% "Press 'OK' to reboot"
						title: qsTrId("reboot_button_press_ok_to_reboot")
						dialogDoneOptions: VenusOS.ModalDialog_DoneOptions_OkAndCancel
						onClosed: {
							if (result === T.Dialog.Accepted) {
								Global.venusPlatform.reboot()
								Qt.callLater(Global.dialogLayer.open, rebootingDialogComponent)
							}
						}
					}
				}

				Component {
					id: rebootingDialogComponent

					ModalRebootingDialog { }
				}
			}	
		}
	}
}
