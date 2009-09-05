#!/usr/bin/env ruby

lib_dir = File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH.unshift lib_dir if File.directory?(lib_dir)

require 'slobr'

# Slobr.parse ARGV

@s = Slobr::Slobr.new($stdin.readlines)

@s.broji_slova()
puts @s.ispis
