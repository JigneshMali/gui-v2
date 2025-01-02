/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root

	GradientListView {
		model: ObjectModel {

			component SwitchItem : ListItem {
				id: switchItem

				signal clicked
				property alias checked: childSwitch.checked

				content.children: Switch {
					id: childSwitch
					onClicked: switchItem.clicked()
				}

				ListPressArea {
					anchors.fill: switchItem.backgroundRect
					radius: switchItem.backgroundRect.radius
					onClicked: switchItem.clicked()
				}
			}

			ListText {
				//% "Application version"
				text: qsTrId("settings_page_debug_application_version")
				secondaryText: Theme.applicationVersion
			}

			ListButton {
				id: quitSwitch

				//% "Quit application"
				text: qsTrId("settings_page_debug_quit_application")

				//% "Quit"
				button.text: qsTrId("settings_page_debug_quit")

				onClicked: Qt.quit()
			}

			ListNavigation {
				text: "Power"
				onClicked: Global.pageManager.pushPage("/pages/settings/debug/PagePowerDebug.qml", { title: text })
			}

			ListNavigation {
				text: "System data"
				onClicked: Global.pageManager.pushPage("/pages/settings/debug/PageSystemData.qml", { title: text })
			}

			ListNavigation {
				text: "Values"
				onClicked: Global.pageManager.pushPage("/pages/settings/debug/PageDebugVeQItems.qml", { title: text })
			}

			SwitchItem {
				//% "Enable frame-rate visualizer"
				text: qsTrId("settings_page_debug_enable_fps_visualizer")
				checked: FrameRateModel.enabled
				onClicked: FrameRateModel.enabled = !FrameRateModel.enabled
			}

			SwitchItem {
				//% "Display CPU usage"
				text: qsTrId("settings_page_debug_display_cpu_usage")
				checked: Global.displayCpuUsage
				onClicked: Global.displayCpuUsage = !Global.displayCpuUsage
				allowed: defaultAllowed && Qt.platform.os === "linux"
			}

			SwitchItem {
				//% "Pause electron animations"
				text: qsTrId("settings_page_debug_pause_electron_animations")
				checked: Global.pauseElectronAnimations
				onClicked: Global.pauseElectronAnimations = !Global.pauseElectronAnimations
			}

			ListNavigation {
				text: "Test"
				onClicked: Global.pageManager.pushPage("/pages/settings/debug/PageSettingsDemo.qml", { title: text })
			}

			// TODO implement when venus-platform provides equivalent of vePlatform.getMemInfo()
			/*ListNavigation {
				text: "glibc memory"
				onClicked: Global.pageManager.pushPage("/pages/settings/debug/PageDebugMemoryLibc.qml", { title: text })
			}*/

			// TODO implement when venus-platform provides equivalent of QuickView.imageCacheSize()
			/*ListNavigation {
				text: "Qt memory"
				onClicked: Global.pageManager.pushPage("/pages/settings/debug/PageDebugMemoryQt.qml", { title: text })
			}*/

			ListRadioButtonGroup {
				//% "Demo mode"
				text: qsTrId("settings_demo_mode")
				height: implicitHeight + demoModeCaption.height
				primaryLabel.anchors.verticalCenterOffset: -(demoModeCaption.height / 2)
				dataItem.uid: Global.systemSettings.serviceUid + "/Settings/Gui/DemoMode"
				popDestination: undefined // don't pop page automatically.
				updateDataOnClick: false // handle option clicked manually.
				optionModel: [
					{ display: CommonWords.disabled, value: 0 },
					//% "ESS demo"
					{ display: qsTrId("page_settings_demo_ess"), value: 1 },
					//% "Boat/Motorhome demo 1"
					{ display: qsTrId("page_settings_demo_1"), value: 2 },
					//% "Boat/Motorhome demo 2"
					{ display: qsTrId("page_settings_demo_2"), value: 3 },
				]

				PrimaryListLabel {
					id: demoModeCaption

					anchors {
						bottom: parent.bottom
						bottomMargin: Theme.geometry_listItem_content_verticalMargin
					}
					//% "Starting demo mode will change some settings and the user interface will be unresponsive for a moment."
					text: qsTrId("settings_demo_mode_caption")
				}
				onOptionClicked: function(index) {
					Qt.callLater(Global.main.rebuildUi)
					dataItem.setValue(index)
				}
			}
		}
	}
}
