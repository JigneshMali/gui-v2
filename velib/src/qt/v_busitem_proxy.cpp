/*
 * This file was generated by qdbusxml2cpp version 0.7
 * Command line was: qdbusxml2cpp -v -c VBusItemProxy -p v_busitem_proxy.h:v_busitem_proxy.cpp com.victron.busitem.xml
 *
 * qdbusxml2cpp is Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
 *
 * This is an auto-generated file.
 * This file may have been hand-edited. Look for HAND-EDIT comments
 * before re-generating it.
 */

#include "v_busitem_proxy.h"

/*
 * Implementation of interface class VBusItemProxy
 */

VBusItemProxy::VBusItemProxy(const QString &service, const QString &path, const QDBusConnection &connection, QObject *parent)
    : QDBusAbstractInterface(service, path, staticInterfaceName(), connection, parent)
{
}

VBusItemProxy::~VBusItemProxy()
{
}

