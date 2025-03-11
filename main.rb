#!/usr/bin/env ruby
require "sequel"
require_relative "models/models.rb"

include Models

p InvType.all