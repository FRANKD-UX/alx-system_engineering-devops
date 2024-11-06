#!/usr/bin/env ruby
# This script extracts sender, receiver, and flags from a given log entry.

# Regular expression to match the sender, receiver, and flags
log_entry = ARGV[0]
sender = log_entry.scan(/\[\s*from:([^\]]+)\]/).join
receiver = log_entry.scan(/\[\s*to:([^\]]+)\]/).join
flags = log_entry.scan(/\[\s*flags:([^\]]+)\]/).join

# Output the result in the format: sender,receiver,flags
puts "#{sender},#{receiver},#{flags}"
