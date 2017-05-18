package js.npm.arangojs;
import js.support.Either;

extern class EdgeCollection extends Collection
{
	public function edge(documentHandle : Either<String, {}>, cb : ArangoCallback<Dynamic>) : Void;
	@:overload(function(data : Dynamic, fromId : Either<String, {}>, toId : Either<String, {}>, cb : ArangoCallback<Dynamic>) : Void {})
	public function save(data : {_from: String, _to: String}, cb : ArangoCallback<Dynamic>) : Void;
	public function edges(documentHandle : Either<String, {}>, cb : ArangoCallback<Array<Dynamic>>) : Void;
	public function inEdges(documentHandle : Either<String, {}>, cb : ArangoCallback<Array<Dynamic>>) : Void;
	public function outEdges(documentHandle : Either<String, {}>, cb : ArangoCallback<Array<Dynamic>>) : Void;
	public function traversal(startVertex : Either<String, {}>, opts : {}, cb : ArangoCallback<Dynamic>) : Void;
}
