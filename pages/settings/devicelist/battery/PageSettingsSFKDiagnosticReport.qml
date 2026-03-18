/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

import QtQuick
import Victron.VenusOS

Page {
	id: root
	property VeQuickItem sfkSubmitDriverHelpFile: VeQuickItem {
		id: sfkSubmitDriverHelpFile
		uid: "mqtt/sfksettings/0/System/SFKSubmitDriverHelpFile"
	}
	property VeQuickItem sfkSubmitDriverHelpFileProgress: VeQuickItem {
		id: sfkSubmitDriverHelpFileProgress
		uid: "mqtt/sfksettings/0/System/SFKSubmitDriverHelpFileProgress"
	}


	GradientListView {
		model: VisibleItemModel {

			ListButton 
			{
				text: qsTr("Submit Diagnostic Report")
				secondaryText:sfkSubmitDriverHelpFileProgress.value === 100
						? qsTr("Submitted")
					: sfkSubmitDriverHelpFile.value === 1
						? qsTr("Submitting %1%").arg(sfkSubmitDriverHelpFileProgress.value)
					: qsTr("Submit")

				preferredVisible: true
				onClicked:{
					if (sfkSubmitDriverHelpFile.value === 1)
					{
						sfkSubmitDriverHelpFile.setValue(0)
					}
					if (sfkSubmitDriverHelpFile.value === 0)
					{
						sfkSubmitDriverHelpFile.setValue(1)
						Global.showToastNotification(
							VenusOS.Notification_Info,
							qsTr("Submitting Diagnostic Report..."),
							5000
						)
					}
				}
			}

		}
	}

}
