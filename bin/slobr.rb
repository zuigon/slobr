#!/usr/bin/env ruby

lib_dir = File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH.unshift lib_dir if File.directory?(lib_dir)

require 'slobr'

if ARGV[0]
  @s = Slobr::Slobr.new File.read(ARGV[0])
else
  @s = Slobr::Slobr.new $stdin.readlines.join('')
end

@s.broji_slova()
puts @s.ispis
