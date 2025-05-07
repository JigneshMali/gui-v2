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
				preferredVisible: true
			}

			ListRebootButton { }

		}
	}
}
