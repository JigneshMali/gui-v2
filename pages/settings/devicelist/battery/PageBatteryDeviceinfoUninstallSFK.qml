/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix
    property string firmwareUninstalledMessage: qsTr("Driver removed. Please reboot the device.")

	property VeQuickItem sfkFirmwareUninstallationCompleted: VeQuickItem {uid: root.bindPrefix +  "/System/SFKFirmwareUninstallationCompleted"}

	GradientListView {
		model: VisibleItemModel {

			ListText {
				text: "Driver removed. Please reboot the device."  // Directly assigning text as no translation ID exists
				preferredVisible: sfkFirmwareUninstallationCompleted.value === 1  // Control visibility based on your condition
			}

			ListRadioButtonGroup {
				text: "Uninstall SFK driver"
				dataItem.uid: root.bindPrefix + "/System/SFKFirmwareUninstallconfirm"
				preferredVisible: true
				optionModel: [
					{ display: qsTr("Uninstall"), value: 1 },
					{ display: qsTr("Cancel"), value: 0 }
				]
			}

			ListRebootButton { }
						
		}
	}
}
