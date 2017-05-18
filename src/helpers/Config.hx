package helpers;

@:jsRequire('config')
extern class Config {
  static function get(key: String): String;
}
