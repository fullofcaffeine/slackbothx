package dialogs;

import js.Promise;
import xene.Dialog;

using helpers.StripIndent.StripIndentExtender;

class Default extends Dialog {
  static var isDefault = true;
  var avengerOath = "
    > This is a dialog from the Haxe bot!
  ".stripIndent();

  public override function talk(): Promise<Dynamic> {
    return this.message(avengerOath);
  }
}
