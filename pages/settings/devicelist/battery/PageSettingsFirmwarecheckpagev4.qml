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


	property VeQuickItem sfkV4DownloadProgress: VeQuickItem {
		id: sfkV4DownloadProgress
		uid: "mqtt/sfksettings/0/System/SFKV4DownloadProgress"}
	property VeQuickItem sfkV4InstallProgress: VeQuickItem {
		id: sfkV4InstallProgress
		uid: "mqtt/sfksettings/0/System/SFKV4InstallProgress"}

	property VeQuickItem  installedVenusOSversion: VeQuickItem { 
		id: installedVenusOSversion  
	    uid: Global.venusPlatform.serviceUid + "/Firmware/Installed/Version"}
    	
    property VeQuickItem  sfkV4FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV4FirmwareDownloadCompleted   
		uid: "mqtt/sfksettings/0/System/SFKV4FirmwareDownloadCompleted" }
	
	property VeQuickItem  sfkV4InstallConfirmItem: VeQuickItem { 
		id: sfkV4InstallConfirmItem   
		uid: "mqtt/sfksettings/0/System/SFKV4Installconfirm" }	
	
    property VeQuickItem  sfkV4InstallConfirm: VeQuickItem { 
		id: sfkV4InstallConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV4Installconfirm" }
    property VeQuickItem  sfkFirmwareInstallationCompleted: VeQuickItem { 
		id: sfkFirmwareInstallationCompleted  
		uid: "mqtt/sfksettings/0/System/SFKFirmwareInstallationCompleted" }
    
    property VeQuickItem  sfkV4TextInstallConfirm: VeQuickItem { 
		id: sfkV4TextInstallConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV4Textinstallconfirm" }
    
    property VeQuickItem  sfkV4FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV4FirmwareDownloadConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV4Downloaded" }
    
    property VeQuickItem  sfkV4OSTextconfirm: VeQuickItem { 
		id: sfkV4OSTextconfirm 
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
    
    property VeQuickItem  sfkV4version: VeQuickItem { 
		id: sfkV4version 
	    uid: "mqtt/sfksettings/0/System/SFKV4version" }

    property real sfkCurrentVersion: sfkCurrentversion.value || 0.0
    property real sfkV4VersionReal: sfkV4version.value || 0.0

    // Boolean properties indicating if a newer version is available
    property bool isSFKV4Newer: sfkV4VersionReal >= sfkCurrentVersion

    property string installedVersionStr: installedVenusOSversion.value || "v0.00"
    property string requiredVersionStrV4: sfkV4OSTextconfirm.value || "v0.00"

    // Function to extract numeric version and convert to float
    function extractVersionNumber(versionString) {
        var match = versionString.match(/v?(\d+\.\d+)/);
        return match ? parseFloat(match[1]) : 0.0;
    }
	    // Convert versions to numbers
    property real installedVersion: extractVersionNumber(installedVersionStr)
    property real requiredVersionV4: extractVersionNumber(requiredVersionStrV4)

    property string versionComparisonMessageV4: (installedVersion > requiredVersionV4) ? qsTr("This driver is not compatible with your Venus OS firmware.") : installedVersion < requiredVersionV4 ? qsTr("This driver is not compatible with your Venus OS firmware.") :  qsTr("This driver is compatible with your Venus OS firmware.")
    property string versionoutdateComparisonMessageV4: (isSFKV4Newer) ? qsTr("") : qsTr("This driver is outdated.")
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
				text: qsTr("%1 %2").arg(versionComparisonMessageV4).arg(versionoutdateComparisonMessageV4)
				preferredVisible: sfkFirmwareInstallationCompleted.value === 0 
			}

			ListText {
				text: installationCompletedPulse ? firmwareInstalledMessage : qsTr("")
				preferredVisible: sfkFirmwareInstallationCompleted.value === 1 
			}

			ListButton {
				text: qsTr("Download %1").arg(sfkV4TextInstallConfirm.value)

				secondaryText:sfkV4DownloadProgress.value === 100
						? qsTr("Downloaded")
					: sfkV4FirmwareDownloadConfirm.value === 1
						? qsTr("Downloading %1%").arg(sfkV4DownloadProgress.value)
					: qsTr("Download")

				preferredVisible: (installedVersion === requiredVersionV4) && sfkFirmwareInstallationCompleted.value === 0

				onClicked: {
					if (sfkV4FirmwareDownloadConfirm.value !== 1 && sfkV4DownloadProgress.value < 100)
						sfkV4FirmwareDownloadConfirm.setValue(1)
				}
			}

			ListButton {
				text: qsTr("Install %1").arg(sfkV4TextInstallConfirm.value)

				secondaryText:sfkV4InstallProgress.value === 100
						? qsTr("Installed")
					: sfkV4InstallConfirmItem.value === 1
						? qsTr("Installing %1%").arg(sfkV4InstallProgress.value)
					: qsTr("Install")

				preferredVisible: sfkV4FirmwareDownloadCompleted.value === 1 && sfkFirmwareInstallationCompleted.value === 0

				onClicked: {
					if (sfkV4InstallConfirmItem.value !== 1 && sfkV4InstallProgress.value < 100)
						sfkV4InstallConfirmItem.setValue(1)
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
