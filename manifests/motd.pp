# /home/administrator/code/environments/production/manifests/motd.pp
# view motd
class motd {
  file { '/etc/motd':
    ensure => file,
    owner => 'root',
    content => "\n
      Hostname    : ${::fqdn}
      IP Address  : ${::ipaddress}\n",
  }
}
