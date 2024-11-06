#!/usr/bin/env ruby
# This script accepts an argument and checks if it matches the pattern for "h" followed by one or more "b"s, and ending with "n"

# Regular expression to match the pattern "h" followed by one or more "b"s, and ending with "n"
input_string = ARGV[0]

# Check if the input string matches the regular expression
  if input_string.match?(/hb+n/)
    puts input_string
  else
    puts ""
  end
