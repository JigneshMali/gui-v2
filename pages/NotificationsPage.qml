/*
** Copyright (C) 2025 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS
import QtQuick.Controls.impl as CP

SwipeViewPage {
	id: root

	//% "Notifications"
	navButtonText: qsTrId("nav_notifications")
	navButtonIcon: Global.notifications?.navBarNotificationCounterVisible ? "qrc:/images/notifications_subtract.svg" : "qrc:/images/notifications.svg"
	url: "qrc:/qt/qml/Victron/VenusOS/pages/NotificationsPage.qml"
	topLeftButton: VenusOS.StatusBar_LeftButton_ControlsInactive

	GradientListView {
		id: notificationsView

		// prevent the nav bar buttons from clicking the notifications when it is shown
		// over the top of the notificationsView
		clip: true

		// Header contains the top list of active and/or unAcknowledged notifications.
		header: Item {
			id: headerItem

			function _scrollToTop() {
				// Scroll to the top of both lists.
				activeNotificationsView.positionViewAtBeginning()
				notificationsView.positionViewAtBeginning()
			}

			width: parent.width
			height: history.y + history.height

			ListView {
				id: activeNotificationsView

				property bool animateHeightChanges
				property int prevCount: -1

				onCountChanged: {
					if (count < prevCount && count !== 0) { // don't fade/resize for the last remaining notification
						// When the item 'remove' transition is triggered, also animate the
						// shrinking of the list, otherwise the header size jumps abrumptly.
						animateHeightChanges = true
					} else if (count > prevCount) {
						// When a new notification is added, scroll to the top of the list header
						// so that the user can see it.
						Qt.callLater(headerItem._scrollToTop)
					}
					prevCount = count
				}

				// Only item removals are animated. Animating additions is less straightforward as
				// the ListView normally resizes upwards when the header grows in height, and the
				// list will be scrolled to the top as soon as a new notification appears anyway.
				remove: Transition {
					enabled: root.isCurrentPage
					NumberAnimation { property: "opacity"; to: 0; duration: Theme.animation_notificationsPage_delegate_opacity_duration }
				}
				removeDisplaced: Transition {
					enabled: root.isCurrentPage
					SequentialAnimation {
						PauseAnimation { duration: Theme.animation_notificationsPage_delegate_opacity_duration }
						NumberAnimation { property: "y"; duration: Theme.animation_notificationsPage_delegate_displaced_duration; easing.type: Easing.InOutQuad }
					}
				}

				// Do not shrink smaller than the height of the "No current alerts" placeholder
				// item. This allows placeholder to be shown over the last removed delegate in a
				// smoother fashion, instead of abruptly hiding the view and showing the placeholder.
				height: Math.max(Theme.geometry_notificationsPage_placeholder_height, contentHeight)

				// When a remove occurs, animate the shrinking of the list so that the header does
				// not abruptly jump in size and cause the historical items to jump upwards.
				Behavior on height {
					// The animation needs to be enabled when the view count changes. This cannot
					// just bind to transition.running as the results are inconsistent.
					enabled: activeNotificationsView.animateHeightChanges && root.isCurrentPage

					SequentialAnimation {
						PauseAnimation { duration: Theme.animation_notificationsPage_delegate_opacity_duration }
						NumberAnimation { property: "height"; duration: Theme.animation_notificationsPage_delegate_displaced_duration; easing.type: Easing.InOutQuad }
						ScriptAction { script: activeNotificationsView.animateHeightChanges = false }
					}
				}

				width: parent.width
				interactive: false  // this list cannot be scrolled separately to the main list
				spacing: Theme.geometry_gradientList_spacing
				model: Global.notifications.activeOrUnAcknowledgedModel
				delegate: NotificationDelegate {
					id: activeDelegate

					// When the delegate is clicked, acknowledge it.
					PressArea {
						anchors.fill: parent
						enabled: !activeDelegate.acknowledged
						radius: activeDelegate.radius
						// we have access to the BaseNotification via the notification role
						// but it needs to be "as" Notification for us to be able to call updateAcknowledged()
						onReleased: (activeDelegate.notification as Notification)?.updateAcknowledged(true)
					}
				}
			}

			Row {
				id: noCurrentAlerts

				visible: activeNotificationsView.count === 0
				width: parent.width
				height: Theme.geometry_notificationsPage_placeholder_height

				onVisibleChanged: {
					if (visible) {
						Qt.callLater(headerItem._scrollToTop)
					}
				}

				Item {
					id: iconContainer

					anchors.verticalCenter: parent.verticalCenter
					width: checkmarkIcon.width + (2 * Theme.geometry_listItem_content_horizontalMargin)
					height: parent.height

					Image {
						id: checkmarkIcon
						anchors.centerIn: parent
						source: "qrc:/images/icon_checkmark_48"
					}
				}

				Label {
					anchors.verticalCenter: parent.verticalCenter
					width: parent.width - iconContainer.width
					color: Theme.color_font_secondary
					font.pixelSize: Theme.font_size_body3

					//% "No current alerts"
					text: qsTrId("notifications_no_current_alerts")
				}
			}

			SectionHeader {
				id: history

				text: CommonWords.history
				anchors.top: activeNotificationsView.count ? activeNotificationsView.bottom : noCurrentAlerts.bottom
				preferredVisible: notificationsView.count !== 0
			}
		}

		// Main list contains the historical notifications (inactive and acknowledged).
		model: Global.notifications.inactiveAndAcknowledgedModel
		spacing: Theme.geometry_gradientList_spacing
		delegate: NotificationDelegate {}
	}
}
