if $mysql_value == undef {
        $mysql_value = hiera('mysql')
}

class mysql::setpassword{
 exec { 'set-mysql-password':
    unless  => 'mysqladmin -uroot -proot password $mysql_value['admin_pass']',
    command => 'mysqladmin -uroot password root',
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }
}



