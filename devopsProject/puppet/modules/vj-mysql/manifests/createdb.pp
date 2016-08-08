if $mysql_value == undef {
        $mysql_value = hiera('mysql')
}

class mysql::createdb($user=$mysql_value['username'],$password=$mysql_value['password'],$name=$mysql_value['dbname'] ) {
    exec { "create-${name}-db":
      unless => "/usr/bin/mysql -u${user} -p${password} ${name}",
      command => "/usr/bin/mysql -uroot -p$mysql_password -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password';\"",
      require => Service["mysqld"],
    }
  }
