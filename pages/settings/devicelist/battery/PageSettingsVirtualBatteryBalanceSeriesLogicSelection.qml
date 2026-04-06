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
	
	property VeQuickItem balancingLogicSelection: VeQuickItem {
		id: balancingLogicSelection
		uid: mqttPrefix + "/Info/BalancingLogicSelection" }

	GradientListView {
		model: ObjectModel {

			// ListRadioButtonGroup {
			// 	text: "Balancing Logic"
			// 	dataItem.uid: mqttPrefix + "/Info/BalancingLogicSelection"
			// 	optionModel: [
			// 		{ display: qsTr("Fixed Balancing"), value: 0 },
			// 		{ display: qsTr("Dynamic Balancing"), value: 1 }
			// 	]
			// }

			ListText {
				text: "Balancing Logic"
				dataItem.uid: mqttPrefix + "/Info/BalancingLogicSelection"
				secondaryText: {
					if(dataItem.value === 1){
						return qsTr("Dynamic Balancing")
					} else if (dataItem.value === 0) {
						return qsTr("Fixed Balancing")
					}
				}
			}

			ListRadioButtonGroup {
				text: "Voltage Deviation"
				dataItem.uid: mqttPrefix + "/System/BalanceVoltageDiviation"
				preferredVisible: balancingLogicSelection.value == 0
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
				text: "Activation Voltage"
				dataItem.uid: mqttPrefix + "/Info/ActivationVoltage"
				preferredVisible: true
				optionModel: [
					{ display: qsTr("%1V").arg(3.50), value: 3.50 },
					{ display: qsTr("%1V").arg(3.46), value: 3.46 },
					{ display: qsTr("%1V").arg(3.42), value: 3.42 },
					{ display: qsTr("%1V").arg(3.38), value: 3.38 },
					{ display: qsTr("%1V %2").arg(3.34).arg("[DEFAULT]"), value: 3.34 },
					{ display: qsTr("%1V").arg(3.30), value: 3.30 }
				]
			}


		}
	}
}