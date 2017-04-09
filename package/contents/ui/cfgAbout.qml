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
    Text {
        id: txt
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        wrapMode: Text.WordWrap

        MouseArea {
            id: txtMA
            anchors.fill: parent
        }
        text: "<br /><h3>This page is the About-page</h3><br />"
    }
    QtLayouts.RowLayout {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        PlasmaCore.IconItem {
            source: linker.text.substr(0,7) == "http://" ? "internet-web-browser.png" : "mail-message-new.png"
            visible: linker.text.length
        }
        QtControls.Label {
            QtLayouts.Layout.alignment: Qt.AlignVCenter
            id: linker
            wrapMode: Text.WordWrap
        }
    }
    states: State {
        name: "cursor"; when: txt.hoveredLink.length > 0
        PropertyChanges { target: txtMA; cursorShape: Qt.PointingHandCursor; }
        PropertyChanges { target: txtMA; onClicked: Qt.openUrlExternally(txt.hoveredLink) }
        PropertyChanges { target: linker; text: txt.hoveredLink}
    }
}
