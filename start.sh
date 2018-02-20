#!/bin/bash

export PORT=5104

cd ~/www/tasks
./bin/tasks stop || true
./bin/tasks start
