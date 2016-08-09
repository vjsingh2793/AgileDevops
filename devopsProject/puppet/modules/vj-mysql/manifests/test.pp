class mysql::test{
if $mysql_values == undef {
  $mysql_values = hiera('mysql')
}
 notice($mysql_values["username"])

}
