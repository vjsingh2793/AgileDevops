if $mysql_value == undef {
        $mysql_value = hiera('mysql')
	$mysql_password="P@ssw0rd"
}

class mysql::setpassword{
exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$mysql_password status",
    path => ["/bin", "/usr/bin"],
    command => "mysqladmin -uroot password $mysql_password",
    require => Service["mysql"],
  }
}



