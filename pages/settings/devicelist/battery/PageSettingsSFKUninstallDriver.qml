import QtQuick
import Victron.VenusOS

Page {
    id: root

    // service name stays the same
    property string sfkService: "com.victronenergy.sfksettings"
    property string mqttprefix: "mqtt/sfksettings/0"
    property string bindPrefix: "mqtt/sfksettings/0"

    // the data item
    property VeQuickItem firmwareUninstallationCompleted: VeQuickItem {
        uid: "mqtt/sfksettings/0/System/SFKFirmwareUninstallationCompleted"
    }
        // the data item
    property VeQuickItem sfkFirmwareUninstallconfirm: VeQuickItem {
        uid: "mqtt/sfksettings/0/System/SFKFirmwareUninstallconfirm"
    }

    GradientListView {
        model: VisibleItemModel {
            ListText {
                text: "Driver removed. Please reboot the device."
                preferredVisible: firmwareUninstallationCompleted.value === 1
            }

            ListButton {
                text: qsTr("Uninstall driver")
                secondaryText: qsTr("Uninstall driver")
                preferredVisible: true
                onClicked: sfkFirmwareUninstallconfirm.setValue(1)
            }

            ListRebootButton { }
        }
    }
}
