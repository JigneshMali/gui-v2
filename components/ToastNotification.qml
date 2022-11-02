/*
** Copyright (C) 2021 Victron Energy B.V.
*/

import QtQuick
import QtQuick.Controls.impl as CP
import Victron.VenusOS

Item {
	id: root

	property int category: VenusOS.ToastNotification_Category_None
	property alias backgroundColor: background.color
	property alias highlightColor: highlight.color
	property alias icon: icon
	property alias text: label.text
	property alias autoCloseInterval: timer.interval

	signal dismissed()

	implicitWidth: parent ? parent.width : 0
	implicitHeight: Math.max(Theme.geometry.toastNotification.minHeight,
			label.implicitHeight + 2*Theme.geometry.toastNotification.label.padding)

	Behavior on opacity { OpacityAnimator { duration: Theme.animation.toastNotification.fade.duration } }
	opacity: dismiss.dismissClicked ? 0.0
		: dismiss.dismissAvailable  ? 1.0
		: 0.0
	onOpacityChanged: if (dismiss.dismissClicked && opacity === 0.0) root.dismissed()
	Component.onCompleted: dismiss.dismissAvailable = true // ensures fade-in as well as fade-out transition.

	Rectangle {
		id: background
		anchors.fill: parent

		radius: Theme.geometry.toastNotification.radius
		color: root.category === VenusOS.ToastNotification_Category_None ? Theme.color.toastNotification.background.none
			 : root.category === VenusOS.ToastNotification_Category_Informative ? Theme.color.toastNotification.background.informative
			 : root.category === VenusOS.ToastNotification_Category_Confirmation ? Theme.color.toastNotification.background.confirmation
			 : root.category === VenusOS.ToastNotification_Category_Warning ? Theme.color.toastNotification.background.warning
			 : Theme.color.toastNotification.background.error

		AsymmetricRoundedRectangle {
			id: highlight
			anchors {
				left: parent.left
				top: parent.top
				bottom: parent.bottom
			}

			visible: root.category !== ToastNotification.None
			width: Theme.geometry.toastNotification.minHeight
			radius: parent.radius
			flat: true

			color: root.category === VenusOS.ToastNotification_Category_None ? Theme.color.toastNotification.background.none
				 : root.category === VenusOS.ToastNotification_Category_Informative ? Theme.color.toastNotification.highlight.informative
				 : root.category === VenusOS.ToastNotification_Category_Confirmation ? Theme.color.toastNotification.highlight.confirmation
				 : root.category === VenusOS.ToastNotification_Category_Warning ? Theme.color.toastNotification.highlight.warning
				 : Theme.color.toastNotification.highlight.error

			CP.IconImage {
				id: icon
				anchors.centerIn: parent

				width: Theme.geometry.toastNotification.icon.width
				color: Theme.color.toastNotification.foreground
				source: root.category === VenusOS.ToastNotification_Category_None ? ""
					  : root.category === VenusOS.ToastNotification_Category_Informative ? "qrc:/images/toast_icon_info.svg"
					  : root.category === VenusOS.ToastNotification_Category_Confirmation ? "qrc:/images/toast_icon_checkmark.svg"
					  : "qrc:/images/toast_icon_alarm.svg"
			}
		}

		Label {
			id: label
			anchors {
				left: highlight.right
				right: dismiss.left
				top: parent.top
				bottom: parent.bottom
				margins: Theme.geometry.toastNotification.label.padding
			}

			horizontalAlignment: Text.AlignHCenter
			verticalAlignment: Text.AlignVCenter
			wrapMode: Text.Wrap
			color: Theme.color.toastNotification.foreground
		}

		MouseArea {
			id: dismiss
			anchors {
				right: parent.right
				top: parent.top
				bottom: parent.bottom
			}

			property bool dismissClicked: false
			property bool dismissAvailable: false
			width: Theme.geometry.toastNotification.minHeight
			onClicked: dismissClicked = true

			CP.IconImage {
				id: dismissIcon
				anchors.centerIn: parent

				width: Theme.geometry.toastNotification.icon.width
				color: Theme.color.toastNotification.foreground
				source: "qrc:/images/toast_icon_close.svg"
			}
		}
	}

	Timer {
		id: timer

		onTriggered: root.dismissed()
		onIntervalChanged: {
			if (interval !== 0) {
				start()
			}
		}
	}
}
