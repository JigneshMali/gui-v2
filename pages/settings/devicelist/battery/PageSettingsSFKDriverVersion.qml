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
    property string bindPrefix: "mqtt/sfksettings/0"

	GradientListView {
		model: VisibleItemModel {

			ListNavigation {
				text: qsTr("Update SFK Driver")
				preferredVisible:  true
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsSFKUpdateDriver.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: qsTr("Uninstall SFK Driver")
				preferredVisible:  true
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsSFKUninstallDriver.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

		}


	}
}
