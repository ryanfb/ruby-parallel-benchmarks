#!/usr/bin/env ruby

require 'benchmark'
require 'parallel'

require_relative 'constants'
require_relative 'pidigits'

Benchmark.bmbm do |x|
  x.report("pi") { Parallel.map((0..ITERATIONS - 1), :in_process=>THREAD_LIMIT) {|i| pidigits(i + 1000) } }
  x.report("sort!") { Parallel.map((1..ITERATIONS), :in_process=>THREAD_LIMIT) { ARRAY.dup.sort! } }
  x.report("sort")  { Parallel.map((1..ITERATIONS), :in_process=>THREAD_LIMIT) { ARRAY.dup.sort }  }
  x.report("sleep")  { Parallel.map((1..SLEEP_ITERATIONS), :in_process=>THREAD_LIMIT) { sleep(1) }  }
end
