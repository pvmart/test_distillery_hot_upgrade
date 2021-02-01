#!/usr/bin/env bash

set -e

gen_release_and_upgrade() {
  git clean -xfd

  git checkout 0.1.0
  mix deps.get
  mix distillery.release

  git checkout 0.1.1
  mix distillery.release --upgrade
}

test_hot_upgrade() {
  mkdir xxx && cd xxx

  tar zxf ../_build/dev/rel/impl/releases/0.1.0/impl.tar.gz
  ./bin/impl start && sleep 1
  ./bin/impl rpc '{Bubu.rt, Bubu.ct}'

  mkdir releases/0.1.1

  cp ../_build/dev/rel/impl/releases/0.1.1/impl.tar.gz releases/0.1.1
  cp ../_build/dev/rel/impl/runtime_config.exs .
  ./bin/impl upgrade 0.1.1
  ./bin/impl rpc '{Bubu.rt, Bubu.ct}'

  ./bin/impl stop
  cd - && rm -rf xxx
}

gen_release_and_upgrade

test_hot_upgrade
