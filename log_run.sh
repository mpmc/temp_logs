#!/bin/bash

while true
do
  git add logs/*.json || true
  git commit -m "log update"
  git push
  sleep 600
done
