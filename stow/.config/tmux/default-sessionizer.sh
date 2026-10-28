# runs in the first window of every new session (unless the project has its own .tmux-sessionizer.sh)
tmux new-window -dn scratch
nvim .
