/*
** Copyright (C) 2022 Victron Energy B.V.
*/

import QtQuick
import Victron.VenusOS
import "/components/Utils.js" as Utils

Page {
	id: root

	property string devicePath
	readonly property string serviceType: classAndVrmInstanceItem.value !== undefined ? classAndVrmInstanceItem.value.split(":")[0] : ""
	readonly property int deviceInstance: classAndVrmInstanceItem.value !== undefined ? classAndVrmInstanceItem.value.split(":")[1] : 0

	DataPoint {
		id: classAndVrmInstanceItem
		source: devicePath + "/ClassAndVrmInstance"
	}

	DataPoint {
		id: isMultiPhaseItem
		source: devicePath + "/IsMultiphase"
	}

	DataPoint {
		id: multiPhaseSupport
		source: devicePath + "/SupportMultiphase"
	}

	GradientListView {
		model: ObjectModel {
			ListRadioButtonGroup {
				//% "Role"
				text: qsTrId("settings_cgwacs_role")
				updateOnClick: false
				optionModel: [
					{ display: Utils.qsTrIdServiceType("grid"), value: "grid" },
					{ display: Utils.qsTrIdServiceType("pvinverter"), value: "pvinverter" },
					{ display: Utils.qsTrIdServiceType("genset"), value: "genset" },
					//% "AC meter"
					{ display: qsTrId("settings_ac_meter"), value: "acload" } // TODO - in the old gui, a service type of 'acload' is translated differently here compared to PageSettingsCGwacsOverview. Confirm with victron that this is what they want.
				]
				currentIndex: {
					if (!optionModel || optionModel.length === undefined) {
						return defaultIndex
					}
					for (let i = 0; i < optionModel.length; ++i) {
						if (root.serviceType.split(":")[0] === optionModel[i].value) {
							return i
						}
					}
					return defaultIndex
				}
				onOptionClicked: function(index) {
					currentIndex = index
					classAndVrmInstanceItem.setValue(optionModel[index].value + ":" + deviceInstance)
				}
			}

			ListRadioButtonGroup {
				id: positions
				text: CommonWords.position_ac
				dataSource: root.devicePath + "/Position"
				visible: root.serviceType === "pvinverter"
				optionModel: [
					{ display: CommonWords.ac_input_1, value: VenusOS.PvInverter_Position_ACInput },
					{ display: CommonWords.ac_input_2, value: VenusOS.PvInverter_Position_ACInput2 },
					{ display: CommonWords.ac_output, value: VenusOS.PvInverter_Position_Output },
				]
			}

			ListRadioButtonGroup {
				//% "Phase type"
				text: qsTrId("settings_cgwacs_phase_type")
				dataSource: root.devicePath + "/IsMultiphase"
				enabled: userHasWriteAccess && multiPhaseSupport.value !== undefined
				optionModel: [
					//% "Single phase"
					{ display: qsTrId("settings_single_phase"), value: 0},
					//% "Multi phase"
					{ display: qsTrId("settings_multi_phase"), value: 1},
				]
			}

			ListSwitch {
				id: pvOnL2
				//% "PV inverter on phase 2"
				text: qsTrId("settings_pv_inverter_on_phase_2")
				dataSource: root.devicePath + "_S/Enabled"
				visible: multiPhaseSupport.value
						 && isMultiPhaseItem.value !== undefined
						 && !isMultiPhaseItem.value
						 && root.serviceType === "grid"
			}

			ListRadioButtonGroup {
				//% "PV inverter on phase 2 Position"
				text: qsTrId("settings_cgwacs_pv_inverter_l2_position")
				dataSource: root.devicePath + "_S/Position"
				visible: pvOnL2.checked
				optionModel: positions.optionModel
			}
		}
	}
}
