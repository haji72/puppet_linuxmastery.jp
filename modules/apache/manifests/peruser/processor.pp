# @summary
#   Enables the `Peruser` module for FreeBSD only.
#
# @api private
define apache::peruser::processor (
  String $user,
  String $group,
  Optional[String] $file = undef,
) {
  if ! $file {
    $filename = "${name}.conf"
  } else {
    $filename = $file
  }
  file { "${apache::mod_dir}/peruser/processors/${filename}":
    ensure  => file,
    content => "Processor ${user} ${group}\n",
    require => File["${apache::mod_dir}/peruser/processors"],
    notify  => Class['apache::service'],
  }
}
