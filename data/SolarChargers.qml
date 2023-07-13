/*
** Copyright (C) 2022 Victron Energy B.V.
*/

import QtQuick
import Victron.VenusOS
import "common"

QtObject {
	id: root

	// Model of all solar chargers
	property DeviceModel model: DeviceModel {
		objectProperty: "solarCharger"
	}

	function addCharger(charger) {
		model.addObject(charger)
	}

	function removeCharger(charger) {
		model.removeObject(charger.serviceUid)
	}

	function reset() {
		model.clear()
	}

	function chargerStateToText(state) {
		switch (state) {
		case VenusOS.SolarCharger_State_Off:
			//% "Off"
			return qsTrId("solarchargers_state_off")
		case VenusOS.SolarCharger_State_Fault:
			//% "Fault"
			return qsTrId("solarchargers_state_fault")
		case VenusOS.SolarCharger_State_Buik:
			//% "Bulk"
			return qsTrId("solarchargers_state_bulk")
		case VenusOS.SolarCharger_State_Absorption:
			//% "Absorption"
			return qsTrId("solarchargers_state_absorption")
		case VenusOS.SolarCharger_State_Float:
			//% "Float"
			return qsTrId("solarchargers_state_float")
		case VenusOS.SolarCharger_State_Storage:
			//% "Storage"
			return qsTrId("solarchargers_state_storage")
		case VenusOS.SolarCharger_State_Equalize:
			//% "Equalize"
			return qsTrId("solarchargers_state_equalize")
		case VenusOS.SolarCharger_State_ExternalControl:
			//% "External control"
			return qsTrId("solarchargers_state_external control")
		default:
			return ""
		}
	}

	Component.onCompleted: Global.solarChargers = root
}
