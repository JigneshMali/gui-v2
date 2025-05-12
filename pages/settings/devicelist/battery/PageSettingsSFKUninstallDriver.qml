import QtQuick
import Victron.VenusOS

Page {
    id: root

    // service name stays the same
    property string sfkService: "com.victronenergy.sfksettings"
    // this will be "mqtt/com.victronenergy.sfksettings" in MQTT,
    // or         "dbus"                             in D-Bus
    property string bindPrefix: BackendConnection.uidPrefix() + sfkService

    // the data item
    property VeQuickItem firmwareUninstallationCompleted: VeQuickItem {
        uid: bindPrefix + "/System/SFKFirmwareUninstallationCompleted"
    }

    GradientListView {
        model: VisibleItemModel {
            ListText {
                text: {
                    switch (BackendConnection.type) {
                        case BackendConnection.DBusSource:   return qsTr("Current backend: D-Bus")
                        case BackendConnection.MqttSource:  return qsTr("Current backend: MQTT")
                        case BackendConnection.MockSource:  return qsTr("Current backend: Mock")
                        default:                           return qsTr("Backend type: Unknown (%1)").arg(BackendConnection.type)
                    }
                }
                preferredVisible: true
            }

            ListText {
                text: "UID is: " + BackendConnection.uidPrefix() 
                preferredVisible: true
            }

            ListText {
                text: "Driver removed. Please reboot the device."
                preferredVisible: firmwareUninstallationCompleted.value === 1
            }

            ListRadioButtonGroup {
                text: qsTr("Uninstall driver")
                dataItem.uid: bindPrefix + "/System/SFKFirmwareUninstallconfirm"
                preferredVisible: true
                optionModel: [
                    { display: qsTr("Uninstall"), value: 1 },
                    { display: qsTr("Cancel"),    value: 0 }
                ]
            }

            ListRebootButton { }
        }
    }
}
