## Python startup script. PYTHONSTARTUP points to this
import sys

class PythonPrompt(object):
    def __init__(self):
        self.line = 0

    def __str__(self):
        self.line += 1
        return "\033[32mron@py[%d]:\033[0m " % (self.line)

# changing PS1
sys.ps1 = PythonPrompt()
# changing PS2
sys.ps2 = " \033[92m>>\033[0m"

# enable syntax completion using tab
try:
    import readline
except ImportError:
    print("Module readline not available.")
else:
    import rlcompleter
    readline.parse_and_bind("tab: complete")
    if "libedit" in readline.__doc__:
        print("Readline compiled with libedit instead of GNU readline. Tab completion may fail.")





























