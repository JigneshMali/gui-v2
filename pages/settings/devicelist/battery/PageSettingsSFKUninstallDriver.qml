import QtQuick
import Victron.VenusOS
import Victron.Mqtt      // <-- this hook makes “mqtt/…” UIDs work

Page {
    id: root
    property string sfkService: "com.victronenergy.sfksettings"
    property string bindPrefix: "mqtt/com.victronenergy.sfksettings"
    property VeQuickItem firmwareUninstallationCompleted: VeQuickItem {
        uid: root.bindPrefix + "/System/SFKFirmwareUninstallationCompleted"
    }

    GradientListView {
        model: VisibleItemModel {

            ListText {
                text: {
                    switch (BackendConnection.type) {
                        case BackendConnection.DBusSource: return qsTr("Current backend: D-Bus")
                        case BackendConnection.MqttSource: return qsTr("Current backend: MQTT")
                        case BackendConnection.MockSource: return qsTr("Current backend: Mock")
                        default: return qsTr("Backend type: Unknown (%1)").arg(BackendConnection.type)
                    }
                }
                preferredVisible: true
            }

            ListText {
                text: "UID is: " + bindPrefix + "/System/SFKFirmwareUninstallationCompleted"
                preferredVisible: true
            }

            ListText {
                text: "Driver removed. Please reboot the device."
                preferredVisible: firmwareUninstallationCompleted.value === 1
            }

            ListRadioButtonGroup {
                text: "Uninstall driver"
                dataItem.uid: root.bindPrefix + "/System/SFKFirmwareUninstallConfirm"
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
