project('Bai', 'vala')

dependencies = [
  dependency('gtk4'),
  dependency('glib-2.0'),
  dependency('gtk4-layer-shell-0'),
]

bg_source = files('src/bg.vala')
top_source = files('src/topbar.vala')

executable('Bar_bg', bg_source, dependencies: dependencies)
executable('Bar_top', top_source, dependencies: dependencies)