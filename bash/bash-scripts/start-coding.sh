#!/bin/bash

SESSION_NAME="${1:-"new-project"}"

if tmux has-session -t $SESSION_NAME 2>/dev/null; then 
    echo "Session $SESSION_NAME already exists. Attaching to it..."
else
    if [ ! -d "~/Coding/$SESSION_NAME" ]; then
        echo "Creating new directory for project $SESSION_NAME"
        mkdir "~/Coding/$SESSION_NAME"
    fi

    cd ~/Coding/$SESSION_NAME

    tmux new-session -d -s $SESSION_NAME

    window=1
    tmux rename-window -t $SESSION_NAME:$window "nvim"
    tmux send-keys -t $SESSION_NAME:$window 'nvim' C-m

    window=2
    tmux new-window -t $SESSION_NAME:$window -n "terminal"
    tmux split-window -h
    tmux split-window -v
fi

tmux attach-session -t $SESSION_NAME:1

