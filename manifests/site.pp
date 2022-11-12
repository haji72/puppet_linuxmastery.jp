# /home/administrator/code/environments/production/manifests/site.pp
# define node
node 'vm01.linuxmastery.jp' {
  include base
  include webapp
}

node 'vm02.linuxmastery.jp' {
  include base
  include webapp
}

node 'vm03.linuxmastery.jp' {
  include base
  include fortunecow::install
  include fortunecow::motd
}

node default {
  notify { 'default_message':
    message => "===== default =====\n",
  }
}
