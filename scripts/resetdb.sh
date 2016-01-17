#!/usr/bin/env bash

dropdb -Upostgres activities_tracker;
createdb -Upostgres activities_tracker;

rake db:schema:load
rake db:seed
