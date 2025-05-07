/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	// id: root
	property string bindPrefix: "com.victronenergy.sfksettings"


	GradientListView {
		model: VisibleItemModel {

			ListNavigation {
				text: qsTr("Update SFK Driver")
				preferredVisible:  true
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsSFKUpdateDriver.qml",
							{ "title": text, "bindPrefix": "com.victronenergy.sfksettings" })
				}
			}

			ListNavigation {
				text: qsTr("Uninstall SFK Driver")
				preferredVisible:  true
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsSFKUninstallDriver.qml",
							{ "title": text, "bindPrefix": "com.victronenergy.sfksettings" })
				}
			}

		}


	}
}
