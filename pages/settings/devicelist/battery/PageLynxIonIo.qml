/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	property string bindPrefix

	GradientListView {
		model: VisibleItemModel {
			ListText {
				//% "System Switch"
				text: qsTrId("lynxionio_system_switch")
				dataItem.uid: root.bindPrefix + "/SystemSwitch"
				secondaryText: CommonWords.enabledOrDisabled(dataItem.value)
			}

			ListText {
				text: CommonWords.allow_to_charge
				dataItem.uid: root.bindPrefix + "/Io/AllowToCharge"
				secondaryText: CommonWords.yesOrNo(dataItem.value)
			}

			ListText {
				text: CommonWords.allow_to_discharge
				dataItem.uid: root.bindPrefix + "/Io/AllowToDischarge"
				secondaryText: CommonWords.yesOrNo(dataItem.value)
			}

			ListSwitch {
				text: "Force charging off"
				dataItem.uid: root.bindPrefix + "/Io/ForceChargingOff"
				preferredVisible: dataItem.valid
			}

			ListSwitch {
				text: "Force discharging off"
				dataItem.uid: root.bindPrefix + "/Io/ForceDischargingOff"
				preferredVisible: dataItem.valid
			}

			ListText {
				//% "External relay"
				text: qsTrId("lynxionio_external_relay")
				dataItem.uid: root.bindPrefix + "/Io/ExternalRelay"
				preferredVisible: dataItem.valid
				secondaryText: CommonWords.activeOrInactive(dataItem.value)
			}

			ListText {
				//% "Programmable Contact"
				text: qsTrId("lynxionio_programmable_contact")
				dataItem.uid: root.bindPrefix + "/Io/ProgrammableContact"
				preferredVisible: dataItem.valid
				secondaryText: CommonWords.activeOrInactive(dataItem.value)
			}
		}
	}
}
