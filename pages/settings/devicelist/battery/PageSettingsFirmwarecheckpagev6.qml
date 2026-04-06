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


	property VeQuickItem sfkV6DownloadProgress: VeQuickItem {
		id: sfkV6DownloadProgress
		uid: "mqtt/sfksettings/0/System/SFKV6DownloadProgress"}
	property VeQuickItem sfkV6InstallProgress: VeQuickItem {
		id: sfkV6InstallProgress
		uid: "mqtt/sfksettings/0/System/SFKV6InstallProgress"}

	property VeQuickItem  installedVenusOSversion: VeQuickItem { 
		id: installedVenusOSversion  
	    uid: Global.venusPlatform.serviceUid + "/Firmware/Installed/Version"}
    	
    property VeQuickItem  sfkV6FirmwareDownloadCompleted: VeQuickItem { 
		id: sfkV6FirmwareDownloadCompleted   
		uid: "mqtt/sfksettings/0/System/SFKV6FirmwareDownloadCompleted" }
	
	property VeQuickItem  sfkV6InstallConfirmItem: VeQuickItem { 
		id: sfkV6InstallConfirmItem   
		uid: "mqtt/sfksettings/0/System/SFKV6Installconfirm" }	
	
    property VeQuickItem  sfkV6InstallConfirm: VeQuickItem { 
		id: sfkV6InstallConfirm  
		uid: "mqtt/sfksettings/0/System/SFKV6Installconfirm" }
    property VeQuickItem  sfkFirmwareInstallationCompleted: VeQuickItem { 
		id: sfkFirmwareInstallationCompleted  
		uid: "mqtt/sfksettings/0/System/SFKFirmwareInstallationCompleted" }
    
    property VeQuickItem  sfkV6TextInstallConfirm: VeQuickItem { 
		id: sfkV6TextInstallConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV6Textinstallconfirm" }
    
    property VeQuickItem  sfkV6FirmwareDownloadConfirm: VeQuickItem { 
		id: sfkV6FirmwareDownloadConfirm 
		uid: "mqtt/sfksettings/0/System/SFKV6Downloaded" }
    
    property VeQuickItem  sfkV6OSTextconfirm: VeQuickItem { 
		id: sfkV6OSTextconfirm 
		uid: "mqtt/sfksettings/0/System/SFKV6OSTextconfirm" }
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
    
    property VeQuickItem  sfkV6version: VeQuickItem { 
		id: sfkV6version 
	    uid: "mqtt/sfksettings/0/System/SFKV6version" }

    property real sfkCurrentVersion: sfkCurrentversion.value || 0.0
    property real sfkV6VersionReal: sfkV6version.value || 0.0

    // Boolean properties indicating if a newer version is available
    property bool isSFKV6Newer: sfkV6VersionReal >= sfkCurrentVersion

    property string installedVersionStr: installedVenusOSversion.value || "v0.00"
    property string requiredVersionStrV6: sfkV6OSTextconfirm.value || "v0.00"

    // Function to extract numeric version and convert to float
    function extractVersionNumber(versionString) {
        var match = versionString.match(/v?(\d+\.\d+)/);
        return match ? parseFloat(match[1]) : 0.0;
    }
	    // Convert versions to numbers
    property real installedVersion: extractVersionNumber(installedVersionStr)
    property real requiredVersionV6: extractVersionNumber(requiredVersionStrV6)

    property string versionComparisonMessageV6: (installedVersion > requiredVersionV6) ? qsTr("This driver is not compatible with your Venus OS firmware.") : installedVersion < requiredVersionV6 ? qsTr("This driver is not compatible with your Venus OS firmware.") :  qsTr("This driver is compatible with your Venus OS firmware.")
    property string versionoutdateComparisonMessageV6: (isSFKV6Newer) ? qsTr("") : qsTr("This driver is outdated.")
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
				text: qsTr("%1 %2").arg(versionComparisonMessageV6).arg(versionoutdateComparisonMessageV6)
				preferredVisible: sfkFirmwareInstallationCompleted.value === 0 
			}

			ListText {
				text: installationCompletedPulse ? firmwareInstalledMessage : qsTr("")
				preferredVisible: sfkFirmwareInstallationCompleted.value === 1 
			}

			ListButton {
				text: qsTr("Download %1").arg(sfkV6TextInstallConfirm.value)

				secondaryText:sfkV6DownloadProgress.value === 100
						? qsTr("Downloaded")
					: sfkV6FirmwareDownloadConfirm.value === 1
						? qsTr("Downloading %1%").arg(sfkV6DownloadProgress.value)
					: qsTr("Download")

				preferredVisible: (installedVersion === requiredVersionV6) && sfkFirmwareInstallationCompleted.value === 0

				onClicked: {
					if (sfkV6FirmwareDownloadConfirm.value !== 1 && sfkV6DownloadProgress.value < 100)
						sfkV6FirmwareDownloadConfirm.setValue(1)
				}
			}

			ListButton {
				text: qsTr("Install %1").arg(sfkV6TextInstallConfirm.value)

				secondaryText:sfkV6InstallProgress.value === 100
						? qsTr("Installed")
					: sfkV6InstallConfirmItem.value === 1
						? qsTr("Installing %1%").arg(sfkV6InstallProgress.value)
					: qsTr("Install")

				preferredVisible: sfkV6FirmwareDownloadCompleted.value === 1 && sfkFirmwareInstallationCompleted.value === 0

				onClicked: {
					if (sfkV6InstallConfirmItem.value !== 1 && sfkV6InstallProgress.value < 100)
						sfkV6InstallConfirmItem.setValue(1)
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
