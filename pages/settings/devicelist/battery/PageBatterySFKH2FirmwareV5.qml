/*
** SFK H2 Firmware Update Page - Venus OS GUI v2
*/

import QtQuick
import Victron.VenusOS
import QtQuick.Templates as T

Page {
    id: root
    required property string bindPrefix
	property int globalDialogResult: 0   // <--- Global result variable	

    // ── Common ────────────────────────────────────────────────────────────────
    property VeQuickItem isH2DeviceBool: VeQuickItem {
        uid: root.bindPrefix + "/H2DeviceBool"
    }
    property VeQuickItem h2SFKFirmwareAvailableCheck: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/H2SFKFirmwareAvailableCheck"
    }
    property VeQuickItem loopTestValue: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/ESPFlashCheck"
    }
    property VeQuickItem noESPFlashFile: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/NoESPFlashFile"
    }
    property VeQuickItem h2DeviceFirmwareFlashBar: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/H2DeviceFirmwareFlashBar"
    }

    // ── Slot 1 ────────────────────────────────────────────────────────────────
    property VeQuickItem sfkV5H2version: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV5H2version"
    }
    property VeQuickItem sfkV5H2FirmwareReleaseText: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV5H2FirmwareReleaseText"
    }
    property VeQuickItem sfkV5H2Url: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV5H2Url"
    }
    property VeQuickItem sfkV5H2DownloadProgress: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV5H2DownloadProgress"
    }
    property VeQuickItem sfkV5H2DownloadConfirm: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV5H2Downloadconfirm"
    }
    property VeQuickItem sfkV5H2DownloadCompleted: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV5H2DownloadCompleted"
    }
    property VeQuickItem sfkV5H2Date: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV5H2Date"
    }

    // ── Helpers ───────────────────────────────────────────────────────────────
    readonly property bool pageVisible: isH2DeviceBool.value === 1 && h2SFKFirmwareAvailableCheck.value === 1

    GradientListView {
        model: VisibleItemModel {

            // ══ SLOT 1 ════════════════════════════════════════════════════════

            ListText {
                text: qsTr("Version")
                secondaryText: sfkV5H2version.value
                preferredVisible: pageVisible && sfkV5H2version.value !== ""
            }

            ListButton {
                text: qsTr("Download %1").arg(sfkV5H2version.value)
                secondaryText: sfkV5H2DownloadCompleted.value === 1
                        ? qsTr("Downloaded")
                        : sfkV5H2DownloadProgress.value > 0
                            ? qsTr("Downloading... %1%").arg(sfkV5H2DownloadProgress.value)
                            : qsTr("Download")
                preferredVisible: pageVisible && sfkV5H2version.value !== ""
                onClicked: {
                    if (sfkV5H2DownloadProgress.value === 0 && sfkV5H2DownloadCompleted.value !== 1)
                        sfkV5H2DownloadConfirm.setValue(1)
                }
            }

            ListButton {
                text: qsTr("Update Firmware")
                secondaryText: h2DeviceFirmwareFlashBar.value === 100
                        ? qsTr("Updated")
                        : loopTestValue.value === 1
                            ? qsTr("Writing... %1%").arg(h2DeviceFirmwareFlashBar.value)
                            : qsTr("Update")
                preferredVisible: pageVisible && sfkV5H2version.value !== "" && noESPFlashFile.value === 1 && sfkV5H2DownloadCompleted.value === 1
                // onClicked: {
                //     if (!loopTestValue.value) {
                //         loopTestValue.setValue(1)
                //     }
                // }
				onClicked: Global.dialogLayer.open(proceedtoUpdateDialog)

            }

            ListText {
                text: qsTr("Release Notes- [%1]").arg(sfkV5H2Date.value)
                preferredVisible: pageVisible && sfkV5H2version.value !== ""
            }

            ListText {
                text: sfkV5H2FirmwareReleaseText.value
                preferredVisible: pageVisible && sfkV5H2version.value !== ""
            }
        }
    }
    Component {
		id: proceedtoUpdateDialog
		ModalWarningDialog {
			title: qsTr("Proceed to Update?")
			description: qsTr("During the firmware update the SFK venus os driver and virtual battery will be stopped.")
			// dialogDoneOptions: "OkAndCancel"  // error of int expected 
			dialogDoneOptions: VenusOS.ModalDialog_DoneOptions_OkAndCancel
			onClosed: function() {
				globalDialogResult  = result 
				if (globalDialogResult  === 1) {
                    loopTestValue.setValue(1)
					}
				globalDialogResult  = 0   // Reset after processing
			}
		}
	}
}
