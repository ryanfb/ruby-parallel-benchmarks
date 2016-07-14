#!/bin/bash

mkdir -p results
for ruby in $(rbenv versions --bare --skip-aliases | fgrep -v 1.8); do
  echo "Benchmarking $ruby"
  rbenv local $ruby
  gem install bundler
  bundle update
  bundle install
  ./run-benchmarks.sh > results/${ruby}.txt
done
