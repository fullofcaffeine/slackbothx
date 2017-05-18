package js.npm.winston.transports;

extern class Mail
implements npm.Package.RequireNamespace<"winston-mail", "^1.2.0">
{
	@:overload(function() : Void {})
	public function new(options : {}) : Void;
}
