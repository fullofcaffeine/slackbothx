package js.npm.arangojs;

extern class ArangoError extends js.Error {
	public var errorNum(default, null) : Int;
	public var code(default, null) : Int;
}
