import atexit
import os
import readline


histfile = os.environ['XDG_DATA_HOME'] + "/python/hist"

try:
    readline.read_history_file(histfile)
    readline.set_history_length(1000)
except FileNotFoundError:
    pass

atexit.register(readline.write_history_file, histfile);
