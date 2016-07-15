# Ruby Parallel Benchmarks

Because there's a proliferation of parallelism techniques/gems for Ruby, this collection of scripts aims to perform some simple benchmarks across them to help people in choosing something that's right for them and their needs.

Adapted from [this Gist](https://gist.github.com/francescoagati/4242223) by @francescoagati.

## Scripts

* `run-benchmarks.sh` - runs `benchmark-*.rb`
* `benchmark-all-rubies.sh` - runs `benchmark-*.rb` for every Ruby in `rbenv versions`. Not for the faint-hearted.

## Benchmarks

* `benchmark-celluloid-backported-pools.rb` - uses the backported API for [`celluloid`](https://github.com/celluloid/celluloid)
* `benchmark-celluloid-pmap.rb` - uses [`celluloid-pmap`](https://github.com/jwo/celluloid-pmap)
* `benchmark-celluloid-pools.rb` - uses the current API for [`celluloid`](https://github.com/celluloid/celluloid)
* `benchmark-concurrent-fixed-thread-pool.rb` - uses [`concurrent-ruby`](https://github.com/ruby-concurrency/concurrent-ruby)'s [`FixedThreadPool`](https://github.com/ruby-concurrency/concurrent-ruby/blob/master/doc/thread_pools.md)
* `benchmark-fork.rb` - uses the native `fork` call. Note that this doesn't use pooling/fork limits, and `fork` is not portable to JRuby, Windows, etc.
* `benchmark-naive.rb` - naive benchmark with no attempt at parallelism: if something performs worse than this, you're getting a performance hit
* `benchmark-parallel-process.rb` - uses processes from [`parallel`](https://github.com/grosser/parallel)
* `benchmark-parallel-thread.rb` - uses threads from [`parallel`](https://github.com/grosser/parallel)
* `benchmark-peach.rb` - uses [`peach`](http://peach.rubyforge.org/)
* `benchmark-pmap.rb` - uses [`pmap`](https://github.com/bruceadams/pmap)
* `benchmark-thread.rb` - uses the native Ruby `Thread` class, with no pooling/thread limits
* `constants.rb` - sets various constants used across benchmarks
