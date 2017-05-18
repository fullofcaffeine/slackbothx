package js.npm.arangojs;

#if !browser
import js.node.http.IncomingMessage;
#end

extern class RouteResponse<T> 
#if !browser
extends IncomingMessage 
#end
{
	public var body : T;
	public var rawBody : String;
}
