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

# User functions
# To cd then ls
cl(){
        cd $1
        ls
}

# To mount windows drive and go to Ron folder
winmount(){
        sudo mount /dev/nvme0n1p3 /media/windows
        cd /media/windows/Users/siddh/Desktop/Ron/
}

# To unmount windows drive.
winunmount(){
        cd ~
        if [ ! -z "$(ls -A /media/windows)" ]; then
                        sudo umount /media/windows
        fi
}

# Opening documents
open(){
        xdg-open $1
}
