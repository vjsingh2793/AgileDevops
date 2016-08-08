if $mysql_value == undef {
	$mysql_value = hiera('mysql')
}
class mysql{

	package { ['mysql-server']:
    ensure => present,
	  require => Exec['apt-get update'],
  }

  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'],
  }

  file { '/etc/mysql/my.cnf':
    source  => 'puppet:///modules/mysql/my.cnf',
    require => Package['mysql-server'],
    notify  => Service['mysql'],
  }

  exec { 'set-mysql-password':
    unless  => 'mysqladmin -uroot -proot password $mysql_value['admin_pass']',
    command => 'mysqladmin -uroot password root',
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }
}
