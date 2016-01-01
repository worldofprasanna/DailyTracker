#!/usr/bin/env bash

dropdb activities_tracker;
createdb activities_tracker;

rake db:schema:load
rake db:seed
