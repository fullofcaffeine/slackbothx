package js.npm.winston.transports;

import js.node.events.EventEmitter;

typedef PapertrailOptions = {
	host: String,
	port: Int,

	?disableTls : Bool,
	?level : String,
	?hostname : String,
	?program : String,
	?facility : String,
	?logFormat : String -> String -> String,
	?colorize : Bool,
	?inlineMeta : Bool,
	?handleExceptions : Bool,

	?attemptsBeforeDecay : Int,
	?maximumAttempts : Int,
	?connectionDelay : Int,
	?maxDelayBetweenReconnection : Int,
	?maxBufferSize : Int	
}

extern class Papertrail extends EventEmitter<Papertrail>
implements npm.Package.RequireNamespace<"winston-papertrail", "^1.0.2">
{
	public function new(options : PapertrailOptions) : Void;
}
