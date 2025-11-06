/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix
		property VeQuickItem sfkVBDeviceInstance: VeQuickItem {
		id: sfkVBDeviceInstance
		uid: "mqtt/sfksettings/0/SfkVBDeviceInstance"
	}
	
	// Dynamic MQTT path base
	property string mqttPrefix: "mqtt/battery/" + sfkVBDeviceInstance.value

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
				dataItem.uid: mqttPrefix + "/System/BalanceSeriesBatteries"
				optionModel: [
					{ display: qsTr("Yes"), value: "YES" },
					{ display: qsTr("No"), value: "NO" }
				]
			}

			ListRadioButtonGroup {
				text: "Voltage Diviation"
				dataItem.uid: mqttPrefix + "/System/BalanceVoltageDiviation"
				optionModel: [
					{ display: qsTr("%1mV").arg(10), value: 10 },
					{ display: qsTr("%1mV").arg(15), value: 15 },
					{ display: qsTr("%1mV %2").arg(20).arg("[DEFAULT]"), value:20},
					{ display: qsTr("%1mV").arg(25), value: 25 },
					{ display: qsTr("%1mV").arg(30), value: 30 },
					{ display: qsTr("%1mV").arg(45), value: 45 },
					{ display: qsTr("%1mV").arg(60), value: 60 }
				]
			}

			ListRadioButtonGroup {
				text: "Balance Temperature Limit"
				dataItem.uid: mqttPrefix + "/System/BalanceTemperatureLimit"
				optionModel: getDefaultOptions()		 
			}

			ListRadioButtonGroup {
				text: "Activation Voltage"
				dataItem.uid: mqttPrefix + "/Info/ActivationVoltage"
				optionModel: [
					{ display: qsTr("%1V").arg(3.50), value: 3.50 },
					{ display: qsTr("%1V").arg(3.46), value: 3.46 },
					{ display: qsTr("%1V").arg(3.42), value: 3.42 },
					{ display: qsTr("%1V").arg(3.38), value: 3.38 },
					{ display: qsTr("%1V %2").arg(3.34).arg("[DEFAULT]"), value: 3.34 },
					{ display: qsTr("%1V").arg(3.30), value: 3.30 }
				]
			}
			
			ListRadioButtonGroup {
				text: "Dynamic Balancing"
				dataItem.uid: mqttPrefix + "/Info/DynamicBalancing"
				optionModel: [
					{ display: qsTr("%1mV").arg(35), value: 35 },
					{ display: qsTr("%1mV").arg(30), value: 30 },
					{ display: qsTr("%1mV").arg(25), value: 25 },
					{ display: qsTr("%1mV").arg(20), value: 20 },
					{ display: qsTr("%1mV").arg(15), value: 15 }
				]
			}

			ListText {
				//% "Capacity"
				text: "Balance Voltage Limit"
				dataItem.uid: mqttPrefix + "/Info/FloatCellVoltage"
				preferredVisible: dataItem.valid
			}

		}
	}
}