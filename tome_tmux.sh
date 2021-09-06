# Check to see if the tome session is already running.
tmux has-session -t tome
if [ $? != 0 ]; then
  # Verify that the project_dir variable is set to an actual directory.
  if [ ! -d $project_dir ]; then
    printf "%b" "The project_dir variable is not set to a valid directory." >&2
    exit 1
  fi

  # Move into the project directory.
  cd $project_dir

  # Create a new session called tome and make the first window the console
  tmux new-session -s tome -n console -d

  # Create a new window to be the angular server.
  tmux new-window -n server -t tome
  tmux send-keys -t tome "rails log:clear" C-m
  tmux send-keys -t tome "bundle exec rails s -p 3000" C-m

  # Move the server window to the current window and back.
  tmux bind u join-pane -h -s server
  tmux bind U break-pane -d -n server

  # Attach to the session
  tmux select-window -t tome:1
fi

# Start Atom for editing.
atom .

# The tome session is running, so just attach
tmux attach -t tome
