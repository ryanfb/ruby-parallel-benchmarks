#!/usr/bin/env ruby

require 'benchmark'

require_relative 'constants'
require_relative 'pidigits'

Benchmark.bmbm do |x|
  x.report("pi") {
    ITERATIONS.times do |i|
      fork do
        pidigits(i + 1000)
      end
    end
    Process.waitall
  }
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
