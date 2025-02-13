project('sway-notificaton-center', ['c', 'vala'],
  version: '0.3',
  meson_version: '>= 0.50.0',
  default_options: [ 'warning_level=2' ],
)

subdir('src')

datadir = get_option('datadir')
libdir = get_option('libdir')

conf_data = configuration_data()
conf_data.set('bindir', join_paths(get_option('prefix'), get_option('bindir')))

# Dbus service
configure_file(
  configuration: conf_data,
  input: 'services/dbus/org.erikreider.swaync.service.in',
  output: '@BASENAME@',
  install_dir: datadir + '/dbus-1/services'
)

# Systemd service unit
systemd = dependency('systemd', required: false)
if get_option('systemd-service')
  if systemd.found()
    systemd_service_install_dir = systemd.get_pkgconfig_variable('systemduserunitdir')
  else
    systemd_service_install_dir = join_paths(libdir, 'systemd', 'user')
  endif

  configure_file(
    configuration: conf_data,
    input: 'services/systemd/swaync.service.in',
    output: '@BASENAME@',
    install_dir: systemd_service_install_dir
  )
endif

# Zsh completion
if get_option('zsh-completions')
  zsh_files = files(
    'completions/zsh/_swaync',
    'completions/zsh/_swaync-client',
  )
  zsh_install_dir = join_paths(datadir, 'zsh', 'site-functions')

  install_data(zsh_files, install_dir: zsh_install_dir)
endif

# Bash completion
bash_comp = dependency('bash-completion', required: false)
if get_option('bash-completions')
  bash_files = files(
    'completions/bash/swaync',
    'completions/bash/swaync-client',
  )

  if bash_comp.found()
    bash_install_dir = bash_comp.get_variable(
      pkgconfig: 'completionsdir',
      pkgconfig_define: ['datadir', datadir]
    )
  else
    bash_install_dir = join_paths(datadir, 'bash-completion', 'completions')
  endif

  install_data(bash_files, install_dir: bash_install_dir)
endif

# Fish completion
fish_comp = dependency('fish', required: false)
if get_option('fish-completions')
  fish_files = files(
    'completions/fish/swaync.fish',
    'completions/fish/swaync-client.fish',
  )

  if fish_comp.found()
    fish_install_dir = fish_comp.get_variable(
      pkgconfig: 'completionsdir',
      pkgconfig_define: ['datadir', datadir]
    )
  else
    fish_install_dir = join_paths(datadir, 'fish', 'vendor_completions.d')
  endif

  install_data(fish_files, install_dir: fish_install_dir)
endif

