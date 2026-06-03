/*
** SFK H2 Firmware Update Page - Venus OS GUI v2
*/

import QtQuick
import Victron.VenusOS
import QtQuick.Templates as T

Page {
    id: root
    required property string bindPrefix

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
    property VeQuickItem h2DeviceFirmware: VeQuickItem {
        uid: root.bindPrefix + "/H2DeviceFirmware"
    }

    // ── Slot 1 ────────────────────────────────────────────────────────────────
    property VeQuickItem sfkV1H2version: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV1H2version"
    }
    property VeQuickItem sfkV1H2FirmwareReleaseText: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV1H2FirmwareReleaseText"
    }
    property VeQuickItem sfkV1H2Url: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV1H2Url"
    }
    property VeQuickItem sfkV1H2DownloadProgress: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV1H2DownloadProgress"
    }
    property VeQuickItem sfkV1H2DownloadConfirm: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV1H2Downloadconfirm"
    }
    property VeQuickItem sfkV1H2DownloadCompleted: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV1H2DownloadCompleted"
    }
    property VeQuickItem sfkV1H2Date: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/SFKV1H2Date"
    }

    // ── Helpers ───────────────────────────────────────────────────────────────
    readonly property bool pageVisible: isH2DeviceBool.value === 1 && h2SFKFirmwareAvailableCheck.value === 1

    GradientListView {
        model: VisibleItemModel {

            // ══ SLOT 1 ════════════════════════════════════════════════════════

            ListText {
                text: qsTr("Version")
                secondaryText: sfkV1H2version.value
                preferredVisible: pageVisible && sfkV1H2version.value !== ""
            }

            ListButton {
                text: qsTr("Download %1").arg(sfkV1H2version.value)
                secondaryText: sfkV1H2DownloadCompleted.value === 1
                        ? qsTr("Downloaded")
                        : sfkV1H2DownloadProgress.value > 0
                            ? qsTr("Downloading... %1%").arg(sfkV1H2DownloadProgress.value)
                            : qsTr("Download")
                preferredVisible: pageVisible && sfkV1H2version.value !== ""
                onClicked: {
                    if (sfkV1H2DownloadProgress.value === 0 && sfkV1H2DownloadCompleted.value !== 1)
                        sfkV1H2DownloadConfirm.setValue(1)
                }
            }

            ListButton {
                text: qsTr("Update Firmware")
                secondaryText: h2DeviceFirmwareFlashBar.value === 100
                        ? qsTr("Verified & Updated")
                        : loopTestValue.value === 1
                            ? qsTr("Writing... %1%").arg(h2DeviceFirmwareFlashBar.value)
                            : qsTr("Update")
                preferredVisible: pageVisible && sfkV1H2version.value !== "" && noESPFlashFile.value === 1 && sfkV1H2DownloadCompleted.value === 1
                onClicked: {
                    if (!loopTestValue.value) {
                        loopTestValue.setValue(1)
                    }
                }
            }
			
			ListText {
                text: qsTr("Release Notes - [%1]").arg(sfkV1H2Date.value)
                preferredVisible: pageVisible && sfkV1H2version.value !== ""
            }

            ListText {
                text: sfkV1H2FirmwareReleaseText.value
                preferredVisible: pageVisible && sfkV1H2version.value !== ""
            }
        }
    }
}
