/*
** Copyright (C) 2025 Victron Energy B.V.
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
	property string mqttPrefix: "mqtt/battery/" + sfkVBDeviceInstance.value

	component BatteryHeader: ListText {
		id: batteryHeader

		required property string mqttPrefix
		required property int batteryIndex

		text: qsTr("%1").arg(customName.value)
		preferredVisible: customName.valid && firstCellVoltage.value > 0

		VeQuickItem {
			id: customName
			uid: batteryHeader.mqttPrefix + "/Batteries/%1/CustomeName".arg(batteryHeader.batteryIndex)
		}

		VeQuickItem {
			id: firstCellVoltage
			uid: batteryHeader.mqttPrefix + "/Batteries/%1/CellVolts1".arg(batteryHeader.batteryIndex)
		}
	}

	component BatteryCellRow: ListItem {
		id: cellRowItem

		required property string mqttPrefix
		required property int batteryIndex
		required property int startCell

		readonly property int endCell: startCell + 3

		preferredVisible: firstCellVoltage.value !== 0

		VeQuickItem {
			id: firstCellVoltage
			uid: cellRowItem.mqttPrefix + "/Batteries/%1/CellVolts%2".arg(cellRowItem.batteryIndex).arg(cellRowItem.startCell)
		}

		contentItem: Column {
			width: cellRowItem.availableWidth
			spacing: Theme.geometry_listItem_content_spacing

			Label {
				width: parent.width
				text: "Cells %1-%2".arg(cellRowItem.startCell).arg(cellRowItem.endCell)
				color: Theme.color_font_primary
				font.pixelSize: Theme.font_listItem_primary_size
			}

			Row {
				id: cellContentRow

				readonly property real itemWidth: (width - (spacing * 3)) / 4

				width: parent.width
				spacing: Theme.geometry_listItem_content_spacing

				Repeater {
					model: 4

					delegate: Column {
						id: cellColumn

						readonly property int cellNumber: cellRowItem.startCell + model.index

						width: cellContentRow.itemWidth

						QuantityLabel {
							width: parent.width
							value: cellVoltage.value ?? NaN
							unit: VenusOS.Units_Volt_DC
							decimals: 3
							font.pixelSize: 22
						}

						Label {
							width: parent.width
							horizontalAlignment: Text.AlignHCenter
							text: "Cell%1".arg(cellColumn.cellNumber)
							color: Theme.color_font_secondary
							font.pixelSize: Theme.font_size_caption
						}

						VeQuickItem {
							id: cellVoltage
							uid: cellRowItem.mqttPrefix + "/Batteries/%1/CellVolts%2".arg(cellRowItem.batteryIndex).arg(cellColumn.cellNumber)
						}
					}
				}
			}
		}
	}

	GradientListView {
		model: VisibleItemModel {

			BatteryHeader { mqttPrefix: root.mqttPrefix; batteryIndex: 1 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 1; startCell: 1 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 1; startCell: 5 }

			BatteryHeader { mqttPrefix: root.mqttPrefix; batteryIndex: 2 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 2; startCell: 1 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 2; startCell: 5 }

			BatteryHeader { mqttPrefix: root.mqttPrefix; batteryIndex: 3 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 3; startCell: 1 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 3; startCell: 5 }

			BatteryHeader { mqttPrefix: root.mqttPrefix; batteryIndex: 4 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 4; startCell: 1 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 4; startCell: 5 }

			BatteryHeader { mqttPrefix: root.mqttPrefix; batteryIndex: 5 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 5; startCell: 1 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 5; startCell: 5 }

			BatteryHeader { mqttPrefix: root.mqttPrefix; batteryIndex: 6 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 6; startCell: 1 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 6; startCell: 5 }

			BatteryHeader { mqttPrefix: root.mqttPrefix; batteryIndex: 7 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 7; startCell: 1 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 7; startCell: 5 }

			BatteryHeader { mqttPrefix: root.mqttPrefix; batteryIndex: 8 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 8; startCell: 1 }
			BatteryCellRow { mqttPrefix: root.mqttPrefix; batteryIndex: 8; startCell: 5 }
		}
	}
}
