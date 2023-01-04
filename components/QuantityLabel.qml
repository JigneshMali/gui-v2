/*
** Copyright (C) 2022 Victron Energy B.V.
*/

import QtQuick
import Victron.VenusOS
import "/components/Units.js" as Units

Item {
	id: root

	property real value
	property int unit: -1
	property alias font: valueLabel.font
	property alias valueColor: valueLabel.color
	readonly property real bottomPadding: height - valueLabel.baselineOffset + Theme.geometry.quantityLabel.bottomMargin

	readonly property var _quantity: unit < 0
			? undefined
			: Units.getDisplayText(unit, value, Theme.geometry.quantityLabel.valueLength)

	// Restrict the height to the baseline to help align the baseline of labels in different
	// QuantityLabel items with different font sizes. E.g. Environments tab may have multiple gauges
	// with different font sizes, that need to align side-by-side at the font baseline.
	implicitWidth: valueLabel.implicitWidth + Theme.geometry.quantityLabel.spacing + unitLabel.implicitWidth
	implicitHeight: Math.ceil(valueLabel.baselineOffset) + Theme.geometry.quantityLabel.bottomMargin

	Label {
		id: valueLabel

		anchors {
			verticalCenter: parent.verticalCenter
			horizontalCenter: parent.horizontalCenter
			horizontalCenterOffset: -(unitLabel.width + Theme.geometry.quantityLabel.spacing)/2
		}
		color: Theme.color.font.primary
		text: root._quantity === undefined ? "" : root._quantity.number
		width: Math.min(implicitWidth, root.width - unitLabel.width - Theme.geometry.quantityLabel.spacing)
		elide: Text.ElideRight
	}

	Label {
		id: unitLabel

		anchors {
			verticalCenter: parent.verticalCenter
			left: valueLabel.right
			leftMargin: Theme.geometry.quantityLabel.spacing
		}
		text: root._quantity === undefined || root._quantity.unit === undefined ? "" : root._quantity.unit
		font: valueLabel.font
		color: Theme.color.font.secondary
	}
}
