require 'benchmark'
require 'parallel'

array = (1..100000).map { rand }

Benchmark.bmbm do |x|
  x.report("sort!") { Parallel.map((0..20), :in_threads=>8) { array.dup.sort! } }
  x.report("sort")  { Parallel.map((0..20), :in_threads=>8) { array.dup.sort! }  }
end