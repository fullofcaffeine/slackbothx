package commands;

import command.*;
import tink.await.*;
import js.Promise;

@:await class DummyCommand 
  implements Performable<String>
  implements Reversible {

  public var value(default, null):String;
  var previousValue:String;

  public function new(val: String) {
    this.value = val;
  }

  //Uses tink's Future, which is API for promises
  @:async public function perform():Bool {
    return fetchNewValue();
  }

  //Regular promise
  public function performPromised():Promise<Bool> {
    return new Promise(function(resolve, reject) {
      return resolve(true);
    });
  }

  public function rollback():Bool {
    if (this.value == this.previousValue)
      throw "Cannot rollback";
    this.value = this.previousValue;
    return true;
  }

  private function fetchNewValue():Bool {
    this.previousValue = value;
    this.value = 'Kawabanga';
    return true;
  }
}
