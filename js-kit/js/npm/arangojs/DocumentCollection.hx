package js.npm.arangojs;
import js.npm.arangojs.Collection.CollectionMetadata;

extern class DocumentCollection extends Collection
{
	public function document(documentHandle : String, cb : ArangoCallback<Dynamic>) : Void;
	public function save(data : Dynamic, cb : ArangoCallback<CollectionMetadata>) : Void;
}
