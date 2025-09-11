#!/home/ggioalema/anaconda3/bin/python3

import subprocess
import sys
try:
    import i3ipc
except ImportError:
    print("Install i3ipc: pip3 install --user i3ipc", file=sys.stderr)
    sys.exit(1)

MODULE = "i3mode"  # deve combaciare col nome del modulo in config.ini

def module_show():
    subprocess.run(["polybar-msg", "action", f"#{MODULE}.module_show"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

def module_hide():
    subprocess.run(["polybar-msg", "action", f"#{MODULE}.module_hide"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

def update(i3):
    modes = i3.get_binding_modes()
    current = modes[0] if modes else "default"
    if current == "default":
        module_hide()
        # stampo uno spazio per forzare un refresh, ma il modulo è nascosto
        print(" ", flush=True)
    else:
        module_show()
        print(current, flush=True)

def main():
    i3 = i3ipc.Connection()
    # stato iniziale
    update(i3)

    def on_mode(i3, e):
        update(i3)

    i3.on("mode", on_mode)
    i3.main()

if __name__ == "__main__":
    main()
