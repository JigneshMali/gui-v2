/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

//
// An AC input's metadata, from com.victronenergy.system/Ac/In/<1|2>.
//
QtObject {
	id: root

	required property int inputIndex
	readonly property string bindPrefix: Global.system.serviceUid + "/Ac/In/" + inputIndex
	readonly property bool valid: deviceInstance >= 0 && serviceType.length && serviceName.length

	readonly property bool connected: !!_connected.value
	readonly property int deviceInstance: _deviceInstance.valid ? _deviceInstance.value : -1
	readonly property string serviceType: _serviceType.value || "" // e.g. "vebus"
	readonly property string serviceName: _serviceName.value || "" // e.g. com.victronenergy.vebus.ttyO, com.victronenergy.grid.ttyO
	readonly property int source: _source.valid ? _source.value : VenusOS.AcInputs_InputSource_NotAvailable
	readonly property real minimumCurrent: _minimumCurrent.valid ? _minimumCurrent.value : NaN
	readonly property real maximumCurrent: _maximumCurrent.valid ? _maximumCurrent.value : NaN

	signal serviceInfoChanged

	readonly property VeQuickItem _connected: VeQuickItem {
		uid: root.bindPrefix ? root.bindPrefix + "/Connected" : ""
	}

	readonly property VeQuickItem _deviceInstance: VeQuickItem {
		uid: root.bindPrefix ? root.bindPrefix + "/DeviceInstance" : ""
		onValueChanged: Qt.callLater(root.serviceInfoChanged)
	}

	readonly property VeQuickItem _serviceName: VeQuickItem {
		uid: root.bindPrefix ? root.bindPrefix + "/ServiceName" : ""
		onValueChanged: Qt.callLater(root.serviceInfoChanged)
	}

	readonly property VeQuickItem _serviceType: VeQuickItem {
		uid: root.bindPrefix ? root.bindPrefix + "/ServiceType" : ""
		onValueChanged: Qt.callLater(root.serviceInfoChanged)
	}

	readonly property VeQuickItem _source: VeQuickItem {
		uid: root.bindPrefix ? root.bindPrefix + "/Source" : ""
		onValueChanged: Qt.callLater(root.serviceInfoChanged)
	}

	readonly property VeQuickItem _minimumCurrent: VeQuickItem {
		uid: Global.systemSettings.serviceUid + "/Settings/Gui/Gauges/Ac/In/%1/Current/Min".arg(root.inputIndex)
	}

	readonly property VeQuickItem _maximumCurrent: VeQuickItem {
		uid: Global.systemSettings.serviceUid + "/Settings/Gui/Gauges/Ac/In/%1/Current/Max".arg(root.inputIndex)
	}
}
