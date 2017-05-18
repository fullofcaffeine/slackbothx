package xene;

import js.Promise;

@:jsRequire('@xene/core', 'Dialog')
// :keepSub is necessary because otherwise DCE will not include the supercall because
// it doesn't see this class being instantiated in the Haxe code (it's instantiated by Xene)
@:keepSub extern class Dialog {
  public static var match: String -> Bool;

  public function new(
      ?bot: Dynamic,
      ?chat: String
  );

  public function message(message: Dynamic):Promise<Dynamic>;
  public function talk(): Promise<Dynamic>;
}
