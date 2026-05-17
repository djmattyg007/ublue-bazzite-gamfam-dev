gamfam-firefox-paste-and-go:
    #!/usr/bin/bash
    set -euo pipefail
    flatpak run org.mozilla.firefox --new-tab --url "$(wl-paste --no-newline)"

gamfam-wake-screen:
    #!/usr/bin/bash
    set -euo pipefail
    qdbus org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement org.kde.Solid.PowerManagement.wakeup
