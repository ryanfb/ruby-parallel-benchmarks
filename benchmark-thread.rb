#!/usr/bin/env ruby

require 'benchmark'

require_relative 'constants'
require_relative 'pidigits'

Benchmark.bmbm do |x|
  x.report("pi") {
    threads = []
    ITERATIONS.times do |i|
      threads << Thread.new do
        pidigits(i + 1000)
      end
    end
    threads.map(&:join)
  }
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
