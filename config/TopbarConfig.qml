import Quickshell.Io

JsonObject {
    property bool persistent: true
    property bool showOnHover: true
    property bool enabled: true
    property int topBorderThickness: 1
    property Sizes sizes: Sizes {}

    property int dragThreshold: 20
    property ScrollActions scrollActions: ScrollActions {}

    component Sizes: JsonObject {
        property int height: 20
    }

    component ScrollActions: JsonObject {
        property bool workspaces: true
        property bool volume: true
        property bool brightness: true
    }
}
