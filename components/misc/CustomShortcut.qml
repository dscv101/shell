import QtQuick

// Niri doesn't have the same global shortcut system as Hyprland
// This is a placeholder that does nothing for now
// TODO: Implement niri-compatible global shortcuts
Item {
    property string appid: "caelestia"
    property string name
    property string description
    
    signal pressed()
    signal released()
    
    // Placeholder - niri shortcuts would need to be configured in niri config
    Component.onCompleted: {
        console.warn("CustomShortcut: Global shortcuts not implemented for niri yet")
    }
}
