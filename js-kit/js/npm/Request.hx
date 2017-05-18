package js.npm;

import js.node.http.ServerResponse;
import js.node.http.IncomingMessage;
import js.node.stream.Readable;
import js.support.Either;
import js.support.Either.Either3;
import js.node.Buffer;
import js.Error;
import js.node.Url;

typedef RequestCallback2 = Error -> Void;
typedef RequestCallback1 = Error -> ServerResponse -> Void;
typedef RequestCallback = Error -> ServerResponse -> Either<String, Buffer> -> Void;

typedef EitherCallback = Either3<RequestCallback, RequestCallback1, RequestCallback2>;

typedef RequestOptions = {
	?uri : Either<String, Url>,
	?url : Either<String, Url>,
	?baseUrl : Dynamic,
	?method : Dynamic,
	?headers : Dynamic,
	?qs : Dynamic,
	?qsParseOptions : Dynamic,
	?qsStringifyOptions : Dynamic,
	?useQuerystring : Dynamic,
	?body : Dynamic,
	?form : Dynamic,
	?formData : Dynamic,
	?multipart : Dynamic,
	?preambleCRLF : Dynamic,
	?postambleCRLF : Dynamic,
	?json : Dynamic,
	?jsonReviver : Dynamic,
	?jsonReplacer : Dynamic,
	?auth : Dynamic,
	?oauth : Dynamic,
	?hawk : Dynamic,
	?aws : Dynamic,
	?httpSignature : Dynamic,
	?followRedirect : Dynamic,
	?followAllRedirects : Dynamic,
	?maxRedirects : Dynamic,
	?removeRefererHeader : Dynamic,
	?encoding : Dynamic,
	?gzip : Dynamic,
	?jar : Dynamic,
	?agent : Dynamic,
	?agentClass : Dynamic,
	?agentOptions : Dynamic,
	?forever : Dynamic,
	?pool : Dynamic,
	?timeout : Dynamic,
	?localAddress : Dynamic,
	?proxy : Dynamic,
	?strictSSL : Dynamic,
	?tunnel : Dynamic,
	?proxyHeaderWhiteList : Dynamic,
	?proxyHeaderExclusiveList : Dynamic,
	?time : Dynamic,
	?har : Dynamic,
	?callback : Error -> IncomingMessage -> Either<String, Buffer>
}

extern class Request extends Readable<Request>
implements npm.Package.Require<"request", "^2.55.0">
{
	public static inline function construct() : Request {
		untyped return require('request');
	}

	public static function defaults(options : {}) : Request;

	public function put(options : Either<RequestOptions, String>, ?callback : EitherCallback) : Request;
	public function patch(options : Either<RequestOptions, String>, ?callback : EitherCallback) : Request;
	public function post(options : Either<RequestOptions, String>, ?callback : EitherCallback) : Request;
	public function head(options : Either<RequestOptions, String>, ?callback : EitherCallback) : Request;
	public function del(options : Either<RequestOptions, String>, ?callback : EitherCallback) : Request;
	public function get(options : Either<RequestOptions, String>, ?callback : EitherCallback) : Request;

	public function cookie(keyValue : String) : Dynamic;
	public static function jar() : Dynamic;

	public function form(formValues : {}) : Request;

	public static var debug : Bool;
}
