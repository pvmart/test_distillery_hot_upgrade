use Mix.Config

config :impl, Mod, impl: Mod.C

import_config "#{Mix.env()}.exs"
