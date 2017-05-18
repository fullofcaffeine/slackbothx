package js.npm.winston.transports;

@:native('transports.File')
extern class File
implements npm.Package.RequireNamespace<"winston", "^2.2.0">
{
	@:overload(function() : Void {})
	public function new(options : {}) : Void;
}
