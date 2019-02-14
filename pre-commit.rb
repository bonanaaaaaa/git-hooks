#!/usr/bin/env ruby

email = `git config user.email`

email_regex = /.*@omise\.co/

if !!(email =~ email_regex) == false then
  puts "git user email is invalid"
  exit 1
end

cmd = "mix format --check-formatted"

result = system cmd

if result == false then
  puts "formatted"
  exec "mix format"
end

exit 0