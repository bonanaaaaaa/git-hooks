#!/usr/bin/env ruby

commit_msg_filepath = ARGV[0]

branch = `git symbolic-ref --short HEAD`.strip

branch_regex = /([\w\d]+).*/
content_regex = /^\[(?:[T\d+]|[\w\d]+)\]\[[\w\&]+\]\s[^\[\]]+$/
content_with_name_regex = /^\[[\w\&]+\]\s[^\[\]]+$/

name = "Bonn"

if !!branch_regex.match(branch) then
  task = branch_regex.match(branch)[1]

  content = File.read(commit_msg_filepath)

  msg = if !!content_regex.match(content) then
    content
  elsif !!content_with_name_regex.match(content) then
    "[#{task}]#{content}"
  else
    "[#{task}][#{name}] #{content}"
  end

  f = File.open(commit_msg_filepath, "w")
  f.puts msg
  f.close
  exit 0
else
  exit 0
end