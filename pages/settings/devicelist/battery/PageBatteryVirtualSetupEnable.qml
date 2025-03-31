/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix

	GradientListView {
		model: ObjectModel {

			ListSwitch {
				text: "Enable Virtual Battery"
				dataItem.uid: root.bindPrefix + "/SfkVirtualBatteryActive"
				allowed: defaultAllowed && dataItem.isValid
			}


            ListButton {
				text: CommonWords.reboot
				//% "Reboot now"
				button.text: qsTrId("settings_reboot_now")
				writeAccessLevel: VenusOS.User_AccessType_User
				onClicked: Global.dialogLayer.open(confirmRebootDialogComponent)

				Component {
					id: confirmRebootDialogComponent

					ModalWarningDialog {
						//% "Press 'OK' to reboot"
						title: qsTrId("press_ok_to_reboot")
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

					ModalWarningDialog {
						title: BackendConnection.type === BackendConnection.DBusSource
							//% "Rebooting..."
							? qsTrId("dialoglayer_rebooting")
							//% "Device has been rebooted."
							: qsTrId("dialoglayer_rebooted")

						// On device, dialog cannot be dismissed; just wait until device is rebooted.
						dialogDoneOptions: VenusOS.ModalDialog_DoneOptions_OkOnly
						footer.enabled: BackendConnection.type !== BackendConnection.DBusSource
						footer.opacity: footer.enabled ? 1 : 0
					}
				}
			}
		}
	}
}
