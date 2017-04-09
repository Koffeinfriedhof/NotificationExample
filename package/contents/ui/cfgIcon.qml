/*
 * Copyright 2017 koffeinfriedhof <koffeinfriedhof@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import QtQuick.Layouts 1.3 as QtLayouts
import QtQuick.Controls 1.4 as QtControls
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: root
    property alias cfg_showIconBackground: bg.checked

    property real itemSpacing: units.largeSpacing

    QtLayouts.ColumnLayout {
        spacing: itemSpacing

        QtControls.CheckBox {
            id: bg
            // i18n: the plasmoid icon seen on the desktop or in panel
            text: i18n("Show Icon Background")
        }
    }
    Component.onCompleted: southern.checked=!northern.checked
}
