/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix

	function isCelsius() {
		return Global.systemSettings.temperatureUnit === VenusOS.Units_Temperature_Celsius;
	}

	function getDefaultOptions() {
		if (isCelsius()) {
			return [
				{ display: qsTr("%1 °C").arg(40), value: 40 },
				{ display: qsTr("%1 °C").arg(45), value: 45 },
				{ display: qsTr("%1 °C").arg(50), value: 50 }
			];
		} else {
			return [
				{ display: qsTr("%1 °F").arg(104), value: 40 },
				{ display: qsTr("%1 °F").arg(113), value: 45 },
				{ display: qsTr("%1 °F").arg(122), value: 50 }
			];
		}
	}

	GradientListView {
		model: ObjectModel {

			ListRadioButtonGroup {
				text: "Enable Series Balance"
				dataItem.uid: root.bindPrefix + "/System/BalanceSeriesBatteries"
				optionModel: [
					{ display: qsTr("Yes"), value: "YES" },
					{ display: qsTr("No"), value: "NO" }
				]
			}

			ListRadioButtonGroup {
				text: "Voltage Diviation"
				dataItem.uid: root.bindPrefix +"/System/BalanceVoltageDiviation"
				optionModel: [
					{ display: qsTr("%1mV").arg(100), value: 100},
					{ display: qsTr("%1mV").arg(200), value: 200},
					{ display: qsTr("%1mV %2").arg(300).arg("[DEFAULT]"), value:300},
					{ display: qsTr("%1mV").arg(400), value: 400 },
					{ display: qsTr("%1mV").arg(500), value: 500 }
				]
			}

			ListRadioButtonGroup {
				text: "Balance Temperature Limit"
				dataItem.uid: root.bindPrefix + "/System/BalanceTemperatureLimit"
				optionModel: getDefaultOptions()		 
			}

			ListRadioButtonGroup {
				text: "Activation Voltage"
				dataItem.uid: root.bindPrefix +"/Info/ActivationVoltage"
				optionModel: [
					{ display: qsTr("%1V").arg(3.50), value: 3.50 },
					{ display: qsTr("%1V").arg(3.46), value: 3.46 },
					{ display: qsTr("%1V").arg(3.42), value: 3.42 },
					{ display: qsTr("%1V").arg(3.38), value: 3.38 }
				]
			}
			
			ListText {
				//% "Capacity"
				text: "Balance Voltage Limit"
				dataItem.uid: root.bindPrefix + "/Info/FloatCellVoltage"
				preferredVisible: dataItem.valid
			}

		}
	}
}
