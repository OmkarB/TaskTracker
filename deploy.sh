#!/bin/bash
# Borrowed from Memory Game's deployment file
export PORT=5102
export MIX_ENV=prod
export GIT_PATH=/home/tasks/src/tasks 

PWD=`pwd`
if [ $PWD != $GIT_PATH ]; then
	echo "Error: Must check out git repo to $GIT_PATH"
	echo "  Current directory is $PWD"
	exit 1
fi

if [ $USER != "tasks" ]; then
	echo "Error: must run as user 'tasks'"
	echo "  Current user is $USER"
	exit 2
fi

mix deps.get
(cd assets && npm install)
(cd assets && ./node_modules/brunch/bin/brunch b -p)
mix phx.digest
mix release --env=prod

mkdir -p ~/www
mkdir -p ~/old

NOW=`date +%s`
if [ -d ~/www/tasks ]; then
	echo mv ~/www/tasks ~/old/$NOW
	mv ~/www/tasks ~/old/$NOW
fi

mkdir -p ~/www/tasks
REL_TAR=~/src/tasks/_build/prod/rel/task_tracker/releases/0.0.1/task_tracker.tar.gz
(cd ~/www/tasks && tar xzvf $REL_TAR)

crontab - <<CRONTAB
@reboot bash /home/tasks/src/tasks/start.sh
CRONTAB

#. start.sh
