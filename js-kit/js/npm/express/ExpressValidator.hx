package js.npm.express;

@:native('express-validator')
extern class ExpressValidator
implements npm.Package.Require<"express-validator", "^2.10.0"> #if !haxe3,#end
implements Middleware
{
	public function new(?options: { } ) : Void;
	
	/**
	 * Check body params.
	 */
	public inline static function checkBody( req:Request , param:String, ?errorMsg:String ) : ValidationMethods {
		return untyped req.checkBody(param,errorMsg);
	}
	/**
	 * Check url params.
	 */
	public inline static function checkParams( req:Request , param:String, ?errorMsg:String ) : ValidationMethods {
		return untyped req.checkParams(param,errorMsg);
	}
	/**
	 * Check query string params.
	 */
	public inline static function checkQuery( req:Request , param:String, ?errorMsg:String ) : ValidationMethods {
		return untyped req.checkQuery(param,errorMsg);
	}
	/**
	 * Checks query string, body and url params.
	 */
	public inline static function assert( req:Request , param:String, ?errorMsg:String ) : ValidationMethods {
		return untyped req.assert(param,errorMsg);
	}
	/**
	 * Returns null if request has no validation errors, 
	 * otherwise returns a structure containing the errors and their respective message, parameter name and value.
	 */
	public inline static function validationErrors( req:Request, mapped:Bool = false ) :Array<Dynamic> {
		return untyped req.validationErrors(mapped);
	}
	
	public inline static function sanitize(req:Request, param:String):SanitizeMethods {
		return untyped req.sanitize(param);
	}
}

class ValidationMethods {
	public inline function notEmpty() : ValidationMethods { return untyped notEmpty(); }
	public inline function optional() : ValidationMethods { return untyped optional(); }
	public inline function equals(comparison:String) : ValidationMethods { return untyped equals(comparison); }
	public inline function contains(seed:String) : ValidationMethods { return untyped contains(seed); }
	public inline function matches(pattern:String, ?modifier:String) : ValidationMethods { return untyped matches(pattern, modifier); }
	public inline function isEmail(?options:Dynamic) : ValidationMethods { return untyped isEmail(options); }
	public inline function isURL(?options:Dynamic) : ValidationMethods { return untyped isURL(options); }
	public inline function isFDQN(?options:Dynamic) : ValidationMethods { return untyped isFDQN(options); }
	public inline function isIP(?version:Int) : ValidationMethods { return untyped isIP(version); }
	public inline function isAlpha() : ValidationMethods { return untyped isAlpha(); }
	public inline function isNumeric() : ValidationMethods { return untyped isNumeric(); }
	public inline function isAlphaNumeric() : ValidationMethods { return untyped isAlphaNumeric(); }
	public inline function isBase64() : ValidationMethods { return untyped isBase64(); }
	public inline function isHexadecimal() : ValidationMethods { return untyped isHexadecimal(); }
	public inline function isHexColor() : ValidationMethods { return untyped isHexColor(); }
	public inline function isLowercase() : ValidationMethods { return untyped isLowercase(); }
	public inline function isUppercase() : ValidationMethods { return untyped isUppercase(); }
	public inline function isInt(?options:{?min:Int,?max:Int}) : ValidationMethods { return untyped isInt(options); }
	public inline function isFloat(?options:{?min:Float,?max:Float}) : ValidationMethods { return untyped isFloat(options); }
	public inline function isDivisibleBy(?number:Float) : ValidationMethods { return untyped isDivisibleBy(number); }
	public inline function isNull() : ValidationMethods { return untyped isNull(); }
	public inline function isLength(min:Int, ?max:Int) : ValidationMethods { return untyped isLength(min,max); }
	public inline function isByteLength(min:Int, ?max:Int) : ValidationMethods { return untyped isByteLength(min,max); }
	public inline function isUUID(?version:Dynamic) : ValidationMethods { return untyped isUUID(version); }
	public inline function isDate() : ValidationMethods { return untyped isDate(); }
	public inline function isAfter(?date:Date) : ValidationMethods { return untyped isAfter(date); }
	public inline function isBefore(?date:Date) : ValidationMethods { return untyped isBefore(date); }
	public inline function isIn(values:Array<String>) : ValidationMethods { return untyped isIn(values); }
	public inline function isCreditCard() : ValidationMethods { return untyped isCreditCard(); }
	public inline function isISIN() : ValidationMethods { return untyped isISIN(); }
	public inline function isISBN(?version:Int) : ValidationMethods { return untyped isISBN(version); }
	public inline function isMobilePhone(?locale:String) : ValidationMethods { return untyped isMobilePhone(locale); }
	public inline function isJSON() : ValidationMethods { return untyped isJSON(); }
	public inline function isMultibyte() : ValidationMethods { return untyped isMultibyte(); }
	public inline function isAscii() : ValidationMethods { return untyped isAscii(); }
	public inline function isFullWidth() : ValidationMethods { return untyped isFullWidth(); }
	public inline function isHalfWidth() : ValidationMethods { return untyped isHalfWidth(); }
	public inline function isVariableWidth() : ValidationMethods { return untyped isVariableWidth(); }
	public inline function isSurrogatePair() : ValidationMethods { return untyped isSurrogatePair(); }
	public inline function isMongold() : ValidationMethods { return untyped isMongold(); }
	public inline function isCurrency(?options:Dynamic) : ValidationMethods { return untyped isCurrency(options); }
}

class SanitizeMethods {
	public inline function toBoolean(strict:Bool = false) : SanitizeMethods { return untyped toBoolean(strict); }
	public inline function toInt(?base:Int) : SanitizeMethods { return untyped toInt(base); }
	public inline function toFloat() : SanitizeMethods { return untyped toFloat(); }
	public inline function toDate() : SanitizeMethods { return untyped toDate(); }
	public inline function trim(?customChars:String) : SanitizeMethods { return untyped trim(customChars); }
	public inline function ltrim(?customChars:String) : SanitizeMethods { return untyped ltrim(customChars); }
	public inline function rtrim(?customChars:String) : SanitizeMethods { return untyped rtrim(customChars); }
	public inline function escape() : SanitizeMethods { return untyped escape(); }
	public inline function stripLow(?keepNewLines:Bool) : SanitizeMethods { return untyped stripLow(keepNewLines); }
	public inline function whitelist(args:Array<String>) : SanitizeMethods { return untyped whitelist(args); }
	public inline function blacklist(args:Array<String>) : SanitizeMethods { return untyped blacklist(args); }
	public inline function normalizeEmail(?args:Dynamic) : SanitizeMethods { return untyped normalizeEmail(args); }
}