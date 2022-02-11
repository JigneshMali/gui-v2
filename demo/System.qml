/*
** Copyright (C) 2021 Victron Energy B.V.
*/

import QtQuick
import Victron.VenusOS
import "/components/Utils.js" as Utils
import "../data" as DBusData

Item {
	id: root

	property int state: DBusData.System.State.AbsorptionCharging

	property QtObject loads: QtObject {
		readonly property real power: ac.consumptionPower + dc.power
		onPowerChanged: Utils.updateMaximumValue("system.loads.power", power)
	}

	property QtObject generator: QtObject {
		// TODO add DC generator input data.
		readonly property real power: ac.gensetPower
		onPowerChanged: Utils.updateMaximumValue("system ? system.generator.power : 0", power)
	}

	property SystemAc ac: SystemAc {}
	property SystemDc dc: SystemDc {}
}
