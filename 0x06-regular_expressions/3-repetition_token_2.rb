#!/usr/bin/env ruby
# This script matches "hbt" followed by one or more "t" characters, ending with "n".

puts ARGV[0].scan(/hbt+n/).join
