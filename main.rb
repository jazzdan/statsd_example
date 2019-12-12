#!/usr/bin/env ruby

require 'rubygems'
require 'statsd-ruby'
require 'jsonl'

raw_json = ARGF.read
parsed_json = JSONL.parse(raw_json)
$statsd = Statsd.new("localhost", 9125)

# Here you could grab a user and also increment updates by user
parsed_json.each { |j| $statsd.increment('update') }
