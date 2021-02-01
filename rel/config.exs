# Import all plugins from `rel/plugins`
# They can then be used by adding `plugin MyPlugin` to
# either an environment, or release definition, where
# `MyPlugin` is the name of the plugin module.
~w(rel plugins *.exs)
|> Path.join()
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Distillery.Releases.Config,
  # This sets the default release built by `mix distillery.release`
  default_release: :default,
  # This sets the default environment used by `mix distillery.release`
  default_environment: Mix.env()

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/config/distillery.html

# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set(include_erts: true)
  set(include_src: false)
  set(cookie: :"&<CX&q(}bU;imN4LzL[)z&*Izjvo;wBa]u23=K0kl82__RUL8l>r[=?FfZ_(TOWR")
  set(vm_args: "rel/vm.args")

  set(
    config_providers: [
      {Distillery.Releases.Config.Providers.Elixir, ["${RELEASE_ROOT_DIR}/runtime_config.exs"]}
    ]
  )

  set(
    overlays: [
      {:copy, "rel/dev_runtime_config.exs", "runtime_config.exs"}
    ]
  )
end

environment :prod do
  set(include_erts: true)
  set(include_src: false)
  set(cookie: :"N[ruyKz6<Aj{|N$nq_%zRWv_pFDAd{IhE>N91R8$t<W7UBa=}Leve~/E<QZLzeb|")
  set(vm_args: "rel/vm.args")

  set(
    config_providers: [
      {Distillery.Releases.Config.Providers.Elixir, ["${RELEASE_ROOT_DIR}/runtime_config.exs"]}
    ]
  )

  set(
    overlays: [
      {:copy, "rel/rel_runtime_config.exs", "runtime_config.exs"}
    ]
  )
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix distillery.release`, the first release in the file
# will be used by default

release :impl do
  set(version: current_version(:impl))

  set(
    applications: [
      :runtime_tools
    ]
  )
end
