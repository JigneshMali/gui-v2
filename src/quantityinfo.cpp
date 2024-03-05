/*
** Copyright (C) 2023 Victron Energy B.V.
** See LICENSE.txt for license information.
*/

#include "quantityinfo.h"
#include "units.h"

namespace Victron {
namespace Units {

QuantityInfo::QuantityInfo(QObject *parent)
	: QObject(parent)
{
	connect(this, &QuantityInfo::inputChanged, this, &QuantityInfo::update);
	connect(this, &QuantityInfo::valueChanged, this, &QuantityInfo::update);
	connect(this, &QuantityInfo::precisionChanged, this, &QuantityInfo::update);
	connect(this, &QuantityInfo::unitMatchValueChanged, this, &QuantityInfo::update);
	connect(this, &QuantityInfo::formatHintsChanged, this, &QuantityInfo::update);
}

QuantityInfo::~QuantityInfo()
{
}

void QuantityInfo::update() {
	// Pass the previous value to allow hysteresis
	quantity = qobject_cast<Units>(Units::instance(nullptr, nullptr)).getDisplayTextWithHysteresis(unitType, value, quantity.scale, precision, unitMatchValue, formatHints);
	emit updated();
}

}
}
