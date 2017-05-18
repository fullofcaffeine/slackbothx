package test.support;

extern class T implements Dynamic {
  // true is reserved for Hae, so we need to explicitely define and override true as isTrue
  // the others can be used as is for now without a type definition
  @:native('true')
  public function isTrue(val:Dynamic):Bool;

}
