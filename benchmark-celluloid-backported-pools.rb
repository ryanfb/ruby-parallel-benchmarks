#!/usr/bin/env ruby

require 'benchmark'
require 'celluloid/backported'

require_relative 'constants'

class BenchmarkWorker
  include Celluloid

  def sort!
    ARRAY.dup.sort!
  end

  def sort
    ARRAY.dup.sort
  end

  def sleep
    sleep(1)
  end
end

Benchmark.bmbm do |x|
  x.report("sort!") {
    celluloid_pool = BenchmarkWorker.pool(size: THREAD_LIMIT)
    ITERATIONS.times do 
      celluloid_pool.async.sort!
    end
  }
  x.report("sort") {
    celluloid_pool = BenchmarkWorker.pool(size: THREAD_LIMIT)
    ITERATIONS.times do 
      celluloid_pool.async.sort
    end
  }
  x.report("sleep") {
    celluloid_pool = BenchmarkWorker.pool(size: THREAD_LIMIT)
    SLEEP_ITERATIONS.times do 
      celluloid_pool.async.sleep
    end
  }
end
