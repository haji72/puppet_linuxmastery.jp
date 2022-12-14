# @summary
#   Helper used by `apache::default_mods`
#
# @api private
define apache::default_mods::load (String $module = $title) {
  if defined("apache::mod::${module}") {
    include "::apache::mod::${module}"
  } else {
    ::apache::mod { $module: }
  }
}
