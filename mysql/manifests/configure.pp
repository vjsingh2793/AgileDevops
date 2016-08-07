class mysql::configure inherits mysql::params{
file{'/etc/mysql':
        ensure=> directory,
}
file{'/etc/mysql/my.cnf':
content => template('mysql/my.cnf.erb'),
notify => Service['mysql'],
}
} 

