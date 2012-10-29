#!/usr/bin/env rackup
# encoding: utf-8

require "yaml"

require File.expand_path("../config/boot.rb", __FILE__)

run Padrino.application
