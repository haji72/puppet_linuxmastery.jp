# /home/administrator/code/envirnoments/production/modules/base/manifests/install.pp
# package install
class base::install {

  package { ['tree', 'curl', 'wget', 'unzip']: }

  notify { "===== base::install =====\n": }
}
