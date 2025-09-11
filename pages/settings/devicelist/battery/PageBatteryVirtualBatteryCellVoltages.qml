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
    // ----------------------------------------------------------------------------
	VeQuickItem { id: _b1CustomName; uid: mqttPrefix + "/Batteries/1/CustomeName" }
	VeQuickItem { id: _b2CustomName; uid: mqttPrefix + "/Batteries/2/CustomeName" }
	VeQuickItem { id: _b3CustomName; uid: mqttPrefix + "/Batteries/3/CustomeName" }
	VeQuickItem { id: _b4CustomName; uid: mqttPrefix + "/Batteries/4/CustomeName" }
	VeQuickItem { id: _b5CustomName; uid: mqttPrefix + "/Batteries/5/CustomeName" }
	VeQuickItem { id: _b6CustomName; uid: mqttPrefix + "/Batteries/6/CustomeName" }
	VeQuickItem { id: _b7CustomName; uid: mqttPrefix + "/Batteries/7/CustomeName" }
	VeQuickItem { id: _b8CustomName; uid: mqttPrefix + "/Batteries/8/CustomeName" }
    // ----------------------------------------------------------------------------
    // --------------- BATTERY - 1
	VeQuickItem { id: _b1c1; uid: mqttPrefix + "/Batteries/1/CellBalancing1" }
	VeQuickItem { id: _b1c2; uid: mqttPrefix + "/Batteries/1/CellBalancing2" }
	VeQuickItem { id: _b1c3; uid: mqttPrefix + "/Batteries/1/CellBalancing3" }
	VeQuickItem { id: _b1c4; uid: mqttPrefix + "/Batteries/1/CellBalancing4" }
	VeQuickItem { id: _b1c5; uid: mqttPrefix + "/Batteries/1/CellBalancing5" }
	VeQuickItem { id: _b1c6; uid: mqttPrefix + "/Batteries/1/CellBalancing6" }
	VeQuickItem { id: _b1c7; uid: mqttPrefix + "/Batteries/1/CellBalancing7" }
	VeQuickItem { id: _b1c8; uid: mqttPrefix + "/Batteries/1/CellBalancing8" }
    // ----------------------------
	VeQuickItem { id: b1c1volt; uid: mqttPrefix + "/Batteries/1/CellVolts1" }
	VeQuickItem { id: b1c2volt; uid: mqttPrefix + "/Batteries/1/CellVolts2" }
	VeQuickItem { id: b1c3volt; uid: mqttPrefix + "/Batteries/1/CellVolts3" }
	VeQuickItem { id: b1c4volt; uid: mqttPrefix + "/Batteries/1/CellVolts4" }
	VeQuickItem { id: b1c5volt; uid: mqttPrefix + "/Batteries/1/CellVolts5" }
	VeQuickItem { id: b1c6volt; uid: mqttPrefix + "/Batteries/1/CellVolts6" }
	VeQuickItem { id: b1c7volt; uid: mqttPrefix + "/Batteries/1/CellVolts7" }
	VeQuickItem { id: b1c8volt; uid: mqttPrefix + "/Batteries/1/CellVolts8" }
	// ----------------------------
    // ----------------------------------------------------------------------------
    // --------------- BATTERY - 2
	VeQuickItem { id: _b2c1; uid: mqttPrefix + "/Batteries/2/CellBalancing1" }
	VeQuickItem { id: _b2c2; uid: mqttPrefix + "/Batteries/2/CellBalancing2" }
	VeQuickItem { id: _b2c3; uid: mqttPrefix + "/Batteries/2/CellBalancing3" }
	VeQuickItem { id: _b2c4; uid: mqttPrefix + "/Batteries/2/CellBalancing4" }
	VeQuickItem { id: _b2c5; uid: mqttPrefix + "/Batteries/2/CellBalancing5" }
	VeQuickItem { id: _b2c6; uid: mqttPrefix + "/Batteries/2/CellBalancing6" }
	VeQuickItem { id: _b2c7; uid: mqttPrefix + "/Batteries/2/CellBalancing7" }
	VeQuickItem { id: _b2c8; uid: mqttPrefix + "/Batteries/2/CellBalancing8" }
    // ----------------------------
	VeQuickItem { id: b2c1volt; uid: mqttPrefix + "/Batteries/2/CellVolts1" }
	VeQuickItem { id: b2c2volt; uid: mqttPrefix + "/Batteries/2/CellVolts2" }
	VeQuickItem { id: b2c3volt; uid: mqttPrefix + "/Batteries/2/CellVolts3" }
	VeQuickItem { id: b2c4volt; uid: mqttPrefix + "/Batteries/2/CellVolts4" }
	VeQuickItem { id: b2c5volt; uid: mqttPrefix + "/Batteries/2/CellVolts5" }
	VeQuickItem { id: b2c6volt; uid: mqttPrefix + "/Batteries/2/CellVolts6" }
	VeQuickItem { id: b2c7volt; uid: mqttPrefix + "/Batteries/2/CellVolts7" }
	VeQuickItem { id: b2c8volt; uid: mqttPrefix + "/Batteries/2/CellVolts8" }
	// ----------------------------
	// ----------------------------------------------------------------------------
    // --------------- BATTERY - 1
	VeQuickItem { id: _b3c1; uid: mqttPrefix + "/Batteries/3/CellBalancing1" }
	VeQuickItem { id: _b3c2; uid: mqttPrefix + "/Batteries/3/CellBalancing2" }
	VeQuickItem { id: _b3c3; uid: mqttPrefix + "/Batteries/3/CellBalancing3" }
	VeQuickItem { id: _b3c4; uid: mqttPrefix + "/Batteries/3/CellBalancing4" }
	VeQuickItem { id: _b3c5; uid: mqttPrefix + "/Batteries/3/CellBalancing5" }
	VeQuickItem { id: _b3c6; uid: mqttPrefix + "/Batteries/3/CellBalancing6" }
	VeQuickItem { id: _b3c7; uid: mqttPrefix + "/Batteries/3/CellBalancing7" }
	VeQuickItem { id: _b3c8; uid: mqttPrefix + "/Batteries/3/CellBalancing8" }
    // ----------------------------
	VeQuickItem { id: b3c1volt; uid: mqttPrefix + "/Batteries/3/CellVolts1" }
	VeQuickItem { id: b3c2volt; uid: mqttPrefix + "/Batteries/3/CellVolts2" }
	VeQuickItem { id: b3c3volt; uid: mqttPrefix + "/Batteries/3/CellVolts3" }
	VeQuickItem { id: b3c4volt; uid: mqttPrefix + "/Batteries/3/CellVolts4" }
	VeQuickItem { id: b3c5volt; uid: mqttPrefix + "/Batteries/3/CellVolts5" }
	VeQuickItem { id: b3c6volt; uid: mqttPrefix + "/Batteries/3/CellVolts6" }
	VeQuickItem { id: b3c7volt; uid: mqttPrefix + "/Batteries/3/CellVolts7" }
	VeQuickItem { id: b3c8volt; uid: mqttPrefix + "/Batteries/3/CellVolts8" }
    // ----------------------------------------------------------------------------
    // --------------- BATTERY - 1
	VeQuickItem { id: _b4c1; uid: mqttPrefix + "/Batteries/4/CellBalancing1" }
	VeQuickItem { id: _b4c2; uid: mqttPrefix + "/Batteries/4/CellBalancing2" }
	VeQuickItem { id: _b4c3; uid: mqttPrefix + "/Batteries/4/CellBalancing3" }
	VeQuickItem { id: _b4c4; uid: mqttPrefix + "/Batteries/4/CellBalancing4" }
	VeQuickItem { id: _b4c5; uid: mqttPrefix + "/Batteries/4/CellBalancing5" }
	VeQuickItem { id: _b4c6; uid: mqttPrefix + "/Batteries/4/CellBalancing6" }
	VeQuickItem { id: _b4c7; uid: mqttPrefix + "/Batteries/4/CellBalancing7" }
	VeQuickItem { id: _b4c8; uid: mqttPrefix + "/Batteries/4/CellBalancing8" }
    // ----------------------------
	VeQuickItem { id: b4c1volt; uid: mqttPrefix + "/Batteries/4/CellVolts1" }
	VeQuickItem { id: b4c2volt; uid: mqttPrefix + "/Batteries/4/CellVolts2" }
	VeQuickItem { id: b4c3volt; uid: mqttPrefix + "/Batteries/4/CellVolts3" }
	VeQuickItem { id: b4c4volt; uid: mqttPrefix + "/Batteries/4/CellVolts4" }
	VeQuickItem { id: b4c5volt; uid: mqttPrefix + "/Batteries/4/CellVolts5" }
	VeQuickItem { id: b4c6volt; uid: mqttPrefix + "/Batteries/4/CellVolts6" }
	VeQuickItem { id: b4c7volt; uid: mqttPrefix + "/Batteries/4/CellVolts7" }
	VeQuickItem { id: b4c8volt; uid: mqttPrefix + "/Batteries/4/CellVolts8" }
    // ----------------------------------------------------------------------------
    // --------------- BATTERY - 1
	VeQuickItem { id: _b5c1; uid: mqttPrefix + "/Batteries/5/CellBalancing1" }
	VeQuickItem { id: _b5c2; uid: mqttPrefix + "/Batteries/5/CellBalancing2" }
	VeQuickItem { id: _b5c3; uid: mqttPrefix + "/Batteries/5/CellBalancing3" }
	VeQuickItem { id: _b5c4; uid: mqttPrefix + "/Batteries/5/CellBalancing4" }
	VeQuickItem { id: _b5c5; uid: mqttPrefix + "/Batteries/5/CellBalancing5" }
	VeQuickItem { id: _b5c6; uid: mqttPrefix + "/Batteries/5/CellBalancing6" }
	VeQuickItem { id: _b5c7; uid: mqttPrefix + "/Batteries/5/CellBalancing7" }
	VeQuickItem { id: _b5c8; uid: mqttPrefix + "/Batteries/5/CellBalancing8" }
    // ----------------------------
	VeQuickItem { id: b5c1volt; uid: mqttPrefix + "/Batteries/5/CellVolts1" }
	VeQuickItem { id: b5c2volt; uid: mqttPrefix + "/Batteries/5/CellVolts2" }
	VeQuickItem { id: b5c3volt; uid: mqttPrefix + "/Batteries/5/CellVolts3" }
	VeQuickItem { id: b5c4volt; uid: mqttPrefix + "/Batteries/5/CellVolts4" }
	VeQuickItem { id: b5c5volt; uid: mqttPrefix + "/Batteries/5/CellVolts5" }
	VeQuickItem { id: b5c6volt; uid: mqttPrefix + "/Batteries/5/CellVolts6" }
	VeQuickItem { id: b5c7volt; uid: mqttPrefix + "/Batteries/5/CellVolts7" }
	VeQuickItem { id: b5c8volt; uid: mqttPrefix + "/Batteries/5/CellVolts8" }
    // ----------------------------------------------------------------------------
    // --------------- BATTERY - 1
	VeQuickItem { id: _b6c1; uid: mqttPrefix + "/Batteries/6/CellBalancing1" }
	VeQuickItem { id: _b6c2; uid: mqttPrefix + "/Batteries/6/CellBalancing2" }
	VeQuickItem { id: _b6c3; uid: mqttPrefix + "/Batteries/6/CellBalancing3" }
	VeQuickItem { id: _b6c4; uid: mqttPrefix + "/Batteries/6/CellBalancing4" }
	VeQuickItem { id: _b6c5; uid: mqttPrefix + "/Batteries/6/CellBalancing5" }
	VeQuickItem { id: _b6c6; uid: mqttPrefix + "/Batteries/6/CellBalancing6" }
	VeQuickItem { id: _b6c7; uid: mqttPrefix + "/Batteries/6/CellBalancing7" }
	VeQuickItem { id: _b6c8; uid: mqttPrefix + "/Batteries/6/CellBalancing8" }
    // ----------------------------
	VeQuickItem { id: b6c1volt; uid: mqttPrefix + "/Batteries/6/CellVolts1" }
	VeQuickItem { id: b6c2volt; uid: mqttPrefix + "/Batteries/6/CellVolts2" }
	VeQuickItem { id: b6c3volt; uid: mqttPrefix + "/Batteries/6/CellVolts3" }
	VeQuickItem { id: b6c4volt; uid: mqttPrefix + "/Batteries/6/CellVolts4" }
	VeQuickItem { id: b6c5volt; uid: mqttPrefix + "/Batteries/6/CellVolts5" }
	VeQuickItem { id: b6c6volt; uid: mqttPrefix + "/Batteries/6/CellVolts6" }
	VeQuickItem { id: b6c7volt; uid: mqttPrefix + "/Batteries/6/CellVolts7" }
	VeQuickItem { id: b6c8volt; uid: mqttPrefix + "/Batteries/6/CellVolts8" }
    // ----------------------------------------------------------------------------
    // --------------- BATTERY - 1
	VeQuickItem { id: _b7c1; uid: mqttPrefix + "/Batteries/7/CellBalancing1" }
	VeQuickItem { id: _b7c2; uid: mqttPrefix + "/Batteries/7/CellBalancing2" }
	VeQuickItem { id: _b7c3; uid: mqttPrefix + "/Batteries/7/CellBalancing3" }
	VeQuickItem { id: _b7c4; uid: mqttPrefix + "/Batteries/7/CellBalancing4" }
	VeQuickItem { id: _b7c5; uid: mqttPrefix + "/Batteries/7/CellBalancing5" }
	VeQuickItem { id: _b7c6; uid: mqttPrefix + "/Batteries/7/CellBalancing6" }
	VeQuickItem { id: _b7c7; uid: mqttPrefix + "/Batteries/7/CellBalancing7" }
	VeQuickItem { id: _b7c8; uid: mqttPrefix + "/Batteries/7/CellBalancing8" }
    // ----------------------------
	VeQuickItem { id: b7c1volt; uid: mqttPrefix + "/Batteries/7/CellVolts1" }
	VeQuickItem { id: b7c2volt; uid: mqttPrefix + "/Batteries/7/CellVolts2" }
	VeQuickItem { id: b7c3volt; uid: mqttPrefix + "/Batteries/7/CellVolts3" }
	VeQuickItem { id: b7c4volt; uid: mqttPrefix + "/Batteries/7/CellVolts4" }
	VeQuickItem { id: b7c5volt; uid: mqttPrefix + "/Batteries/7/CellVolts5" }
	VeQuickItem { id: b7c6volt; uid: mqttPrefix + "/Batteries/7/CellVolts6" }
	VeQuickItem { id: b7c7volt; uid: mqttPrefix + "/Batteries/7/CellVolts7" }
	VeQuickItem { id: b7c8volt; uid: mqttPrefix + "/Batteries/7/CellVolts8" }
    // ----------------------------------------------------------------------------
    // --------------- BATTERY - 1
	VeQuickItem { id: _b8c1; uid: mqttPrefix + "/Batteries/8/CellBalancing1" }
	VeQuickItem { id: _b8c2; uid: mqttPrefix + "/Batteries/8/CellBalancing2" }
	VeQuickItem { id: _b8c3; uid: mqttPrefix + "/Batteries/8/CellBalancing3" }
	VeQuickItem { id: _b8c4; uid: mqttPrefix + "/Batteries/8/CellBalancing4" }
	VeQuickItem { id: _b8c5; uid: mqttPrefix + "/Batteries/8/CellBalancing5" }
	VeQuickItem { id: _b8c6; uid: mqttPrefix + "/Batteries/8/CellBalancing6" }
	VeQuickItem { id: _b8c7; uid: mqttPrefix + "/Batteries/8/CellBalancing7" }
	VeQuickItem { id: _b8c8; uid: mqttPrefix + "/Batteries/8/CellBalancing8" }
    // ----------------------------
	VeQuickItem { id: b8c1volt; uid: mqttPrefix + "/Batteries/8/CellVolts1" }
	VeQuickItem { id: b8c2volt; uid: mqttPrefix + "/Batteries/8/CellVolts2" }
	VeQuickItem { id: b8c3volt; uid: mqttPrefix + "/Batteries/8/CellVolts3" }
	VeQuickItem { id: b8c4volt; uid: mqttPrefix + "/Batteries/8/CellVolts4" }
	VeQuickItem { id: b8c5volt; uid: mqttPrefix + "/Batteries/8/CellVolts5" }
	VeQuickItem { id: b8c6volt; uid: mqttPrefix + "/Batteries/8/CellVolts6" }
	VeQuickItem { id: b8c7volt; uid: mqttPrefix + "/Batteries/8/CellVolts7" }
	VeQuickItem { id: b8c8volt; uid: mqttPrefix + "/Batteries/8/CellVolts8" }
    // ----------------------------------------------------------------------------

	GradientListView {
		model: VisibleItemModel {

	// -------------------------------------- custom start
	// ---------------- BATTERY - 1 START
			ListText {
				text:  qsTr("%1").arg(_b1CustomName.value)
				// preferredVisible: _b1CustomName.valid
				preferredVisible: _b1CustomName.valid && b1c1volt.value > 0
			}

			ListItem {
				id: b1cell1OverviewItem
				preferredVisible: b1c1volt.value !== 0
				// preferredVisible: b1c1volt.valid
				text: "Cells 1-4"
				content.children: [
					Row {
						id: b1cell1ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b1cell1OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b1cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b1c1volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell1"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b1cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b1c2volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell2"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b1cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b1c3volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell3"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b1cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b1c4volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell4"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}

			ListItem {
				id: b1cell5OverviewItem
				preferredVisible: b1c5volt.value !== 0
				text: "Cells 5-8"
				content.children: [
					Row {
						id: b1cell5ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b1cell5OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b1cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b1c5volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell5"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b1cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b1c6volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell6"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b1cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b1c7volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell7"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b1cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b1c8volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell8"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}			
	// ---------------- BATTERY - 1 END
	
	// ---------------- BATTERY - 2 START
			ListText {
				text:  qsTr("%1").arg(_b2CustomName.value)
				preferredVisible: _b2CustomName.valid && b2c1volt.value > 0
			}

			ListItem {
				id: b2cell1OverviewItem
				preferredVisible: b2c1volt.value !== 0
				// preferredVisible: b2c1volt.valid
				text: "Cells 1-4"
				content.children: [
					Row {
						id: b2cell1ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b2cell1OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b2cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b2c1volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell1"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b2cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b2c2volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell2"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b2cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b2c3volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell3"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b2cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b2c4volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell4"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}

			ListItem {
				id: b2cell5OverviewItem
				preferredVisible: b2c5volt.value !== 0
				text: "Cells 5-8"
				content.children: [
					Row {
						id: b2cell5ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b2cell5OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b2cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b2c5volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell5"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b2cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b2c6volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell6"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b2cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b2c7volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell7"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b2cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b2c8volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell8"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}			
	// ---------------- BATTERY - 2 END
	// ---------------- BATTERY - 3 START
			ListText {
				text:  qsTr("%1").arg(_b3CustomName.value)
				preferredVisible: _b3CustomName.valid && b3c1volt.value > 0
			}

			ListItem {
				id: b3cell1OverviewItem
				preferredVisible: b3c1volt.value !== 0
				// preferredVisible: b3c1volt.valid
				text: "Cells 1-4"
				content.children: [
					Row {
						id: b3cell1ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b3cell1OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b3cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b3c1volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell1"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b3cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b3c2volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell2"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b3cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b3c3volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell3"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b3cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b3c4volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell4"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}

			ListItem {
				id: b3cell5OverviewItem
				preferredVisible: b3c5volt.value !== 0
				text: "Cells 5-8"
				content.children: [
					Row {
						id: b3cell5ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b3cell5OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b3cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b3c5volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell5"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b3cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b3c6volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell6"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b3cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b3c7volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell7"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b3cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b3c8volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell8"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}			
	// ---------------- BATTERY - 3 END
	// ---------------- BATTERY - 4 START
			ListText {
				text:  qsTr("%1").arg(_b4CustomName.value)
				preferredVisible: _b4CustomName.valid && b4c1volt.value > 0
			}

			ListItem {
				id: b4cell1OverviewItem
				preferredVisible: b4c1volt.value !== 0
				// preferredVisible: b4c1volt.valid
				text: "Cells 1-4"
				content.children: [
					Row {
						id: b4cell1ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b4cell1OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b4cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b4c1volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell1"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b4cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b4c2volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell2"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b4cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b4c3volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell3"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b4cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b4c4volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell4"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}

			ListItem {
				id: b4cell5OverviewItem
				preferredVisible: b4c5volt.value !== 0
				text: "Cells 5-8"
				content.children: [
					Row {
						id: b4cell5ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b4cell5OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b4cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b4c5volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell5"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b4cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b4c6volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell6"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b4cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b4c7volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell7"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b4cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b4c8volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell8"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}			
	// ---------------- BATTERY - 4 END
	// ---------------- BATTERY - 5 START
			ListText {
				text:  qsTr("%1").arg(_b5CustomName.value)
				preferredVisible: _b5CustomName.valid && b5c1volt.value > 0
			}

			ListItem {
				id: b5cell1OverviewItem
				preferredVisible: b5c1volt.value !== 0
				// preferredVisible: b5c1volt.valid
				text: "Cells 1-4"
				content.children: [
					Row {
						id: b5cell1ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b5cell1OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b5cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b5c1volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell1"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b5cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b5c2volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell2"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b5cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b5c3volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell3"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b5cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b5c4volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell4"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}

			ListItem {
				id: b5cell5OverviewItem
				preferredVisible: b5c5volt.value !== 0
				text: "Cells 5-8"
				content.children: [
					Row {
						id: b5cell5ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b5cell5OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b5cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b5c5volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell5"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b5cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b5c6volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell6"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b5cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b5c7volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell7"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b5cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b5c8volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell8"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}			
	// ---------------- BATTERY - 5 END
	// ---------------- BATTERY - 6 START
			ListText {
				text:  qsTr("%1").arg(_b6CustomName.value)
				preferredVisible: _b6CustomName.valid && b6c1volt.value > 0
			}

			ListItem {
				id: b6cell1OverviewItem
				preferredVisible: b6c1volt.value !== 0
				// preferredVisible: b6c1volt.valid
				text: "Cells 1-4"
				content.children: [
					Row {
						id: b6cell1ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b6cell1OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b6cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b6c1volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell1"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b6cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b6c2volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell2"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b6cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b6c3volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell3"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b6cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b6c4volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell4"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}

			ListItem {
				id: b6cell5OverviewItem
				preferredVisible: b6c5volt.value !== 0
				text: "Cells 5-8"
				content.children: [
					Row {
						id: b6cell5ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b6cell5OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b6cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b6c5volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell5"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b6cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b6c6volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell6"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b6cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b6c7volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell7"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b6cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b6c8volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell8"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}			
	// ---------------- BATTERY - 6 END
	// ---------------- BATTERY - 7 START
			ListText {
				text:  qsTr("%1").arg(_b7CustomName.value)
				preferredVisible: _b7CustomName.valid && b7c1volt.value > 0
			}

			ListItem {
				id: b7cell1OverviewItem
				preferredVisible: b7c1volt.value !== 0
				// preferredVisible: b7c1volt.valid
				text: "Cells 1-4"
				content.children: [
					Row {
						id: b7cell1ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b7cell1OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b7cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b7c1volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell1"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b7cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b7c2volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell2"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b7cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b7c3volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell3"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b7cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b7c4volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell4"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}

			ListItem {
				id: b7cell5OverviewItem
				preferredVisible: b7c5volt.value !== 0
				text: "Cells 5-8"
				content.children: [
					Row {
						id: b7cell5ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b7cell5OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b7cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b7c5volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell5"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b7cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b7c6volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell6"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b7cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b7c7volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell7"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b7cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b7c8volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell8"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}			
	// ---------------- BATTERY - 7 END
	// ---------------- BATTERY - 8 START
			ListText {
				text:  qsTr("%1").arg(_b8CustomName.value)
				preferredVisible: _b8CustomName.valid && b8c1volt.value > 0
			}

			ListItem {
				id: b8cell1OverviewItem
				preferredVisible: b8c1volt.value !== 0
				// preferredVisible: b8c1volt.valid
				text: "Cells 1-4"
				content.children: [
					Row {
						id: b8cell1ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b8cell1OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b8cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b8c1volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell1"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b8cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b8c2volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell2"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b8cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b8c3volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell3"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b8cell1ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b8c4volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell4"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}

			ListItem {
				id: b8cell5OverviewItem
				preferredVisible: b8c5volt.value !== 0
				text: "Cells 5-8"
				content.children: [
					Row {
						id: b8cell5ContentOverviewItem

						readonly property real itemWidth: (width - (spacing * 3)) / 4

						width: b8cell5OverviewItem.maximumContentWidth
						spacing: Theme.geometry_listItem_content_spacing

						Column {
							width: b8cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b8c5volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell5"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b8cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b8c6volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell6"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b8cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b8c7volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell7"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
						Column {
							width: b8cell5ContentOverviewItem.itemWidth

							QuantityLabel {
								width: parent.width
								value: b8c8volt.value ?? NaN
								unit: VenusOS.Units_Volt_DC
								precision: 3
								font.pixelSize: 22
							}

							Label {
								width: parent.width
								horizontalAlignment: Text.AlignHCenter
								text: "Cell8"
								color: Theme.color_font_secondary
								font.pixelSize: Theme.font_size_caption
							}
						}
					}
				]
			}			
	// ---------------- BATTERY - 8 END
			
		}
	}
}