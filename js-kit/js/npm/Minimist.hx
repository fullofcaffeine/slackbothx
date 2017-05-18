package js.npm;

import js.support.Either.Either3;

typedef MinimistOptions = {
	// a string or array of strings argument names to always treat as strings
	?string : Array<String>,

	// a boolean, string or array of strings to always treat as booleans. if true will treat all double hyphenated arguments without equal signs as boolean (e.g. affects --foo, not -f or --foo=bar)
	?boolean : Either3<Bool, String, Array<String>>,

	// an object mapping string names to strings or arrays of string argument names to use as aliases
	?alias : Dynamic,

	// an object mapping string argument names to default values
	//?'default' : Dynamic,

	// when true, populate argv._ with everything after the first non-option
	?stopEarly : Bool,

	// when true, populate argv._ with everything before the -- and argv['--'] with everything after the --.
	//?'--' : Bool,

	// a function which is invoked with a command line parameter not defined in the opts configuration object. If the function returns false, the unknown option is not added to argv.
	?unknown : String -> Bool
}

extern class Minimist
implements npm.Package.Require<"minimist", "^1.2.0">
implements Dynamic
{
	@:selfCall
	@:overload(function(args : Array<String>) : Minimist {})
	public static function parseArgs(args : Array<String>, opts : MinimistOptions) : Minimist;

	@:overload(function() : Minimist {})
	public static inline function parseNodeArgs(opts : MinimistOptions) : Minimist {
		return opts == null 
			? Minimist.parseArgs(Node.process.argv.slice(2))
			: Minimist.parseArgs(Node.process.argv.slice(2), opts);
	}

	/**
	 * Contains all the arguments that didn't have an option associated with them.
	 */
	public var _(get, null) : Array<Dynamic>;
	@:noCompletion inline function get__() : Array<Dynamic> {
		return this._;
	}	
}
