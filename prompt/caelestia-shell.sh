SCHEME_FILE="$HOME/.local/state/caelestia/scheme.json"

export HOST_TEXT=$(jq -r '.colours.onPrimary' "$SCHEME_FILE")
export USER_TEXT=$(jq -r '.colours.onSecondary' "$SCHEME_FILE")
export DIR_TEXT=$(jq -r '.colours.onTertiary' "$SCHEME_FILE")
export GIT_TEXT=$(jq -r '.colours.onBackground' "$SCHEME_FILE")
export HOST_BG=$(jq -r '.colours.primary' "$SCHEME_FILE")
export USER_BG=$(jq -r '.colours.secondary' "$SCHEME_FILE")
export DIR_BG=$(jq -r '.colours.tertiary' "$SCHEME_FILE")
export SEP_BG1=$(jq -r '.colours.surface2' "$SCHEME_FILE")
export SEP_BG2=$(jq -r '.colours.surface' "$SCHEME_FILE")
export GIT_BG=$(jq -r '.colours.background' "$SCHEME_FILE")
