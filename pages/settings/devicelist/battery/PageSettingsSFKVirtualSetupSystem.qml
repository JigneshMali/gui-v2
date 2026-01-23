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

	property VeQuickItem nrOfBatteries: VeQuickItem {
		id: nrOfBatteries
		uid: mqttPrefix + "/System/NrOfBatteries"
		}	
	property VeQuickItem nrOfCellsPerBattery: VeQuickItem {
		id: nrOfCellsPerBattery
		uid: mqttPrefix + "/System/NrOfCellsPerBattery"
		}	
	property VeQuickItem sfkvirtualbattery: VeQuickItem {
		id: sfkvirtualbattery
		uid: mqttPrefix + "/System/SFKVirtualSetup"
		}	
	property VeQuickItem sfkShowBalanceSeries: VeQuickItem {
		id: sfkShowBalanceSeries
		uid: mqttPrefix + "/System/ShowBalanceSeries"
		}
	property VeQuickItem sfkvbServiceRestart: VeQuickItem {
		id: sfkvbServiceRestart
		uid: mqttPrefix + "/RestartService"
		}	
    property bool showMbSwitch : (["2S_2B_4C", "2S_2B_8C", "3S_3B_4C", "4S_4B_4C","2S2P_4B_4C", "2S2P_4B_8C", "2S3P_6B_4C",  "3S2P_6B_4C",  "2S3P_6B_8C", "3S2P_6B_4C", "4S2P_8B_4C", "2S4P_8B_4C","2S4P_8B_8C"].indexOf(sfkvirtualbattery.value) !== -1) && (sfkShowBalanceSeries.value === "YES")

    function isCelsius() {
        return Global.systemSettings.temperatureUnit === VenusOS.Units_Temperature_Celsius;
    }

    function convertTemperature(temp) {
        return isCelsius() ? temp : (temp * 9 / 5) + 32;
    }

	function sfkSyncLowTempOptionList() {
		if (isCelsius()) {
			return [
				{ display: qsTr("2°C - 10°C"), value: 0 },
				{ display: qsTr("5°C - 13°C"), value: 1 },
				{ display: qsTr("8°C - 16°C"), value: 2 }
			];
		} else {
			return [
				{ display: qsTr("35.6°F - 50°F"), value: 0 },
				{ display: qsTr("41°F - 55.4°F"), value: 1 },
				{ display: qsTr("46.4°F - 60.8°F"), value: 2 }
			];
		}
	}

	function generateOptions() {
		var options = [];
		var nrOfCellsValue = nrOfCellsPerBattery.value || 4; // Default to 4 if undefined
		var nrOfBatteriesValue = nrOfBatteries.value || 2; // Default to 2 if undefined

		if (nrOfBatteriesValue === 2) {
			if (nrOfCellsValue === 4) {
				options = [
					{ display: qsTr("2 in parallel (12v)"), value: "2P_2B_4C" },
					{ display: qsTr("2 in series (24v)"), value: "2S_2B_4C" }
				];
			} else if (nrOfCellsValue === 8) {
				options = [
					{ display: qsTr("2 in parallel (24v)"), value: "2P_2B_8C" },
					{ display: qsTr("2 in series (48v)"), value: "2S_2B_8C" }
				];
			}
		} else if (nrOfBatteriesValue === 3) {
			if (nrOfCellsValue === 4) {
				options = [
					{ display: qsTr("3 in parallel (12v)"), value: "3P_3B_4C" },
					{ display: qsTr("3 in series (36v)"), value: "3S_3B_4C" }
				];
			} else if (nrOfCellsValue === 8) {
				options = [
					{ display: qsTr("3 in parallel (24v)"), value: "3P_3B_8C" }
				];
			}
		} else if (nrOfBatteriesValue === 4) {
			if (nrOfCellsValue === 4) {
				options = [
					{ display: qsTr("4 in parallel (12v)"), value: "4P_4B_4C" },
					{ display: qsTr("4 in series (48v)"), value: "4S_4B_4C" },
					{ display: qsTr("2 in series, 2 in parallel (24v)"), value: "2S2P_4B_4C" }
				];
			} else if (nrOfCellsValue === 8) {
				options = [
					{ display: qsTr("4 in parallel (24v)"), value: "4P_4B_8C" },
					{ display: qsTr("2 in series, 2 in parallel (48v)"), value: "2S2P_4B_8C" }
				];
			}
		} else if (nrOfBatteriesValue === 5) {
			if (nrOfCellsValue === 4) {
				options = [
					{ display: qsTr("5 in parallel (12v)"), value: "5P_5B_4C" }
				];
			} else if (nrOfCellsValue === 8) {
				options = [
					{ display: qsTr("5 in parallel (24v)"), value: "5P_5B_8C" }
				];
			}
		} else if (nrOfBatteriesValue === 6) {
			if (nrOfCellsValue === 4) {
				options = [
					{ display: qsTr("6 in parallel (12v)"), value: "6P_6B_4C" },
					{ display: qsTr("2 in series, 3 in parallel (24v)"), value: "2S3P_6B_4C" },
					{ display: qsTr("3 in series, 2 in parallel (36v)"), value: "3S2P_6B_4C" }
				];
			} else if (nrOfCellsValue === 8) {
				options = [
					{ display: qsTr("6 in parallel (24v)"), value: "6P_6B_8C" },
					{ display: qsTr("2 in series, 3 in parallel (48v)"), value: "2S3P_6B_8C" }
				];
			}
		} else if (nrOfBatteriesValue === 7) {
			if (nrOfCellsValue === 4) {
				options = [
					{ display: qsTr("7 in parallel (12v)"), value: "7P_7B_4C" }
				];
			} else if (nrOfCellsValue === 8) {
				options = [
					{ display: qsTr("7 in parallel (24v)"), value: "7P_7B_8C" }
				];
			}
		} else if (nrOfBatteriesValue === 8) {
			if (nrOfCellsValue === 4) {
				options = [
					{ display: qsTr("8 in parallel (12v)"), value: "8P_8B_4C" },
					{ display: qsTr("2 in series, 4 in parallel (24v)"), value: "2S4P_8B_4C" },
					{ display: qsTr("4 in series, 2 in parallel (48v)"), value: "4S2P_8B_4C" }
				];
			} else if (nrOfCellsValue === 8) {
				options = [
					{ display: qsTr("8 in parallel (24v)"), value: "8P_8B_8C" },
					{ display: qsTr("2 in series, 4 in parallel (48v)"), value: "2S4P_8B_8C" }
				];
			}
		} else {
			options = [
				{ display: qsTr("2 in parallel (12v)"), value: "2P_2B_4C" },
				{ display: qsTr("2 in series (24v)"), value: "2S_2B_4C" }
			];
		}

		return options;
	}

	GradientListView {
		model: VisibleItemModel {

			ListRadioButtonGroup {
				text: "Virtual Battery Setup"
				dataItem.uid: mqttPrefix + "/System/SFKVirtualSetup"
				optionModel: generateOptions()		 
				preferredVisible: nrOfBatteries.value > 1 || nrOfBatteries.value === 0
				onOptionClicked: (index) => {
				Global.showToastNotification(VenusOS.Notification_Info,qsTr("Please restart the virtual battery service to see changes."), 8000)
				}
			}

			ListText {
				//% "Capacity"
				text: "Virtual Battery Setup"
				secondaryText: "Single Battery"
				preferredVisible: nrOfBatteries.value === 1 
			}

			ListNavigation {
				text: "Series Balance Selection"
				preferredVisible: showMbSwitch && nrOfBatteries.value !== 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageSettingsVirtualBatteryBalanceSeries.qml",
							{ "title": text, "bindPrefix": root.bindPrefix  })
				}
			}

			// ListRadioButtonGroup {
			// 	text: "Synchronized Low Temp Options"
			// 	dataItem.uid: mqttPrefix + "/Info/SynchronizedLowTempOptions"
			// 	optionModel: sfkSyncLowTempOptionList()		 
			// }
			
		}
	}
}