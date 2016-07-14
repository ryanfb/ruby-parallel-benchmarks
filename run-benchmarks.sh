#!/bin/bash

for i in benchmark-*.rb; do echo $i; bundle exec ./$i; echo; done
