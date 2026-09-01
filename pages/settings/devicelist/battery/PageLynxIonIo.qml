/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root
	property int globalDialogResult: 0   // <--- Global result variable	

	property string bindPrefix
    property VeQuickItem isH2DeviceBool: VeQuickItem {
        uid: root.bindPrefix + "/H2DeviceBool"
    }
	property VeQuickItem itemH2RTCtimeReSync: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/H2RTCtimeReSync"
    }
	property VeQuickItem itemH2RTCtimeRead: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/H2RTCtimeRead"
    }
	property VeQuickItem itemH2RTCtimeReadCall: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/H2RTCtimeReadCall"
    }
	property VeQuickItem itemH2BMSRestart: VeQuickItem {
        uid: root.bindPrefix + "/H2Device/H2BMSRestart"
    }

	GradientListView {
		model: VisibleItemModel {
			ListText {
				//% "System Switch"
				text: qsTrId("lynxionio_system_switch")
				dataItem.uid: root.bindPrefix + "/SystemSwitch"
				preferredVisible: dataItem.valid
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

			// ListSwitch {
			// 	text: "Regulate SOC"
			// 	dataItem.uid: root.bindPrefix + "/H2Device/H2RegulateMaxSOC_StatusRead"
			// 	preferredVisible: dataItem.valid
			// 	checked: dataItem.valid 
			// }

			ListSwitch {
				id : regulateMaxSOC
				text: "Regulate SOC"
				dataItem.uid: root.bindPrefix + "/H2Device/H2RegulateMaxSOC_StatusRead"
				preferredVisible: dataItem.valid
				updateDataOnClick: true
				onClicked: {
					if(checked){
						regulateMaxSOC.setValue(0)
					}
				}
			}

			ListRadioButtonGroup {
				text: "Wireless Mode"
				dataItem.uid: root.bindPrefix + "/H2DeviceWirelessMode"
				preferredVisible: dataItem.valid  // Control visibility based on your condition
				optionModel: [
					{ display: qsTr("Ble"), value: 1 },
					{ display: qsTr("Zigbee"), value: 3 },
					{ display: qsTr("Thread"), value: 2 },
					{ display: qsTr("Off"), value: 0 }
				]
            }
			
			ListSwitch {
				text: "Ble Auto Restart"
				dataItem.uid: root.bindPrefix + "/H2Device/H2BleAutoRestart"
				preferredVisible: dataItem.valid
			}

			ListButton {
				text: qsTr("BMS Time : [%1]").arg(itemH2RTCtimeRead.value)
				secondaryText:itemH2RTCtimeReadCall.value === 1
				? qsTr("Checking")
				: qsTr("Check BMS Time")
				preferredVisible: isH2DeviceBool.value === 1
				onClicked: {
					Global.showToastNotification(VenusOS.Notification_Info,qsTr("Reading BMS time..."), 2000)
					itemH2RTCtimeReadCall.setValue(1) // Trigger the time read callback to update the time

				}
			}

			ListButton {
				text: qsTr("Re-Sync BMS Time")
				secondaryText:itemH2RTCtimeReSync.value === 1
				? qsTr("Re-Syncing...")
				: qsTr("Re-Sync")
				preferredVisible: isH2DeviceBool.value === 1
				onClicked: {
					Global.showToastNotification(VenusOS.Notification_Info,qsTr("Re-Syncing BMS time..."), 2000)
					itemH2RTCtimeReSync.setValue(1)
				}
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
			
			ListSwitch {
				text: "Discharging below freezing"
				dataItem.uid: root.bindPrefix + "/Io/DchgBelowFreezingToggle"
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
			
			ListButton {
				text: qsTr("Restart BMS")
				secondaryText:itemH2BMSRestart.value === 1
				? qsTr("Restarting...")
				: qsTr("Restart")
				preferredVisible: isH2DeviceBool.value === 1
				// onClicked: {
				// 	Global.showToastNotification(VenusOS.Notification_Info,qsTr("Restarting BMS..."), 2000)
				// 	itemH2BMSRestart.setValue(1)
				// }
				onClicked: Global.dialogLayer.open(proceedtorestartDialog)
			}
		}
	}
	Component {
		id: proceedtorestartDialog
		ModalWarningDialog {
			title: qsTr("Proceed to Restart?")
			description: qsTr("Restarting the BMS will disconnect the battery and it will not be available until it successfully reconnects.")
			// dialogDoneOptions: "OkAndCancel"  // error of int expected 
			dialogDoneOptions: VenusOS.ModalDialog_DoneOptions_OkAndCancel
			onClosed: function() {
				globalDialogResult  = result 
				if (globalDialogResult  === 1) {
					itemH2BMSRestart.setValue(1)
					}
				globalDialogResult  = 0   // Reset after processing
			}
		}
	}
}
