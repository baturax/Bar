project('Bai', 'vala')

dependencies = [
  dependency('gtk4'),
  dependency('glib-2.0'),
  dependency('gtk4-layer-shell-0'),
]

bg_source = files('src/background/main.vala', 'src/background/modules/values.vala')
top_source = files('src/topbar/main.vala', 'src/topbar/modules/to_workspace.vala', 'src/topbar/modules/show_time.vala', 'src/topbar/modules/what_app_is_open.vala', 'src/topbar/modules/workspaces.vala', 'src/topbar/modules/values.vala', 'src/topbar/modules/what_app_icon.vala', 'src/topbar/modules/get_battery_status.vala', 'src/topbar/modules/get_battery.vala', 'src/topbar/modules/shortcuts.vala', 'src/topbar/modules/volume.vala')

executable('Bai_bar', bg_source, dependencies: dependencies)
executable('Bai_wallpaper', top_source, dependencies: dependencies)
