# ----------------------------
# NuShell settings
# ----------------------------

# show_banner (bool): Enable or disable the welcome banner at startup
$env.config.show_banner = false

# edit_mode (string) "vi" or "emacs" sets the editing behavior of Reedline
$env.config.edit_mode = "emacs"

# cursor_shape_* (string): Set the cursor shape for the terminal with "block", 
# "underscore", "line", "blink_block", "blink_underscore", "blink_line", or "inherit"
# "inherit" skips setting cursor shape and uses the current terminal setting.
$env.config.cursor_shape.emacs = "blink_line"

# ----------------------------
# Completions
# ----------------------------
source ~/.cache/carapace/init.nu

# ----------------------------
# Kubernetes
# ----------------------------
alias k = kubectl
source ~/.config/nushell/kube-context.nu

# ----------------------------
# Shell prompt - oh-my-posh
# ----------------------------
source ~/.oh-my-posh.nu
$env.KUBECTL_VERSION = '1.32.1'

# ---------------------
# Startup message
# ---------------------
cat ~/start-message.txt
