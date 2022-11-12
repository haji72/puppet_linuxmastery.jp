# /home/administrator/code/environments/production/modules/base/manifests/ssh.pp
# SSH サーバ運営
class base::ssh {

  package { 'openssh-server':
    ensure => latest,
  }

  service { 'ssh':
    ensure => running,
    require => Package['openssh-server'],
  }

  file { '.ssh':
    ensure => 'direstory',
    name => '/home/administrator/.ssh',
    owner => 'administrator',
    group => 'administrator',
    mode => '700',
  }

  file { 'authorized_keys':
    name => '/home/administrator/.ssh/authorized_keys',
    owner => 'administrator',
    group => 'administrator',
    mode => '600',
    source => 'puppet:///modules/base/authorized_keys',
    require => File['.ssh'],
  }

  notify { "===== base::ssh =====\n": }

}
