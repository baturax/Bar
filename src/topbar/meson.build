dependencies = [
  dependency('gtk4'),
  dependency('gtk4-layer-shell-0'),
  dependency('libnotify'),
  dependency('json-glib-1.0'),
]

source = files(
  './Bar.vala',
  './things/Things.vala',
  './things/Values.vala',
  './modules/workspace.vala',
  './modules/window.vala',
  './modules/app-icon.vala',
  './modules/time.vala',
  './modules/battery.vala',
  './modules/charge.vala',
  './modules/volume.vala',
  './modules/controls.vala',
  './modules/charge.vala',
  './modules/shortcuts.vala',
  './modules/music.vala'
)

executable(
  'baibar',
  source,
  dependencies: dependencies,
  install: true
)
