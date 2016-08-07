class mysql::service{
service{'mysql':
        enable=>true,
        ensure=>running,
        require=>Class['mysql::install'],
}
}


