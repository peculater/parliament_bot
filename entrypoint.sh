#!/bin/sh

if [ -n "$PARLIBOT_SLACK_TOKEN" ]; then
  (sleep 10; curl -X POST "http://localhost:4000/api/$PARLIBOT_SLACK_TOKEN") &
fi
mix phoenix.server

