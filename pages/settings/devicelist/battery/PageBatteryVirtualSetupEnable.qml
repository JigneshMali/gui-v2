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
				dataItem.uid: "mqtt/sfksettings/0/System/SfkVirtualBatteryActive"
				preferredVisible: true
			}

			ListRebootButton { }

		}
	}
}
