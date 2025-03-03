#!/bin/sh

[ -z "$POSTGRES_USER" ] && POSTGRES_USER=kemal
[ -z "$POSTGRES_DB" ] && POSTGRES_DB=invidious

psql "$POSTGRES_DB" "$POSTGRES_USER" -c "ALTER TABLE channels ADD COLUMN subscribed bool;"
psql "$POSTGRES_DB" "$POSTGRES_USER" -c "UPDATE channels SET subscribed = false;"
