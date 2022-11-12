# /home/administrator/code/environments/production/modules/base/manifests/init.pp
# base manifest
class base {

  include base::install
  include base::vim
  include base::ssh

  class { 'apt':
    update => {
      frequency => 'daily',
      loglevel => 'info',
    },
  }

  notify {  "===== base =====\n": }
}
