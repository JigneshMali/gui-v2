/*
** Copyright (C) 2024 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

DeviceListDelegate {
	id: root
	property VeQuickItem heatFetStatus: VeQuickItem {
		id: heatFetStatus
		uid: root.device.serviceUid  +  "/System/HeatFetStatus"
		}	
	property bool pulse: true
	    Timer {
        id: _timer
        interval: 500
        running: heatFetStatus.value === 1
        repeat: true
        onTriggered: pulse = !pulse
    }
	readonly property bool isParallelBms: numberOfBmses.valid

	quantityModel: !root.isParallelBms && state.valid && state.value === VenusOS.Battery_State_Pending
		   ? pendingModel
		   : defaultModel

	onClicked: {
		Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBattery.qml",
				{ bindPrefix: root.device.serviceUid })
	}

	QuantityObjectModel {
		id: pendingModel

		filterType: QuantityObjectModel.HasValue

		QuantityObject { object: CommonWords; key: "pending" }
		QuantityObject { object: voltage; unit: VenusOS.Units_Volt_DC }
		QuantityObject { object: soc; unit: VenusOS.Units_Percentage }
	}

	QuantityObjectModel {
		id: defaultModel

		filterType: QuantityObjectModel.HasValue
		QuantityObject { object: customDataObject; key:"heatRedTextP"  }
		QuantityObject { object: soc; unit: VenusOS.Units_Percentage }
		QuantityObject { object: voltage; unit: VenusOS.Units_Volt_DC }
		QuantityObject { object: current; unit: VenusOS.Units_Amp }
	}

	QtObject {
		id: customDataObject
		property string heatRedTextP: (heatFetStatus.value === 1 && pulse) ? "<span style='color:#ff0000; font-weight:bold;'>H</span>" : " "
	}

	VeQuickItem {
		id: numberOfBmses
		uid: root.device.serviceUid + "/NumberOfBmses"
	}

	VeQuickItem {
		id: state
		uid: root.device.serviceUid + "/State"
	}

	VeQuickItem {
		id: voltage
		uid: root.device.serviceUid + "/Dc/0/Voltage"
	}

	VeQuickItem {
		id: soc
		uid: root.device.serviceUid + "/Soc"
	}

	VeQuickItem {
		id: current
		uid: root.device.serviceUid + "/Dc/0/Current"
	}
}
