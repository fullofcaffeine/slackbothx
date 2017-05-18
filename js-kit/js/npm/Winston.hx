package js.npm;

typedef WinstonOptions = {
	?level : String,
	?transports : Array<Dynamic>,
	?exitOnError : Bool,
	?levels : Dynamic,
	?colors : Dynamic
}

@:native('Logger')
extern class Winston
implements npm.Package.RequireNamespace<"winston", "^2.2.0">
implements Dynamic
{	
	@:overload(function() : Void {})
	public function new(options : WinstonOptions);

	public var transports(default, null) : Array<Dynamic>;
	public var level(default, default) : String;

	@:overload(function(level : String, message : String) : Void {})
	@:overload(function(level : String, message : String, metadata : {}) : Void {})
	@:overload(function(level : String, message : String, fmt1 : Dynamic, metadata : {}) : Void {})
	public function log(level : String, message : String, fmt1 : Dynamic, fmt2 : Dynamic, metadata : {}) : Void;
	
	@:overload(function(transport : Dynamic) : Void {})
	public function add(transport : Dynamic, options : {}) : Void;
	
	public function remove(transport : Dynamic) : Void;
	
	public function close() : Void;
	public function configure(options : WinstonOptions) : Void;
	
	public function setLevels(levels : {}) : Void;
}
