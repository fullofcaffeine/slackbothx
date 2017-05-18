package js.npm.express;

typedef CsurfOptions = {
	?value : Request -> String,
	?cookie : Bool,
	?ignoreMethods : Array<String>
}

/**
 * Requires either a session middleware or cookie-parser to be initialized first.
 */
extern class Csurf
implements npm.Package.Require<"csurf", "^1.6.5"> #if !haxe3,#end
implements Middleware
{
	// Use in error handlers
	public inline static var errorCode = 'EBADCSRFTOKEN';

	public function new(?options : CsurfOptions) : Void;

	public inline static function csrfToken(req : Request) : String {
		return untyped req.csrfToken();
	}
}
