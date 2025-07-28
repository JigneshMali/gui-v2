/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root
	property BatteryDetails details
	property string bindPrefix
	property VeQuickItem nrOfBatteries: VeQuickItem {uid: root.bindPrefix + "/System/NrOfBatteries"}
	property VeQuickItem nrOfCellsPerBattery: VeQuickItem {uid: root.bindPrefix +  "/System/NrOfCellsPerBattery"}
	property VeQuickItem sfkvirtualbattery: VeQuickItem {uid: root.bindPrefix +  "/System/SFKVirtualSetup"}
	property VeQuickItem sfkShowBalanceSeries: VeQuickItem {uid: root.bindPrefix +  "/System/ShowBalanceSeries"}
    property bool showMbSwitch : (["2S_2B_4C", "2S_2B_8C", "3S_3B_4C", "4S_4B_4C","2S2P_4B_4C", "2S2P_4B_8C", "2S3P_6B_4C",  "3S2P_6B_4C",  "2S3P_6B_8C", "3S2P_6B_4C", "4S2P_8B_4C", "2S4P_8B_4C","2S4P_8B_8C"].indexOf(sfkvirtualbattery.value) !== -1) && (sfkShowBalanceSeries.value === "YES")

	QtObject {
		id: temperatureData

		readonly property real minCellTemperature: Global.systemSettings.convertFromCelsius(details.minCellTemperature.value)
		readonly property real maxCellTemperature: Global.systemSettings.convertFromCelsius(details.maxCellTemperature.value)
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

			// ListRadioButtonGroup {
			// 	text: "Virtual Battery Setup"
			// 	dataItem.uid: root.bindPrefix + "/System/SFKVirtualSetup"
			// 	optionModel: generateOptions()		 
			// 	preferredVisible: nrOfBatteries.value > 1 || nrOfBatteries.value === 0

			// }

			// ListText {
			// 	//% "Capacity"
			// 	text: "Virtual Battery Setup"
			// 	secondaryText: "Single Battery"
			// 	preferredVisible: nrOfBatteries.value === 1 
			// }

			// ListNavigation {
			// 	text: "Series Balance Selection"
			// 	preferredVisible: showMbSwitch && nrOfBatteries.value !== 1
			// 	onClicked: {
			// 		Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatteryBalanceSeries.qml",
			// 				{ "title": text, "bindPrefix": root.bindPrefix  })
			// 	}
			// }

			ListText {
				//% "Capacity"
				text: qsTrId("lynxionsystem_capacity")
				dataItem.uid: root.bindPrefix + "/Capacity"
				preferredVisible: dataItem.valid
			}

			ListText {
				text: CommonWords.batteries
				dataItem.uid: root.bindPrefix + "/System/NrOfBatteries"
			}

			ListText {
				//% "Parallel"
				text: qsTrId("lynxionsystem_parallel")
				dataItem.uid: root.bindPrefix + "/System/BatteriesParallel"
			}

			ListText {
				//% "Series"
				text: qsTrId("lynxionsystem_series")
				dataItem.uid: root.bindPrefix + "/System/BatteriesSeries"
			}

			ListQuantityGroup {
				//% "Min/max cell voltage"
				text: qsTrId("lynxionsystem_min_max_cell_voltage")
				model: QuantityObjectModel {
					QuantityObject { object: minCellVoltage; unit: VenusOS.Units_Volt_DC; precision: 3 }
					QuantityObject { object: maxCellVoltage; unit: VenusOS.Units_Volt_DC; precision: 3 }
				}
				preferredVisible: minCellVoltage.valid && maxCellVoltage.valid

				VeQuickItem {
					id: minCellVoltage
					uid: root.bindPrefix + "/System/MinCellVoltage"
				}

				VeQuickItem {
					id: maxCellVoltage
					uid: root.bindPrefix + "/System/MaxCellVoltage"
				}
			}

			ListQuantityGroup {
				//% "Min/max cell temperature"
				text: qsTrId("lynxionsystem_min_max_cell_temperature")
				model: QuantityObjectModel {
					QuantityObject { object: details.minCellTemperature;unit: Global.systemSettings.temperatureUnit }
					QuantityObject { object: details.maxCellTemperature;unit: Global.systemSettings.temperatureUnit }
				}
				preferredVisible: details.minCellTemperature.valid && details.maxCellTemperature.valid

				// VeQuickItem {
				// 	id: minCellTemperature
				// 	readonly property real convertedValue: Global.systemSettings.convertFromCelsius(value)
				// 	uid: root.bindPrefix + "/System/MinCellTemperature"
				// }

				// VeQuickItem {
				// 	id: maxCellTemperature
				// 	readonly property real convertedValue: Global.systemSettings.convertFromCelsius(value)
				// 	uid: root.bindPrefix + "/System/MaxCellTemperature"
				// }
			}

			// ListQuantityGroup {
			// 	//% "Min/max cell temperature"
			// 	text: qsTrId("lynxionsystem_min_max_cell_temperature")
			// 	model: QuantityObjectModel {
			// 		QuantityObject { object: minCellTemperature; key: "convertedValue"; unit: Global.systemSettings.temperatureUnit }
			// 		QuantityObject { object: maxCellTemperature; key: "convertedValue"; unit: Global.systemSettings.temperatureUnit }
			// 	}
			// 	preferredVisible: minCellTemperature.valid && maxCellTemperature.valid

			// 	VeQuickItem {
			// 		id: minCellTemperature
			// 		readonly property real convertedValue: Global.systemSettings.convertFromCelsius(value)
			// 		uid: root.bindPrefix + "/System/MinCellTemperature"
			// 	}

			// 	VeQuickItem {
			// 		id: maxCellTemperature
			// 		readonly property real convertedValue: Global.systemSettings.convertFromCelsius(value)
			// 		uid: root.bindPrefix + "/System/MaxCellTemperature"
			// 	}
			// }

			ListText {
				//% "Balancer status"
				text: qsTrId("lynxionsystem_balancer_status")
				dataItem.uid: root.bindPrefix + "/Balancer/Status"
				preferredVisible: dataItem.seen
				secondaryText: {
					switch (dataItem.value) {
					case VenusOS.Battery_Balancer_Balanced:
						//% "Balanced"
						return qsTrId("lynxionsystem_balancer_balanced")
					case VenusOS.Battery_Balancer_Balancing:
						//% "Balancing"
						return qsTrId("lynxionsystem_balancer_balancing")
					case VenusOS.Battery_Balancer_Imbalance:
						//% "Imbalance"
						return qsTrId("lynxionsystem_balancer_imbalance")
					case VenusOS.Battery_Balancer_Unknown:
					default:
						//% "Unknown"
						return qsTrId("lynxionsystem_balancer_unknown")
					}
				}
			}
		}
	}
}
