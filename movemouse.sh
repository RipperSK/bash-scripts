#!/bin/bash

echo "moving mouse in 5 second intervals until CTRL+C is pressed"

while (true); do
	xdotool mousemove_relative 1 1
  sleep 5
	xdotool mousemove_relative -- -1 -1
  sleep 5
done
