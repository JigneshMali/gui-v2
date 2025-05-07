
import QtQuick
import Victron.VenusOS

Page {
	id: root

    property string bindPrefix: BackendConnection.type === BackendConnection.DBusSource
        ? "dbus/com.victronenergy.sfksettings"
        : "mqtt/sfksettings/0"

    property VeQuickItem firmwareUninstallationCompleted: VeQuickItem { uid: root.bindPrefix + "/System/SFKFirmwareUninstallationCompleted" }

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
                text: "Driver removed. Please reboot the device."
                preferredVisible: firmwareUninstallationCompleted.value === 1
            }

            ListRadioButtonGroup {
                text: "Uninstall driver"
                dataItem.uid: root.bindPrefix + "/System/SFKFirmwareUninstallconfirm"
                preferredVisible: true
                optionModel: [
                    { display: qsTr("Uninstall"), value: 1 },
                    { display: qsTr("Cancel"), value: 0 }
                ]
            }

            ListRebootButton { }
        }
    }
}
