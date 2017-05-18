package js.npm.zombie;

import js.html.AnchorElement;
import js.html.BodyElement;
import js.html.Event;
import js.html.History;
import js.html.HTMLDocument;
import js.html.InputElement;
import js.html.Location;
import js.html.NodeList;
import js.html.Window;
import js.node.events.EventEmitter;
import js.html.XPathResult;
import js.html.Node;
#if (haxe_ver >= 3.2)
import js.html.DOMElement in Element;
#else
import js.html.Element;
#end
import js.node.stream.Writable.IWritable;
import js.support.Either;

typedef BrowserOptions = {
	@:optional var features : String;		// 'scripts no-css no-img iframe'
	@:optional var maxRedirects : Int;		// 5
	@:optional var proxy : String;			// null
	@:optional var silent : Bool;			// false
	@:optional var site : String;			// null
	@:optional var strictSSL : Bool;		// false
	@:optional var localAddress : String;	// '0.0.0.0'
	@:optional var userAgent : String;		// 'Mozilla/5.0 Chrome/10.0.613.0 Safari/534.15 Zombie.js/${VERSION}'
	@:optional var language : String;		// 'en-US'
	@:optional var waitDuration : Either<String, Int>;	// '5s'
	@:optional var runScripts : Bool;		// true
}

extern class BrowserResources implements ArrayAccess<{request: Dynamic, response: Null<Dynamic>, error: Null<Dynamic>}>
{
	public function dump(?output : IWritable) : Void;
	public function request<T, T2>(method : String, url : String, ?options : {}, ?callback : Void -> Void) : Null<Promise<T, T2>>;
}

extern class Browser extends EventEmitter<Browser>
{
	public static function localhost(source : Either<String, Int>, target : Int) : Void;

	public function new(?options : BrowserOptions) : Void;

	public var activeElement(default, null) : Element;
	public var body(default, null) : BodyElement;
	public var document(default, null) : HTMLDocument;
	public var error(default, null) : Error;
	public var history(default, null) : History;
	public var location(default, default) : Location;
	public var url(default, null) : String;
	public var window(default, null) : Window;

	public var assert : Assert;
	public var cookies : {dump: Dynamic -> Void};
	public var console : Dynamic;
	public var referrer : Null<String>;
	public var tabs : Array<Window>; // TODO
	public var pipeline : Dynamic;

	// Returns all resources loaded by currently open window.
	public var resources(default, null) : BrowserResources;
	// Get Request associated with currently open window
	public var request(default, null) : Dynamic;
	// Get Response associated with currently open window
	public var response(default, null) : Dynamic;
	// Get the status code of the response associated with this window
	public var status(default, null) : Int;
	public var statusCode(default, null) : Int;
	// Return true if last response had status code 200 .. 299
	public var success(default, null) : Bool;
	// Returns true if the last response followed a redirect
	public var redirected(default, null) : Bool;
	// Get the source HTML for the last response
	public var source(default, null) : String;

	public function debug() : Void;
	public function dump() : Void;

	@:overload(function(o1 : Dynamic, o2 : Dynamic, o3 : Dynamic, o4 : Dynamic, o5 : Dynamic) : Void { } )
	@:overload(function(o1 : Dynamic, o2 : Dynamic, o3 : Dynamic, o4 : Dynamic) : Void { } )
	@:overload(function(o1 : Dynamic, o2 : Dynamic, o3 : Dynamic) : Void { } )
	@:overload(function(o1 : Dynamic, o2 : Dynamic) : Void { } )
	@:overload(function(o1 : Dynamic, o2 : Dynamic) : Void { } )
	public function log(o1 : Dynamic) : Void;

	public function getCookie(identifier : Either<String, {}>, ?allProperties : Bool) : Either<String, {}>;
	public function deleteCookie(identifier : Either<String, {}>) : Bool;
	public function deleteCookies() : Void;
	public function loadCookies(serialized : String) : Void;
	public function saveCookies() : String;
	public function setCookie(nameOrOptions : Either<String, {}>, ?value : String) : Void;

	public function localStorage(host : String) : Dynamic;
	public function sessionStorage(host : String) : Dynamic;
	public function saveStorage() : String;
	public function loadStorage(serialized : String) : Void;

	public function attach(selector : String, filename : String) : Browser;
	public function back<T, T2>(?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function button<T : Element>(selector : String) : Null<T>;
	public function click<T, T2>(selector : String, ?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function clickLink<T, T2>(selector : String, ?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function check(selector : String) : Browser;
	public function choose(selector : String) : Browser;
	public function destroy() : Void;
	public function dispatchEvent(selector : String, event : Event<Dynamic>) : Bool;//TODO
	public function evaluate<T>(code : String, ?filename : String) : T;
	public function fetch<T, T2>(input : Dynamic, ?init : Dynamic) : Null<Promise<T, T2>>;
	public function field<T : Element>(selector : String) : Null<T>;
	public function fire<T, T2>(selector : String, eventName : String, ?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function focus(selector : String) : Browser;
	public function fill(selector : String, value : String) : Browser;
	public function hasFeature(name : String, ?defaultValue : Bool) : Bool;
	public function html(?selector : String, ?context : Node) : String;
	public function load<T, T2>(html : String, ?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function link(selector : String) : AnchorElement;
	public function loadHistory(serialized : String) : Void;
	public function open(options : { ?url: String, ?name : String, ?referrer : String }) : Window;
	public function pressButton<T, T2>(selector : String, ?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function queryAll<T : Node>(?selector : String, ?context : Node) : Array<T>;
	public function query<T : Node>(?selector : String, ?context : Node) : T;
	public function querySelector<T : Node>(selector : String) : Null<T>;
	public function querySelectorAll(selector : String) : NodeList;
	public function reload<T, T2>(?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function saveHistory() : String;
	public function select(selector : String, value : String) : Browser;
	public function selectOption(selector : String) : Browser;
	public function text(?selector : String, ?context : Node) : String;
	public function uncheck(selector : String) : Browser;
	public function unselect(selector : String, value : String) : Browser;
	public function unselectOption(selector : String) : Browser;
	@:overload(function<T, T2>(url : String, options : {}, ?callback : Void -> Void) : Null<Promise<T, T2>> {})
	public function visit<T, T2>(url : String, ?callback : Void -> Void) : Null<Promise<T, T2>>;
	@:overload(function<T, T2>(options : {}, ?callback : Void -> Void) : Null<Promise<T, T2>> {})
	public function wait<T, T2>(?callback : Void -> Void) : Null<Promise<T, T2>>;
	@:overload(function<T, T2>(options : {}, ?callback : Void -> Void) : Null<Promise<T, T2>> {})
	public function waitForServer<T, T2>(?callback : Void -> Void) : Null<Promise<T, T2>>;
	public function xpath(expression : String, ?context : Node) : XPathResult;
}
