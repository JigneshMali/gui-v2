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
				{ "description": qsTr("35 °C [DEFAULT]"), "value": 35 },
				{ "description": qsTr("40 °C"), "value": 40 },
				{ "description": qsTr("45 °C"), "value": 45 },
				{ "description": qsTr("50 °C"), "value": 50 }
			];
		} else {
			return [
				{ "description": qsTr("95 °F [DEFAULT]"), "value": 35 },
				{ "description": qsTr("104 °F"), "value": 40 },
				{ "description": qsTr("113 °F"), "value": 45 },
				{ "description": qsTr("122 °F"), "value": 50 }
			];
		}
	}

	GradientListView {
		model: ObjectModel {

			ListText {
				text: "Regulate Max SOC Enable"
				dataItem.uid: root.bindPrefix + "/Info/RegulateMaxSocEnable"
				secondaryText: CommonWords.yesOrNo(dataItem.value)
			}

			ListRadioButtonGroup {
				text: "Heating Pad Temperature Limit"
				dataItem.uid: root.bindPrefix + "/Info/BalanceTemperatureLimit"
				optionModel: getDefaultOptions()		 
			}

			ListRadioButtonGroup {
				text: "Max SOC Limit"
				dataItem.uid: root.bindPrefix + "/Info/MaxSocLimitParameter"
				optionModel: [
					{ display: qsTr("%1% %2").arg(95).arg("[DEFAULT]"), value:95},
					{ display: qsTr("%1%").arg(96), value: 96},
					{ display: qsTr("%1%").arg(97), value: 97 },
					{ display: qsTr("%1%").arg(98), value: 98 }
				]
			}
			
			ListRadioButtonGroup {
				text: "High SOC Time Limit"
				dataItem.uid: root.bindPrefix + "/Info/HighSocTimeLimitParameter"
				optionModel: [
					{ display: qsTr("%1Hours %2").arg(12).arg("[DEFAULT]"), value:12},
					{ display: qsTr("%1Hours").arg(24), value: 24},
					{ display: qsTr("%1Hours").arg(48), value: 48 }
				]
			}

		}
	}
}
