#!/usr/bin/env ruby

require 'benchmark'
require 'parallel'

require_relative 'constants'

Benchmark.bmbm do |x|
  x.report("sort!") { Parallel.map((1..ITERATIONS), :in_threads=>THREAD_LIMIT) { ARRAY.dup.sort! } }
  x.report("sort")  { Parallel.map((1..ITERATIONS), :in_threads=>THREAD_LIMIT) { ARRAY.dup.sort }  }
  x.report("sleep")  { Parallel.map((1..SLEEP_ITERATIONS), :in_threads=>THREAD_LIMIT) { sleep(1) }  }
end
