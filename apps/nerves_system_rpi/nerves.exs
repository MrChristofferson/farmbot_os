use Mix.Config

@version Path.join([__DIR__, "..", "farmbot", "VERSION"])
  |> File.read!
  |> String.strip

pkg = :nerves_system_rpi
nerves_target = "rpi"

config pkg, :nerves_env,
  type: :system,
  version: version,
  compiler: :nerves_package,
  artifact_url: [
    "https://github.com/FarmBot/farmbot_os/releases/download/v#{version}/farmbot.rootfs-#{pkg}-v#{version}.tar.gz"
    ],
  platform: Nerves.System.BR,
  platform_config: [
    defconfig: "nerves_defconfig",
  ],
  checksum: [
    "rootfs-additions",
    "linux-4.4.defconfig",
    "fwup.conf",
    "cmdline.txt",
    "config.txt",
    "post-createfs.sh",
    "VERSION"
  ]
