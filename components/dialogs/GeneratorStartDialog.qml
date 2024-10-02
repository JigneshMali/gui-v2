/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

GeneratorDialog {
	id: root

	//% "Start Now"
	acceptText: qsTrId("controlcard_generator_startdialog_start_now")
	secondaryTitle: CommonWords.manual_start

	onGeneratorStateChanged: {
		if (root.open) {
			if (generatorState == VenusOS.Generators_State_Running
					|| generatorState == VenusOS.Generators_State_WarmUp) {
				root.accept()
			}
		}
	}

	runGeneratorAction: function() {
		root.generator.start(timedRunSwitch.checked ? Utils.composeDuration(timeSelector.hour, timeSelector.minute) : 0)
	}

	contentItem: Column {
		anchors {
			top: root.header.bottom
			topMargin: Theme.geometry_modalDialog_content_margins
			left: parent.left
			right: parent.right
			bottom: parent.footer.top
		}
		spacing: Theme.geometry_modalDialog_content_margins

		Switch {
			id: timedRunSwitch

			anchors {
				left: timeSelector.left
				right: timeSelector.right
			}
			//% "Timed run"
			text: qsTrId("controlcard_generator_startdialog_timed_run")
			checked: root.generator.manualStartTimer > 0
			checkable: true
		}

		TimeSelector {
			id: timeSelector

			anchors.horizontalCenter: parent.horizontalCenter
			enabled: timedRunSwitch.checked
			maximumHour: 59
		}

		Label {
			anchors {
				left: timeSelector.left
				right: timeSelector.right
			}
			wrapMode: Text.Wrap
			color: Theme.color_font_primary
			horizontalAlignment: Text.AlignHCenter
			text: timedRunSwitch.checked && (timeSelector.hour || timeSelector.minute)
				  ? //% "Generator will stop in %1 unless autostart conditions are enabled that keep it running."
					qsTrId("generator_start_dialog_will_stop_in_x").arg(Utils.formatHoursMinutes(timeSelector.hour, timeSelector.minute))
				  : //% "Generator will run until manually stopped, unless autostart conditions are enabled that keep it running."
					qsTrId("generator_start_dialog_will_run_until_manually_stopped")
		}
	}

	onAboutToShow: {
		const timeParts = Utils.decomposeDuration(root.generator.manualStartTimer)
		timeSelector.hour = timeParts.h
		timeSelector.minute = timeParts.m
	}
}
