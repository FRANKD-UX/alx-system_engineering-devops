#!/usr/bin/env ruby
# This script matches "hb" followed by zero or more "t" characters, ending with "n".

puts ARGV[0].scan(/hbt*n/).join
