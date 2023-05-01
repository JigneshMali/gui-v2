/*
** Copyright (C) 2021 Victron Energy B.V.
*/

import QtQuick
import Victron.Veutil
import Victron.VenusOS

QtObject {
	id: root

	property var acInputs: AcInputsImpl { }
	property var batteries: BatteriesImpl { }
	property var dcInputs: DcInputsImpl { }
	property var environmentInputs: EnvironmentInputsImpl { }
	property var ess: EssImpl { }
	property var generators: GeneratorsImpl { }
	property var inverters: InvertersImpl { }
	property var notifications: NotificationsImpl {}
	property var relays: RelaysImpl {}
	property var solarChargers: SolarChargersImpl { }
	property var system: SystemImpl { }
	property var systemSettings: SystemSettingsImpl { }
	property var tanks: TanksImpl { }
}
