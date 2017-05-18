package command;

interface Performable<T> {

  private var value(default, null):T;
  private var previousValue:T;

  public function perform():tink.core.Future<tink.core.Outcome<Bool, Dynamic>>;
}
