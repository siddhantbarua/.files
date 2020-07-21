#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


# Python interactive shell startup file if exists
if [ -d "$HOME/.config/python/.pythonrc.py" ]; then
        export PYTHONSTARTUP="$HOME/.config/python/.pythonrc.py"
fi

# Add user binaries if they exist
if [ -d "$HOME/bin" ]; then
        export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
        export PATH="$HOME/.local/bin:$PATH"
fi

# add to library path
if [ -d "/usr/local/lib" ]; then
        export LD_LIBRARY_PATH=/usr/local/lib
fi
