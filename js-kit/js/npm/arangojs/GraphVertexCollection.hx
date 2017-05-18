package js.npm.arangojs;
import js.support.Either;

extern class GraphVertexCollection extends Collection
{
	public function vertex(documentHandle : Either<String, {}>, cb : ArangoCallback<Dynamic>) : Void;
	public function save(data : {}, cb : ArangoCallback<Dynamic>) : Void;
}
