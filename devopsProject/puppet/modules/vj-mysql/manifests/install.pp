
class mysql::install{

	package { ['mysql-server']:
	ensure => present,
  }
}

