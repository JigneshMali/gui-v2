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
       // property string bindPrefix:BackendConnection.type === BackendConnection.MqttSource ? "mqtt/" + sfkService : sfkService
    // property string bindPrefix:"mqtt/" + sfkService
    property string bindPrefix: "mqtt/com.victronenergy.sfksettings"


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
