/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix
	readonly property bool _hasMultipleDcSources: dcSource2Instance.valid

	function _lineInstanceName(num) {
		return num
			  //: %1 = number of this line instance
			  //% "Line instance #%1"
			? qsTrId("settings_rvc_line_instance_num").arg(num)
			  //% "Line instance"
			: qsTrId("settings_rvc_line_instance")
	}

	VeQuickItem {
		id: dcSource2Instance
		uid: root.bindPrefix + "/DcSource/1/Instance"
	}

	GradientListView {
		model: VisibleItemModel {
			ListSpinBox {
				//% "Charger instance"
				text: qsTrId("settings_rvc_charger_instance")
				dataItem.uid: root.bindPrefix + "/ChargerInstance"
				preferredVisible: dataItem.valid
			}

			ListSpinBox {
				//% "Inverter instance"
				text: qsTrId("settings_rvc_inverter_instance")
				dataItem.uid: root.bindPrefix + "/InverterInstance"
				preferredVisible: dataItem.valid
			}

			ListRadioButtonGroup {
				text: root._lineInstanceName(line2.dataItem.valid ? "1" : "")
				dataItem.uid: root.bindPrefix + "/Line/0/Instance"
				preferredVisible: dataItem.valid
				optionModel: [
					{ display: "L1", value: 0 },
					{ display: "L2", value: 1 },
				]
			}

			ListRadioButtonGroup {
				id: line2

				text: root._lineInstanceName("2")
				dataItem.uid: root.bindPrefix + "/Line/1/Instance"
				preferredVisible: dataItem.valid
				optionModel: [
					{ display: "L1", value: 0 },
					{ display: "L2", value: 1 },
				]
			}

			Column {
				width: parent ? parent.width : 0

				Repeater {
					model: 3
					delegate: SettingsColumn {
						width: parent ? parent.width : 0
						preferredVisible: dcSourceInstance.dataItem.valid || dcSourcePriority.dataItem.valid

						ListSpinBox {
							id: dcSourceInstance
							text: root._hasMultipleDcSources
								  //: %1 = number of this DC source
								  //% "DC source #%1 instance"
								? qsTrId("settings_rvc_dc_source_#_instance").arg(model.index + 1)
								  //% "DC source instance"
								: qsTrId("settings_rvc_dc_source_instance")
							dataItem.uid: root.bindPrefix + "/DcSource/" + model.index + "/Instance"
							preferredVisible: dataItem.valid
						}

						ListSpinBox {
							id: dcSourcePriority
							text: root._hasMultipleDcSources
								  //: %1 = number of this DC source
								  //% "DC source #%1 priority"
								? qsTrId("settings_rvc_dc_source_#_priority").arg(model.index + 1)
								  //% "DC source priority"
								: qsTrId("settings_rvc_dc_source_priority")
							dataItem.uid: root.bindPrefix + "/DcSource/" + model.index + "/Priority"
							preferredVisible: dataItem.valid
						}
					}
				}
			}

			ListSpinBox {
				//% "Tank instance"
				text: qsTrId("settings_rvc_tank_instance")
				dataItem.uid: root.bindPrefix + "/TankInstance"
				preferredVisible: dataItem.valid
			}
		}
	}
}
