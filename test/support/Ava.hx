package test.support;

import tink.await.*;

@:jsRequire('ava')
extern class Ava {
  @:selfCall static public function test(title: String, func: T -> Void, ?opts: Dynamic):Void;
}
