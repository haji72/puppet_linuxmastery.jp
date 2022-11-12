# @summary
#   Installs and configures `mod_info`.
# 
# @param allow_from
#   Allowlist of IPv4 or IPv6 addresses or ranges that can access the info path.
# 
# @param apache_version
#   Version of Apache to install module on.
# 
# @param restrict_access
#   Toggles whether to restrict access to info path. If `false`, the `allow_from` allowlist is ignored and any IP address can
#   access the info path.
# 
# @param info_path
#   Path on server to file containing server configuration information.
# 
# @see https://httpd.apache.org/docs/current/mod/mod_info.html for additional documentation.
#
class apache::mod::info (
  Array[Stdlib::IP::Address] $allow_from = ['127.0.0.1', '::1'],
  Optional[String] $apache_version       = undef,
  Boolean $restrict_access               = true,
  Stdlib::Unixpath $info_path            = '/server-info',
) {
  include apache
  $_apache_version = pick($apache_version, $apache::apache_version)

  if $facts['os']['family'] == 'Suse' {
    if defined(Class['apache::mod::worker']) {
      $suse_path = '/usr/lib64/apache2-worker'
    } else {
      $suse_path = '/usr/lib64/apache2-prefork'
    }
    ::apache::mod { 'info':
      lib_path => $suse_path,
    }
  } else {
    ::apache::mod { 'info': }
  }

  # Template uses $allow_from, $_apache_version
  file { 'info.conf':
    ensure  => file,
    path    => "${apache::mod_dir}/info.conf",
    mode    => $apache::file_mode,
    content => template('apache/mod/info.conf.erb'),
    require => Exec["mkdir ${apache::mod_dir}"],
    before  => File[$apache::mod_dir],
    notify  => Class['apache::service'],
  }
}
