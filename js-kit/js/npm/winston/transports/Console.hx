package js.npm.winston.transports;

@:native('transports.Console')
extern class Console
implements npm.Package.RequireNamespace<"winston", "^2.2.0">
{
	@:overload(function() : Void {})
	public function new(options : {}) : Void;
}
