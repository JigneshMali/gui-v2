/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

#ifndef VICTRON_VENUSOS_GUI_V2_UNITS_H
#define VICTRON_VENUSOS_GUI_V2_UNITS_H

#include <QtGlobal>
#include <QQmlEngine>
#include <QObject>


#include <veutil/qt/unit_conversion.hpp>

#include "enums.h"

namespace Victron {
namespace Units {

class quantityInfo
{
	Q_GADGET
	QML_ELEMENT
	Q_PROPERTY(QString number MEMBER number)
	Q_PROPERTY(QString unit MEMBER unit)
	Q_PROPERTY(VenusOS::Enums::Units_Scale scale MEMBER scale)

public:
	QString number;
	QString unit;
	VenusOS::Enums::Units_Scale scale = VenusOS::Enums::Units_Scale_None;
};

class Units : public QObject
{
	Q_OBJECT
	QML_ELEMENT
	QML_SINGLETON

public:
	explicit Units(QObject *parent = nullptr);
	~Units() override;

	static QObject* instance(QQmlEngine *engine, QJSEngine *);

	Q_INVOKABLE int defaultUnitPrecision(VenusOS::Enums::Units_Type unit) const;
	Q_INVOKABLE QString defaultUnitString(VenusOS::Enums::Units_Type unit) const;

	Q_INVOKABLE QString scaleToString(VenusOS::Enums::Units_Scale scale) const;
	Q_INVOKABLE bool isScalingSupported(VenusOS::Enums::Units_Type unit) const;

	Q_INVOKABLE quantityInfo getDisplayText(
		VenusOS::Enums::Units_Type unit,
		qreal value,
		int precision = -1,
		qreal unitMatchValue = qQNaN()) const;

	quantityInfo getDisplayTextWithHysteresis(
		VenusOS::Enums::Units_Type unit,
		qreal value,
		VenusOS::Enums::Units_Scale previousScale,
		int precision = -1,
		qreal unitMatchValue = qQNaN()) const;

	Q_INVOKABLE QString getCombinedDisplayText(
		VenusOS::Enums::Units_Type unit,
		qreal value,
		int precision = -1) const;

	Q_INVOKABLE QString getCapacityDisplayText(VenusOS::Enums::Units_Type unit,
		qreal capacity_m3,
		qreal remaining_m3) const;

	Q_INVOKABLE qreal convert(qreal value, VenusOS::Enums::Units_Type fromUnit, VenusOS::Enums::Units_Type toUnit) const;

	Q_INVOKABLE int unitToVeUnit(VenusOS::Enums::Units_Type unit) const;

	Q_INVOKABLE qreal sumRealNumbers(qreal a, qreal b) const;
};

}
}

Q_DECLARE_METATYPE(Victron::Units::quantityInfo)

#endif // VICTRON_VENUSOS_GUI_V2_UNITS_H
