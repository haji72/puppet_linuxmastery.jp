# /home/administrator/code/enviroments/production/modules/fortunecow/manifests/init.pp
# fortunecow manifest
class fortunecow {

  include fortunecow::install
  include fortunecow::motd

  Class['fortunecow::install'] -> Class['fortunecow::motd']

}
