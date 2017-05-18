package js.npm.arangojs;

import js.support.Either;
import js.support.Either.Either3;
#if !browser
import js.node.http.Agent;
#end

typedef DatabaseOptions = {
	?url : String,
	?databaseName : String,
	?arangoVersion : Int,
	?headers : { },
	#if !browser
	?agent : Agent,
	#else
	?agent : Dynamic,
	#end
	?agentOptions : {},
	?promise : Dynamic
}

typedef UserOptions = {
	username : String,
	?passwd : String,
	?active : Bool,
	?extra : {}
}

typedef ListCollectionsResult = {
	id : Int,
	name : String,
	isSystem : Bool,
	status : Int,
	type : Int
}

typedef Aqb = Either<String, { function toAQL() : String; }>;

#if browser
@:native("arangojs.Database")
#end
extern class Database
#if !browser
implements npm.Package.RequireNamespace<"arangojs", "^5.0.2">
#end
{
	@:overload(function() : Database {})
	@:overload(function(config : String) : Database {})
	public function new(config : DatabaseOptions);

	// Manipulating databases

	public function useDatabase(databaseName : String) : Database;
	@:overload(function(databaseName : String, cb : ArangoCallback<Dynamic>) : Void {})
	public function createDatabase(databaseName : String, users : Array<UserOptions>, cb : ArangoCallback<Dynamic>) : Void;
	public function get(cb : ArangoCallback<Dynamic>) : Void;
	public function listDatabases(cb : ArangoCallback<Array<String>>) : Void;
	public function listUserDatabases(cb : ArangoCallback<Array<String>>) : Void;
	public function dropDatabase(databaseName : String, cb : ArangoCallback<Dynamic>) : Void;
	@:overload(function(cb : ArangoCallback<Dynamic>) : Void {})
	public function truncate(excludeSystem : Bool, cb : ArangoCallback<Dynamic>) : Void;

	// Accessing collections
	
	public function collection(collectionName : String) : DocumentCollection;
	public function edgeCollection(collectionName : String) : EdgeCollection;
	@:overload(function(cb : ArangoCallback<Array<Dynamic>>) : Void {})
	public function listCollections(excludeSystem : Bool, cb : ArangoCallback<Array<ListCollectionsResult>>) : Void;
	@:overload(function(cb : ArangoCallback<Array<Collection>>) : Void {})
	public function collections(excludeSystem : Bool, cb : ArangoCallback<Array<Collection>>) : Void;
	
	// Accessing graphs

	public function graph(graphName : String) : Graph;
	public function listGraphs(cb : ArangoCallback<Array<Dynamic>>) : Void;
	public function graphs(cb : ArangoCallback<Array<Graph>>) : Void;

	// Transactions
	
	@:overload(function(collections : Either3<String, {read: Array<String>, write: Array<String>}, Array<String>>, action : String, cb : ArangoCallback<Dynamic>) : Void {})
	@:overload(function(collections : Either3<String, {read: Array<String>, write: Array<String>}, Array<String>>, action : String, params : Array<Dynamic>, cb : ArangoCallback<Dynamic>) : Void {})
	public function transaction(collections : Either3<String, {read: Array<String>, write: Array<String>}, Array<String>>, action : String, params : Array<Dynamic>, lockTimeout : Int, cb : ArangoCallback<Dynamic>) : Void;
	
	// Queries

	@:overload(function<T>(query : { query: Either<String, Aqb>, ?bindVars : {} }, opts : {}, cb : ArangoCallback<Cursor<T>>) : Void {})
	@:overload(function<T>(query : { query: Either<String, Aqb>, ?bindVars : {} }, cb : ArangoCallback<Cursor<T>>) : Void {})
	@:overload(function<T>(query : Either<String, Aqb>, bindVars : {}, opts : {}, cb : ArangoCallback<Cursor<T>>) : Void {})
	@:overload(function<T>(query : Either<String, Aqb>, bindVars : {}, cb : ArangoCallback<Cursor<T>>) : Void {})
	public function query<T>(query : Either<String, Aqb>, cb : ArangoCallback<Cursor<T>>) : Void;
	
	// macro for aqlQuery: https://github.com/arangodb/arangojs#aql

	// Managing AQL user functions
	
	public function listFunctions(cb : ArangoCallback<Array<Dynamic>>) : Void;
	public function createFunction(name : String, code : String, cb : ArangoCallback<Dynamic>) : Void;
	@:overload(function(name : String, cb : ArangoCallback<Dynamic>) : Void {})
	public function dropFunction(name : String, group : Bool, cb : ArangoCallback<Dynamic>) : Void;
	
	// Arbitrary HTTP routes
	
	@:overload(function() : Route {})
	@:overload(function(headers : {}) : Route {})
	@:overload(function(path : String) : Route {})
	public function route(path : String, headers : {}) : Route;
}
