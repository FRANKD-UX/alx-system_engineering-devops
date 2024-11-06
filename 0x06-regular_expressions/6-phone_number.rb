#!/usr/bin/env ruby
# This script matches a 10-digit phone number with no spaces or special characters.

puts ARGV[0].scan(/^\d{10}$/).join
