# /home/administrator/code/environments/production/modules/fortunecow/manifests/install.pp
# fortunecowのモジュールに必要なパッケージのインストール
class fortunecow::install {

  package { ['fortune', 'cowsay'] }

}
