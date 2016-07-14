#!/usr/bin/env ruby

require 'benchmark'

require_relative 'constants'

Benchmark.bmbm do |x|
  x.report("sort!") {
    threads = []
    ITERATIONS.times do |i|
      threads << Thread.new do
        ARRAY.dup.sort!
      end
    end
    threads.map(&:join)
  }
  x.report("sort")  {
    threads = []
    ITERATIONS.times do |i|
      threads << Thread.new do
        ARRAY.dup.sort
      end
    end
    threads.map(&:join)
  }
  x.report("sleep")  {
    threads = []
    SLEEP_ITERATIONS.times do |i|
      threads << Thread.new do
        sleep(1)
      end
    end
    threads.map(&:join)
  }
end
