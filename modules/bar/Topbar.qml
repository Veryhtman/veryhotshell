pragma ComponentBehavior: Bound

import qs.components
import qs.config
import qs.services
import "components"
import Quickshell
import QtQuick
import QtQuick.Layouts

RowLayout {
    id: root


    Connections {
        target: Config.bar.clock
        function onShowIconChanged() {
            console.log("⚠️  CONFIG CHANGED! showIcon is now:", Config.bar.clock.showIcon);
            console.log("   Stack trace - someone changed the config!");
        }
    }
    required property ShellScreen screen
    required property PersistentProperties visibilities

    readonly property int hPadding: Appearance.padding.large

    spacing: Appearance.spacing.normal

    Component.onCompleted: {
        console.log("╔════════════════════════════════════════════════════════╗");
        console.log("║          TOPBAR COMPONENT CREATED                      ║");
        console.log("╚════════════════════════════════════════════════════════╝");
        console.log("📏 Topbar size:", width, "x", height);
        console.log("⚙️  Config.topbar.enabled:", Config.topbar.enabled);
        console.log("⚙️  Config.topbar.persistent:", Config.topbar.persistent);
        console.log("👁️  visibilities.topbar:", visibilities.topbar);
        console.log("");
        console.log("🕐 CLOCK CONFIG:");
        console.log("   Config.bar.clock.showTop:", Config.bar.clock.showTop);
        console.log("   Config.bar.clock.showLeft:", Config.bar.clock.showLeft);
        console.log("   Config.bar.clock.showIcon:", Config.bar.clock.showIcon);
        console.log("════════════════════════════════════════════════════════");
    }

    // Padding gauche
    Item {
        Layout.preferredWidth: root.hPadding
        Component.onCompleted: {
            console.log("🔲 Left padding created");
        }
    }

    // Spacer gauche pour centrer
    Item {
        Layout.fillWidth: true
        Component.onCompleted: console.log("↔️  Left spacer created")
    }

    // Texte de test CENTRÉ
    Text {
        Layout.alignment: Qt.AlignVCenter
        text: "TOPBAR TEST - " + root.width + "x" + root.height
        color: Config.style.topbar.textColor
        font.pixelSize: Config.style.topbar.textSize
        font.family: Config.style.clock.textFont
        font.bold: true
        Component.onCompleted: {
            console.log("📝 Test text created -", text);
        }
    }

    // Spacer droit pour centrer
    Item {
        Layout.fillWidth: true
        Component.onCompleted: console.log("↔️  Right spacer created")
    }

    // Clock - Affichée seulement si showTop est true
    Loader {
        active: Config.bar.clock.showTop
        visible: active
        Layout.alignment: Qt.AlignVCenter
        onLoaded: {
            console.log("🕐 Topbar clock LOADED - item:", item);
            console.log("   item.implicitWidth:", item.implicitWidth);
            console.log("   item.implicitHeight:", item.implicitHeight);
        }
        sourceComponent: Clock {
            displayMode: "horizontal"
            //colour: Colours.palette.m3onSurface
        }
        Component.onCompleted: {
            console.log("");
            console.log("╔════════════════════════════════════════════════════════╗");
            console.log("║          TOPBAR CLOCK LOADER                           ║");
            console.log("╚════════════════════════════════════════════════════════╝");
            console.log("   active:", active);
            console.log("   visible:", visible);
            console.log("   Config.bar.clock.showTop:", Config.bar.clock.showTop);
            console.log("   status:", status, "(1=Ready, 2=Loading, 3=Error)");
            console.log("   Layout.alignment:", Layout.alignment);
            console.log("════════════════════════════════════════════════════════");
        }
        onActiveChanged: {
            console.log("🕐 Topbar clock active changed to:", active);
        }
        onStatusChanged: {
            console.log("🕐 Topbar clock status changed to:", status);
            if (status === Loader.Ready) {
                console.log("   ✅ Clock loaded successfully");
                console.log("   item:", item);
            } else if (status === Loader.Error) {
                console.log("   ❌ Clock loading ERROR");
            }
        }
    }
    // Padding droit
    Item {
        Layout.preferredWidth: root.hPadding

        Component.onCompleted: {
            console.log("🔲 Right padding created");
        }
    }
}
