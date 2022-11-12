# /home/administrator/code/enviroments/production/manifests/packages.pp
# package install
class packages {
  package { ['tree', 'wget', 'curl', 'unzip']: }
}
