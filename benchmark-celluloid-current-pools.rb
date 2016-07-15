#!/usr/bin/env ruby

require 'benchmark'
require 'celluloid/current'

require_relative 'constants'

class BenchmarkWorker
  include Celluloid
  require_relative 'pidigits'

  def sort!
    ARRAY.dup.sort!
  end

  def sort
    ARRAY.dup.sort
  end

  def sleep_work
    sleep(1)
  end

  def pi(n)
    pidigits(n)
  end
end

Benchmark.bmbm do |x|
  x.report("pidigits") {
    celluloid_pool = BenchmarkWorker.pool(size: THREAD_LIMIT)
    (0..ITERATIONS - 1).map { |i|
      celluloid_pool.future(:pi, i + 1000)
    }.map(&:value)
  }
  x.report("sort!") {
    celluloid_pool = BenchmarkWorker.pool(size: THREAD_LIMIT)
    (1..ITERATIONS).map { 
      celluloid_pool.future(:sort!)
    }.map(&:value)
  }
  x.report("sort") {
    celluloid_pool = BenchmarkWorker.pool(size: THREAD_LIMIT)
    (1..ITERATIONS).map {
      celluloid_pool.future(:sort)
    }.map(&:value)
  }
  x.report("sleep") {
    celluloid_pool = BenchmarkWorker.pool(size: THREAD_LIMIT)
    (1..SLEEP_ITERATIONS).map {
      celluloid_pool.future(:sleep_work)
    }.map(&:value)
  }
end
