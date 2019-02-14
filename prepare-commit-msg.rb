#!/usr/bin/env ruby

commit_msg_filepath = ARGV[0]

branch = `git symbolic-ref --short HEAD`.strip

regex = /(T[\d]+).*/

if !!regex.match(branch) then
  task = regex.match(branch)[1]

  content = File.read(commit_msg_filepath)
  msg = "[#{task}]#{content}"
  f = File.open(commit_msg_filepath, "w")
  f.puts msg
  f.close
  exit 0
else
  exit 1
end