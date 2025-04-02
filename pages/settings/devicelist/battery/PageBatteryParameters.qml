/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix

	VeQuickItem {
		id: nrOfcell
		uid: root.bindPrefix + "/System/NrOfCellsPerBattery"
	}

	GradientListView {
		model: VisibleItemModel {
			ListQuantity {
				//% "Charge Voltage Limit (CVL)"
				text: qsTrId("batteryparameters_charge_voltage_limit_cvl")
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeVoltage"
				unit: VenusOS.Units_Volt_DC
			}

			ListRadioButtonGroup {
				text: "Charge Voltage Limit (CVL)"
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeCurrent"
				optionModel: [
					{ display: qsTr("%1V").arg(nrOfcell.value*(3.400)), value: 3.400 },
					{ display: qsTr("%1V").arg(nrOfcell.value*(3.450)), value: 3.450 },
					{ display: qsTr("%1V %2").arg(nrOfcell.value*(3.500)).arg("[DEFAULT]"), value: 3.500 },
					{ display: qsTr("%1V").arg(nrOfcell.value*(3.550)), value: 3.550 },
					{ display: qsTr("%1V").arg(nrOfcell.value*(3.600)), value: 3.600 },					
				]
			}

			ListQuantity {
				//% "Charge Current Limit (CCL)"
				text: qsTrId("batteryparameters_charge_current_limit_ccl")
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeCurrent"
				unit: VenusOS.Units_Amp
			}

			ListQuantity {
				//% "Discharge Current Limit (DCL)"
				text: qsTrId("batteryparameters_discharge_current_limit_dcl")
				dataItem.uid: root.bindPrefix + "/Info/MaxDischargeCurrent"
				unit: VenusOS.Units_Amp
			}

			ListQuantity {
				//% "Low Voltage Disconnect (always ignored)"
				text: qsTrId("batteryparameters_low_voltage_disconnect_always_ignored")
				dataItem.uid: root.bindPrefix + "/Info/BatteryLowVoltage"
				showAccessLevel: VenusOS.User_AccessType_Service
				unit: VenusOS.Units_Volt_DC
			}
		}
	}
}
