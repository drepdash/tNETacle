/*
 * Copyright (c) 2012 Florent Tribouilloy <tribou_f AT epitech DOT net>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#include "include/modelconnexion.h"
#include <QDebug>

const QString ModelConnexion::_name = "Connexion";

ModelConnexion::ModelConnexion(Controller* controller) :
    _controller(controller)
{
    _infos = new QMap<QString, QVariant>();

    _infos->insert("Name", "Default");
    _infos->insert("Adress", "127.0.0.1");
    _infos->insert("Port", "4243");
    _infos->insert("Key", "key");

}

const QString &
ModelConnexion::getObjectName() const
{
    return _name;
}

void
ModelConnexion::feedData(const QString& command, const QVariant&)
{
    qDebug() << command;
}

const QMap<QString, QVariant>*
ModelConnexion::getData() const
{
    return _infos;
}

void
ModelConnexion::changeConnexionInfo(const QString& name, const QString& pubkey, const QString& ip, const QString& port)
{
  _infos->operator[]("Name") = name;
  _infos->operator []("Key") = pubkey;
  _infos->operator []("Adress") = ip;
  _infos->operator []("Port") = port;
}
