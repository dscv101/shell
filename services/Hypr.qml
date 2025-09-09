pragma Singleton

// Compatibility layer that redirects Hypr calls to NiriService
// This allows existing code to continue working without major changes

import qs.services
import QtQuick

Singleton {
    id: root

    // Redirect all properties to NiriService
    readonly property var toplevels: NiriService.toplevels
    readonly property var workspaces: NiriService.workspaces
    readonly property var monitors: NiriService.monitors
    readonly property int activeWsId: NiriService.activeWsId
    readonly property var focusedWorkspace: NiriService.allWorkspaces.find(w => w.is_focused) || null
    readonly property var focusedMonitor: NiriService.outputs[NiriService.currentOutput] || null

    property var keyboard: NiriService.keyboard
    readonly property bool capsLock: NiriService.capsLock
    readonly property bool numLock: NiriService.numLock
    readonly property string defaultKbLayout: NiriService.defaultKbLayout
    readonly property string kbLayoutFull: NiriService.kbLayoutFull
    readonly property string kbLayout: NiriService.kbLayout

    // Redirect functions to NiriService
    function dispatch(request) {
        return NiriService.dispatch(request)
    }

    function monitorFor(screen) {
        return NiriService.monitorFor(screen)
    }

    // Connect to NiriService signals
    Connections {
        target: NiriService
        function onWorkspacesChanged() {
            // Emit compatibility signals if needed
        }
    }
}
