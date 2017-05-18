package helpers;

@:jsRequire('strip-indent')
extern class StripIndent {
  @:selfCall public function new(v:String);
}

class StripIndentExtender {
  static public function stripIndent(v: String) {
    return new StripIndent(v);
  }
}
