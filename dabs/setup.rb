#!/usr/bin/env ruby

# In Ruby, $? is a special global variable that holds the exit status of the last child process executed by your script.
# https://lucasoshiro.github.io/posts-en/2024-06-17-ruby-shellscript/

require 'open3'

puts `echo hello`
puts `ls -la`
var = `date`
puts var

# system 'git statuss'
# if $?.success? # Variable that contains the status code of the last executed command.
#   puts $?.exitstatus
#   puts $?.success?
#   puts $?.pid
#   puts $?.to_i
# else
#   puts "ERROR"
# end
# 
# out, err, status = Open3.capture3 'git jog'
# if status.success? # Variable that contains the status code of the last executed command.
#   puts status.exitstatus
#   puts status.success?
#   puts status.pid
#   puts status.to_i
# else
#   puts "ERROR"
#   puts err
# end

puts `ls`.lines.map { |name| name.strip.length }
puts `ls`.lines.map { |name| name }

current_branch_regex = /^\* (\S+)/
output_lines = `git branch`.lines
output_lines.each do |line|
  if line =~ current_branch_regex # match the string with the regex
    puts $1                       # prints the match of the first group  
  end
end

exists = File.exist? 'My File'           # methods that return booleans end in ?
if exists
  file_content = File.open('My File').read
  File.delete 'My File'                     # parentheses are optional if it's not ambiguous
else
  puts 'file does not exist'
end

