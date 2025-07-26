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
				{ display: qsTr("%1 °C %2").arg(35).arg("[DEFAULT]"), value: 35 },
				{ display: qsTr("%1 °C").arg(40), value: 40 },
				{ display: qsTr("%1 °C").arg(45), value: 45 },
				{ display: qsTr("%1 °C").arg(50), value: 50 }
			];
		} else {
			return [
				{ display: qsTr("%1 °F %2").arg(95).arg("[DEFAULT]"), value: 35 },
				{ display: qsTr("%1 °F").arg(104), value: 40 },
				{ display: qsTr("%1 °F").arg(113), value: 45 },
				{ display: qsTr("%1 °F").arg(122), value: 50 }
			];
		}
	}

	GradientListView {
		model: ObjectModel {

			ListRadioButtonGroup {
				text: "Regulate Max SOC Enable"
				dataItem.uid: "mqtt/sfksettings/0/Info/RegulateMaxSocEnable"
				optionModel: [
					{ display: qsTr("Yes"), value: 1 },
					{ display: qsTr("No"), value: 0 }
				]
			}

			ListRadioButtonGroup {
				text: "Heating Pad Temperature Limit"
				dataItem.uid: "mqtt/sfksettings/0/Info/BalanceTemperatureLimit"
				optionModel: getDefaultOptions()		 
			}

			ListRadioButtonGroup {
				text: "Max SOC Limit"
				dataItem.uid: "mqtt/sfksettings/0/Info/MaxSocLimitParameter"
				optionModel: [
					{ display: qsTr("%1% %2").arg(95).arg("[DEFAULT]"), value:95},
					{ display: qsTr("%1%").arg(96), value: 96},
					{ display: qsTr("%1%").arg(97), value: 97 },
					{ display: qsTr("%1%").arg(98), value: 98 }
				]
			}
			
			ListRadioButtonGroup {
				text: "High SOC Time Limit"
				dataItem.uid: "mqtt/sfksettings/0/Info/HighSocTimeLimitParameter"
				optionModel: [
					{ display: qsTr("%1Hours %2").arg(12).arg("[DEFAULT]"), value:12},
					{ display: qsTr("%1Hours").arg(24), value: 24},
					{ display: qsTr("%1Hours").arg(48), value: 48 }
				]
			}

		}
	}
}
