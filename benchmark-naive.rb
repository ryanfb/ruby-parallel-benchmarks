#!/usr/bin/env ruby

require 'benchmark'

require_relative 'constants'

Benchmark.bmbm do |x|
  x.report("sort!") {
    ITERATIONS.times do |i|
      ARRAY.dup.sort!
    end
  }
  x.report("sort")  {
    ITERATIONS.times do |i|
      ARRAY.dup.sort
    end
  }
  x.report("sleep") {
    SLEEP_ITERATIONS.times do |i|
      sleep(1)
    end
  }
end
