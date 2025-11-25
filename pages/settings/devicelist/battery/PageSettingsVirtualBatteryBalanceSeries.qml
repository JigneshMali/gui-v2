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

			ListNavigation {
				text: "Balancing Logic"
				preferredVisible: true
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsVirtualBatteryBalanceSeriesLogicSelection.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
			}

			ListRadioButtonGroup {
				text: "Balance Temperature Limit"
				dataItem.uid: mqttPrefix + "/System/BalanceTemperatureLimit"
				optionModel: getDefaultOptions()		 
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