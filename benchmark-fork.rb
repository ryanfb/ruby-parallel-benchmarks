#!/usr/bin/env ruby

require 'benchmark'

require_relative 'constants'

Benchmark.bmbm do |x|
  x.report("sort!") {
    ITERATIONS.times do |i|
      fork do
        ARRAY.dup.sort!
      end
    end
    Process.waitall
  }
  x.report("sort")  {
    ITERATIONS.times do |i|
      fork do
        ARRAY.dup.sort
      end
    end
    Process.waitall
  }
  x.report("sleep") {
    SLEEP_ITERATIONS.times do |i|
      fork do
        sleep(1)
      end
    end
    Process.waitall
  }
end
