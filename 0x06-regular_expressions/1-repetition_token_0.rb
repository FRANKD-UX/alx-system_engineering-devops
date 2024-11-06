#!/usr/bin/env ruby
## This script matches all instances of "School" in the input argument

puts ARGV[0].scan(/School/).join
