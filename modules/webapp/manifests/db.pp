# /home/administrator/code/enviroments/production/modules/webapp/manifests/db.pp
# database
class webapp::db {

  $wp_root_password = lookup('wp_root_password')
  $wp_db_name = lookup('wp_db_name')
  $wp_user = lookup('wp_user')
  $wp_user_password = lookup('wp_user_password')

  class { 'mysql::server':
    root_password => "${wp_root_password}",
    restart => true,
  }

  mysql::db { "${wp_db_name}":
    user => "${wp_user}",
    password => "${wp_user_password}",
    grant => ['All'],
  }
}
