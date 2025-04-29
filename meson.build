project('Bai', 'vala')

dependencies = [
  dependency('gtk4'),
  dependency('glib-2.0'),
  dependency('gtk4-layer-shell-0'),
]

bg_source = files('src/background/main.vala', 'src/background/values.vala')
top_source = files('src/topbar/main.vala', 'src/topbar/to_workspace.vala', 'src/topbar/show_time.vala', 'src/topbar/what_app_is_open.vala', 'src/topbar/workspaces.vala')

executable('Bar_bg', bg_source, dependencies: dependencies)
executable('Bar_top', top_source, dependencies: dependencies)
