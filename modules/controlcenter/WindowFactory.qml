pragma Singleton

import qs.components
import qs.services
import qs.config
import Quickshell
import QtQuick

Singleton {
    id: root

    function create(parent: Item, props: var): void {
        controlCenter.createObject(parent ?? dummy, props);
    }

    QtObject {
        id: dummy
    }

    Component {
        id: controlCenter

        FloatingWindow {
            id: win

            property alias active: cc.active
            property alias navExpanded: cc.navExpanded

            color: Config.style.windowFactory.mainColor

            onVisibleChanged: {
                if (!visible)
                    destroy();
            }

            minimumSize.width: 1000
            minimumSize.height: 600

            implicitWidth: cc.implicitWidth
            implicitHeight: cc.implicitHeight

            title:  qsTr(Config.style.windowFactory.titleFormat).arg(Config.style.windowFactory.titleString).arg(cc.active.slice(0, 1).toUpperCase() + cc.active.slice(1))

            ControlCenter {
                id: cc

                anchors.fill: parent
                screen: win.screen
                floating: true

                function close(): void {
                    win.destroy();
                }
            }

            Behavior on color {
                CAnim {}
            }
        }
    }
}
