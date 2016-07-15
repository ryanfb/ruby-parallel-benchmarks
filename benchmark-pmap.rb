#!/usr/bin/env ruby

require 'benchmark'
require 'pmap'

require_relative 'constants'
require_relative 'pidigits'

Benchmark.bmbm do |x|
  x.report("pi") { (0..ITERATIONS - 1).pmap(THREAD_LIMIT) {|i| pidigits(i + 1000) } }
  x.report("sort!") { (1..ITERATIONS).pmap(THREAD_LIMIT) { ARRAY.dup.sort! } }
  x.report("sort")  { (1..ITERATIONS).pmap(THREAD_LIMIT) { ARRAY.dup.sort }  }
  x.report("sleep") { (1..SLEEP_ITERATIONS).pmap(THREAD_LIMIT) { sleep(1) }  }
end
