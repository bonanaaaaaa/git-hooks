#!/usr/bin/env ruby

cmd = "mix format --check-formatted"

result = system cmd

if result == false then
  puts "formatted"
  exec "mix format"
end

exit 0