/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS
import Victron.Mqtt      // <-- this hook makes “mqtt/…” UIDs work

Page {
	id: root
    property string sfkService: "com.victronenergy.sfksettings"
    property string mqttprefix: "mqtt/sfksettings/0"
    property string bindPrefix: "mqtt/sfksettings/0"

    property VeQuickItem  sfkV1InstallConfirm: VeQuickItem { 
		id: sfkV1InstallConfirm   
		uid: mqttprefix + "/System/SFKV1Installconfirm" }
    property VeQuickItem  sfkV2InstallConfirm: VeQuickItem { 
		id: sfkV2InstallConfirm  
		uid: mqttprefix + "/System/SFKV2Installconfirm" }
    property VeQuickItem  sfkV3InstallConfirm: VeQuickItem { 
		id: sfkV3InstallConfirm  
		uid: mqttprefix + "/System/SFKV3Installconfirm" }
    property VeQuickItem  sfkFirmwareInstallationCompleted: VeQuickItem { 
		id: sfkFirmwareInstallationCompleted  
		uid: mqttprefix + "/System/SFKFirmwareInstallationCompleted" }
    property VeQuickItem  sfkV1TextInstallConfirm: VeQuickItem {
		id: sfkV1TextInstallConfirm  
		uid: mqttprefix + "/System/SFKV1Textinstallconfirm" }
    property VeQuickItem  sfkV2TextInstallConfirm: VeQuickItem {
		id: sfkV2TextInstallConfirm  
		uid: mqttprefix + "/System/SFKV2Textinstallconfirm" }
    property VeQuickItem  sfkV3TextInstallConfirm: VeQuickItem { 
		id: sfkV3TextInstallConfirm 
		uid: mqttprefix + "/System/SFKV3Textinstallconfirm" }
    property VeQuickItem  sfkV1OSTextConfirm: VeQuickItem { 
		id: sfkV1OSTextConfirm  
		uid: mqttprefix + "/System/SFKV1OSTextconfirm"}
    property VeQuickItem  sfkV2OSTextConfirm: VeQuickItem { 
		id: sfkV2OSTextConfirm 
		uid: mqttprefix + "/System/SFKV2OSTextconfirm" }
    property VeQuickItem  sfkV3OSTextConfirm: VeQuickItem { 
		id: sfkV3OSTextConfirm 
		uid: mqttprefix + "/System/SFKV3OSTextconfirm" }
    property VeQuickItem  sfkCompatibleVerisonNr: VeQuickItem {
		id: sfkCompatibleVerisonNr 
		uid: mqttprefix + "/System/SFKCompatibleVerisonNr" }
    property VeQuickItem  sfkNumberofVersions: VeQuickItem { 
		id: sfksfkNumberofVersionsvbFlag  
	   uid: mqttprefix + "/System/SFKNumberofVersions" }
    property VeQuickItem  isSFKVersionsAvailable: VeQuickItem {
		id: isSFKVersionsAvailable  
	    uid: mqttprefix + "/System/IsSFKVersionsAvailable" }
    property VeQuickItem  firmwareVersion: VeQuickItem { 
		id: firmwareVersion  
	    uid: mqttprefix + "/FirmwareVersion" }

    // Firmware availability check
    property VeQuickItem  sfkFirmwareAvailableCheck: VeQuickItem { 
		id: sfkFirmwareAvailableCheck   
	    uid: mqttprefix + "/System/SFKFirmwareAvailableCheck" }
    property VeQuickItem sfkFirmwareAvailableCheckItem: VeQuickItem { 
		id: sfkFirmwareAvailableCheckItem  
	    uid: mqttprefix + "/System/SFKFirmwareAvailableCheck" }

    property string firmwareStatusMessage: isSFKVersionsAvailable.value === 1 ? qsTr("New firmware available.") : qsTr("")
    property string firmwareInstalledMessage: qsTr("Installation completed. Please reboot the device.")

    property VeQuickItem  sfkCurrentversion: VeQuickItem { 
		id: sfkCurrentversion 
	    uid: mqttprefix + "/System/SFKcurrentversion" }
    property VeQuickItem  sfkV1version: VeQuickItem { 
		id: sfkV1version   
	    uid: mqttprefix + "/System/SFKV1version" }
    property VeQuickItem  sfkV2version: VeQuickItem {
		id: sfkV2version 
	    uid: mqttprefix + "/System/SFKV2version" }
    property VeQuickItem  sfkV3version: VeQuickItem { 
		id: sfkV3version 
	    uid: mqttprefix + "/System/SFKV3version" }

    property real sfkCurrentVersion: sfkCurrentversion.value || 0.0
    property real sfkV1Version: sfkV1version.value || 0.0
    property real sfkV2Version: sfkV2version.value || 0.0
    property real sfkV3Version: sfkV3version.value || 0.0

    // Boolean properties indicating if a newer version is available
    property bool isSFKV1Newer: sfkV1Version >= sfkCurrentVersion
    property bool isSFKV2Newer: sfkV2Version >= sfkCurrentVersion
    property bool isSFKV3Newer: sfkV3Version >= sfkCurrentVersion

    property bool installationCompletedPulse: true

    Timer {
        id: _timer
        interval: 500
        running: sfkFirmwareInstallationCompleted.value === 1
        repeat: true
        onTriggered: installationCompletedPulse = !installationCompletedPulse
    }

	GradientListView {
		model: VisibleItemModel {

			ListRadioButtonGroup {
				//% "SFK Driver Update"
				text: "Check for SFK driver update"
			
				optionModel: [
					//% "Check for Updates"
					{ display: "Check", value: 1 },
					//% "Cancel"
					{ display: "Cancel", value: 0 }
				]
			
				currentIndex: sfkFirmwareAvailableCheck.value === 1 ? 0 : 1
			
				onOptionClicked: function(index) {
					// Trigger the appropriate action based on the selected option
					if (optionModel[index].value === 1) {
						sfkFirmwareAvailableCheck.setValue(1) // Start checking for updates
					} else {
						sfkFirmwareAvailableCheck.setValue(0) // Cancel the update check
					}
				}
			
				preferredVisible: true
				// preferredVisible: sfkFirmwareInstallationCompleted.value === 0 // Show only if versions are available
			}			
			
			ListText {
				text: "SFK Drivers Available"
				dataItem.uid: mqttprefix + "/System/SFKNumberofVersions"
				preferredVisible: (( isSFKVersionsAvailable.value === 1) || ( sfkNumberofVersions.value > 0 ) ) &&  (sfkFirmwareInstallationCompleted.value === 0)
			}

			ListText {
				text: installationCompletedPulse ? firmwareInstalledMessage : qsTr("")
				preferredVisible:sfkFirmwareInstallationCompleted.value === 1 
			}

			ListNavigation {
				text: sfkV1TextInstallConfirm.value
				preferredVisible: (sfkNumberofVersions.value > 0 && sfkNumberofVersions.value < 4 ) && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatteryDeviceinfoFirmwarecheckpagev1.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: sfkV2TextInstallConfirm.value
				preferredVisible: (sfkNumberofVersions.value > 1 && sfkNumberofVersions.value < 4 ) && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatteryDeviceinfoFirmwarecheckpagev2.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

			ListNavigation {
				text: sfkV3TextInstallConfirm.value
				preferredVisible: sfkNumberofVersions.value > 2  && sfkNumberofVersions.value < 4 && sfkFirmwareAvailableCheck.value === 1
				onClicked: {
					Global.pageManager.pushPage("/pages/settings/devicelist/battery/PageBatteryDeviceinfoFirmwarecheckpagev3.qml",
							{ "title": text, "bindPrefix": root.bindPrefix })
				}
			}

		}
	}
}
