/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix

	property VeQuickItem nrOfcell: VeQuickItem {
		id: nrOfcell
		uid: "mqtt/sfksettings/0/System/NrOfCellsPerBattery"
		}	

	GradientListView {
		model: VisibleItemModel {

			ListText {
				text: "Please Restart device to see changes."  // Directly assigning text as no translation ID exists
				// dataItem.uid: "mqtt/sfksettings/0/Info/ChargeMode"  // Directly reading from the required path
				preferredVisible: true  // Control visibility based on your condition
			}
            
			ListRadioButtonGroup {
				text: "Charge Voltage Limit (CVL)"
				dataItem.uid: "mqtt/sfksettings/0/Info/MaxChargeVoltage"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.400)), value: 3.400 },
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.425)), value: 3.425 },
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.450)), value: 3.450 },
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.475)), value: 3.475 },
                    { display:qsTr("%1V %2").arg(nrOfcell.value*(3.500)).arg("[DEFAULT]"), value: 3.500 },
                    { display:qsTr("%1V").arg(nrOfcell.value*(3.525)), value: 3.525 },
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.550)), value: 3.550 },
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.575)), value: 3.575 },
                    { display: qsTr("%1V").arg(nrOfcell.value*(3.600)), value: 3.600 }				
				]
			}

			ListRadioButtonGroup {
				text: "Charge Current Limit (CCL)"
				dataItem.uid: "mqtt/sfksettings/0/Info/MaxChargeCurrent"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1A").arg(40.0), value: 40 },
					{ display: qsTr("%1A").arg(50.0), value: 50 },
					{ display: qsTr("%1A").arg(60.0), value: 60 },
					{ display: qsTr("%1A %2").arg(70.0).arg("[DEFAULT]"), value: 70 },
					{ display: qsTr("%1A").arg(80.0), value: 80 },
					{ display: qsTr("%1A").arg(90.0), value: 90 }
				]
            }

			ListRadioButtonGroup {
				text: "Discharge Current Limit (DCL)"
				dataItem.uid: "mqtt/sfksettings/0/Info/MaxDischargeCurrent"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1A").arg(50.0), value: 50 },
					{ display: qsTr("%1A").arg(60.0), value: 60 },
					{ display: qsTr("%1A").arg(70.0), value: 70 },
					{ display: qsTr("%1A").arg(80.0), value: 80 },
					{ display: qsTr("%1A %2").arg(90.0).arg("[DEFAULT]"), value: 90 },
					{ display: qsTr("%1A").arg(100.0), value: 100 }
				]
			}

			ListRadioButtonGroup {
				text: "SOC Reset Voltage"
				dataItem.uid: "mqtt/sfksettings/0/Info/SOCResetVoltage"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.450)).arg((3.450)), value: 3.450 },
                    { display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.475)).arg((3.475)), value: 3.475 },
					{ display: qsTr("%1V (%2V/cell) [DEFAULT]").arg(nrOfcell.value*(3.500)).arg((3.500)), value: 3.500 },
                    { display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.525)).arg((3.525)), value: 3.525 },
                    { display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.550)).arg((3.550)), value: 3.550 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.575)).arg((3.575)), value: 3.575 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.600)).arg((3.600)), value: 3.600 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.625)).arg((3.625)), value: 3.625 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.650)).arg((3.650)), value: 3.650 }
				]
			}

			ListRadioButtonGroup {
				text: "Min Cell Voltage"
				dataItem.uid: "mqtt/sfksettings/0/Info/MinCellVoltage"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1V").arg(2.700), value: 2.700 },
					{ display: qsTr("%1V").arg(2.800), value: 2.800 },
					{ display: qsTr("%1V %2").arg(2.900).arg("[DEFAULT]"), value: 2.900 },
					{ display: qsTr("%1V").arg(3.000), value: 3.000 }
				]
			}

			ListRadioButtonGroup {
				text: "Max Cell Voltage"
				dataItem.uid: "mqtt/sfksettings/0/Info/MaxCellVoltage"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1V %2").arg(3.500).arg("[DEFAULT]"), value: 3.500 },
					{ display: qsTr("%1V").arg(3.550), value: 3.550 },
					{ display: qsTr("%1V").arg(3.600), value: 3.600 }
				]
			}

			ListRadioButtonGroup {
				text: "Float Cell Voltage"
				dataItem.uid: "mqtt/sfksettings/0/Info/FloatCellVoltage"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.300)).arg((3.300)), value: 3.300 },
					{ display: qsTr("%1V (%2V/cell) [DEFAULT]").arg(nrOfcell.value*(3.325)).arg((3.325)), value: 3.325 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.350)).arg((3.350)), value: 3.350 },
					{ display: qsTr("%1V (%2V/cell)").arg(nrOfcell.value*(3.375)).arg((3.375)), value: 3.375 }
				]
			}

			ListRadioButtonGroup {
				text: "Poll Rate"
				dataItem.uid: "mqtt/sfksettings/0/BMSPollrate"
				preferredVisible: true  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("1 Second"), value: 1000 },
					{ display: qsTr("2 Seconds %1").arg("[DEFAULT]"), value: 2000 },
					{ display: qsTr("3 Seconds"), value: 3000 }
					{ display: qsTr("4 Seconds"), value: 4000 },
					{ display: qsTr("5 Seconds"), value: 5000 }
				]
			}

			ListNavigation {
				text: "Regulate Max SOC Options"
				preferredVisible: true  // Control visibility based on your condition
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatteryParametersRegulateSoc.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
			}
		}
	}
}
