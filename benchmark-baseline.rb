#!/usr/bin/env ruby

require 'benchmark'

require_relative 'constants'
require_relative 'pidigits'

Benchmark.bmbm do |x|
  x.report("pi") {
    ITERATIONS.times do |i|
      pidigits(i + 1000)
    end
  }
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
