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
		uid: root.bindPrefix +  "/SFKbatteryflag"
	}	
	property VeQuickItem sfkvbFlag: VeQuickItem {
		id: sfkvbFlag
		uid: root.bindPrefix + "/SFKVBbatteryflag"
	}	
	property VeQuickItem versionFlag: VeQuickItem {
		id: versionFlag
		uid: root.bindPrefix +  "/SFKhardwareflag"
		}
	property VeQuickItem nrOfcell: VeQuickItem {
		id: nrOfcell
		uid: root.bindPrefix +   "/System/NrOfCellsPerBattery"
		}	

	GradientListView {
		model: VisibleItemModel {

			ListText {
				text: "Charge Mode"  // Directly assigning text as no translation ID exists
				dataItem.uid: root.bindPrefix + "/Info/ChargeMode"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}

			ListText {
				text: "Charge Limitation"  // Directly assigning text as no translation ID exists
				dataItem.uid: root.bindPrefix + "/Info/ChargeLimitation"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}
			ListText {
				text: "Discharge Limitation"  // Directly assigning text as no translation ID exists
				dataItem.uid: root.bindPrefix + "/Info/DischargeLimitation"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}

			ListText {
				text: "Charge Voltage Limit (CVL)"  // Directly assigning text as no translation ID exists
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeVoltage"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}
			
			ListText {
				text:  "Charge Current Limit (CCL)"  // Directly assigning text as no translation ID exists
				dataItem.uid: root.bindPrefix + "/Info/MaxChargeCurrent"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}
			
			ListText {
				text: "Discharge Current Limit (DCL)" // Directly assigning text as no translation ID exists
				dataItem.uid: root.bindPrefix + "/Info/MaxDischargeCurrent"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}
			
			ListQuantity {
				//% "Low Voltage Disconnect (always ignored)"
				text: qsTrId("batteryparameters_low_voltage_disconnect_always_ignored")
				dataItem.uid: root.bindPrefix + "/Info/BatteryLowVoltage"
				preferredVisible: dataItem.valid
				showAccessLevel: VenusOS.User_AccessType_Service
				unit: VenusOS.Units_Volt_DC
			}

			ListText {
				//: Shows if the battery requests charging: yes or no
				//% "Requests Charging"
				text: qsTrId("batteryparameters_charge_request")
				dataItem.uid: root.bindPrefix + "/Info/ChargeRequest"
				preferredVisible: dataItem.valid
				secondaryText: CommonWords.yesOrNo(dataItem.value)
			}
		}
	}
}
