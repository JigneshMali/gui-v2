/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix

	property VeQuickItem sfkFlag: VeQuickItem{
		id: sfkFlag
		uid: serviceUid +  "/SFKbatteryflag"
	}	
	property VeQuickItem sfkvbFlag: VeQuickItem {
		id: sfkvbFlag
		uid: serviceUid + "/SFKVBbatteryflag"
	}	
	property VeQuickItem versionFlag: VeQuickItem {
		id: versionFlag
		uid: serviceUid +  "/SFKhardwareflag"
		}
	property VeQuickItem nrOfcell: VeQuickItem {
		id: nrOfcell
		uid: root.bindPrefix +   "/System/NrOfCellsPerBattery"
		}	

	GradientListView {
		model: VisibleItemModel {

			ListQuantity {
				//% "Charge Voltage Limit (CVL)"
				text: qsTrId("batteryparameters_charge_voltage_limit_cvl")
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeVoltage"
				preferredVisible:sfkvbFlag  // Control visibility based on your condition
				unit: VenusOS.Units_Volt_DC
			}

			ListQuantity {
				//% "Charge Current Limit (CCL)"
				text: qsTrId("batteryparameters_charge_current_limit_ccl")
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeCurrent"
				preferredVisible: sfkvbFlag  // Control visibility based on your condition
				unit: VenusOS.Units_Amp
			}

			ListQuantity {
				//% "Discharge Current Limit (DCL)"
				text: qsTrId("batteryparameters_discharge_current_limit_dcl")
				dataItem.uid: root.bindPrefix + "/Info/MaxDischargeCurrent"
				preferredVisible: sfkvbFlag  // Control visibility based on your condition
				unit: VenusOS.Units_Amp
			}
		}
	}
}
