# See README.md for details
define clustershell::group_source (
  $map,
  $ensure   = 'present',
  $all      = 'UNSET',
  $list     = 'UNSET',
  $reverse  = 'UNSET',
) {

  include ::clustershell

  $path = "${::clustershell::groups_dir}/${name}.conf"

  file { "clustershell::group_source ${name}":
    ensure  => $ensure,
    path    => $path,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('clustershell/group_source.conf.erb'),
    require => File['/etc/clustershell/groups.conf.d'],
  }

}
