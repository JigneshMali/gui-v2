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
				text: "Virtual Battery"
				dataItem.uid: "mqtt/sfksettings/0/SfkVirtualBatteryActive"
				preferredVisible: true
			}
			
			ListRadioButtonGroup {
				text: "Virtual Battery Logic"
				dataItem.uid: "mqtt/sfksettings/0/SfkVirtualBatteryLogic"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
                    { display: qsTr( "Dbus Monitor"), value: 0 },
                    { display: qsTr( "Vedbus Item Import"), value: 1 }
			
				]
			}

			ListText {
				text: "Virtual Battery Logic"
				dataItem.uid: "mqtt/sfksettings/0/SfkVirtualBatteryActive"
				preferredVisible: true
				secondaryText: dataItem.value === 1 ? "Vedbus Item Import" : dataItem.value === 0 ? "Dbus Monitor" : ""
			}

			ListRebootButton { }

		}
	}
}
