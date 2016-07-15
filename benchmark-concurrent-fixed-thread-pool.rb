#!/usr/bin/env ruby

require 'benchmark'
require 'concurrent/executors'

require_relative 'constants'

Benchmark.bmbm do |x|
  x.report("sort!") {
    concurrent_pool = Concurrent::FixedThreadPool.new(THREAD_LIMIT)
    ITERATIONS.times do 
      concurrent_pool.post do
        ARRAY.dup.sort!
      end
    end
    concurrent_pool.shutdown
    concurrent_pool.wait_for_termination
  }
  x.report("sort") {
    concurrent_pool = Concurrent::FixedThreadPool.new(THREAD_LIMIT)
    ITERATIONS.times do 
      concurrent_pool.post do
        ARRAY.dup.sort
      end
    end
    concurrent_pool.shutdown
    concurrent_pool.wait_for_termination
  }
  x.report("sleep") {
    concurrent_pool = Concurrent::FixedThreadPool.new(THREAD_LIMIT)
    SLEEP_ITERATIONS.times do 
      concurrent_pool.post do
        sleep(1)
      end
    end
    concurrent_pool.shutdown
    concurrent_pool.wait_for_termination
  }
end
