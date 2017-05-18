package js.npm.sequelize;


/**
 * DataTypes
 * @author TiagoLr
 */
@:native('DataTypes')
extern
class DataTypes {
	/**
	 * A variable length string. Default length 255
	 */
	static public inline function STRING(?length:Int, ?binary:Bool):DataTypes {
		return untyped Sequelize['STRING'](length, binary);
	}
	/**
	 * * A fixed length string. Default length 255
	 */
	static public inline function CHAR(?length:Int, ?binary:Bool):DataTypes {
		return untyped Sequelize['CHAR'](length, binary);
	}
	/**
	 * An unlimited length text column
	 */
	static public inline function TEXT(?options:{}):DataTypes {
		return untyped Sequelize['TEXT'](options);
	}
	/**
	 * A 32 bit integer. 
	 * Available properties: `length:Int`, `unsigned:Bool`, `zerofill:Bool`
	 */
	static public inline function INTEGER(?options:{}):DataTypes {
		return untyped Sequelize['INTEGER'](options);
	}
	/**
	 * A 64 bit integer. 
	 * Available properties: `length:Int`, `unsigned:Bool`, `zerofill:Bool`
	 */
	static public inline function BIGINT(?options:{}):DataTypes {
		return untyped Sequelize['BIGINT'](options);
	}   		
	/**
	 * Floating point number. 
	 * Accepts one or two arguments for precision.
	 * Available properties: `length:Int` `unsigned:Bool`, `zerofill:Bool`
	 */
	static public inline function FLOAT(?length:Int, ?decimals:Int, ?options:{}):DataTypes {
		return untyped Sequelize['FLOAT'](length, decimals, options);
	}	
	/**
	 * Decimal number. 
	 * Accepts one or two arguments for precision. 
	 * Available properties: `length:Int`, `unsigned:Bool`, `zerofill:Bool`
	 */
	static public inline function DECIMAL(precision:Int, scale:Int, ?options:{}):DataTypes {
		return untyped Sequelize['DECIMAL'](precision, scale, options);
	}
	/**
	 * A boolean / tinyint column, depending on dialect
	 */
	static public inline function BOOLEAN():DataTypes {
		return untyped Sequelize['BOOLEAN']();
	} 		
	/**
	 * A time column
	 */
	static public inline function TIME():DataTypes {
		return untyped Sequelize['TIME']();
	}
	/**
	 * A datetime column
	 */
	static public inline function DATE():DataTypes {
		return untyped Sequelize['DATE']();
	}
	/**
	 * A date only column
	 */
	static public inline function DATEONLY():DataTypes {
		return untyped Sequelize['DATEONLY']();
	}
	/**
	 * A key / value column. Only available in postgres.
	 */
	static public inline function HSTORE():DataTypes {
		return untyped Sequelize['HSTORE']();
	}
	/**
	 * A JSON string column. Only available in postgres.
	 */
	static public inline function JSON():DataTypes {
		return untyped Sequelize['JSON']();
	}		
	/**
	 * A pre-processed JSON data column. Only available in postgres.
	 */
	static public inline function JSONB():DataTypes {
		return untyped Sequelize['JSONB']();
	}
	/**
	 * A default value of the current timestamp
	 */
	static public inline function NOW():DataTypes {
		return untyped Sequelize['NOW']();
	}
	/**
	 * Binary storage. Available lengths: `tiny`, `medium`, `long`
	 */
	static public inline function BLOB(?length:String):DataTypes {
		return untyped Sequelize['BLOB'](length);
	}
	/**
	* Range types are data types representing a range of values of some element type (called the range's subtype).
	* Only available in postgres.
	* See {@link http://www.postgresql.org/docs/9.4/static/rangetypes.html|Postgres documentation} for more details
	*/
	static public inline function RANGE(?subtype:Dynamic):DataTypes {
		return untyped Sequelize['RANGE'](subtype);
	}
	/**
	 * A column storing a unique univeral identifier. Use with `UUIDV1` or `UUIDV4` for default values.
	 */
	static public inline function UUID():DataTypes {
		return untyped Sequelize['UUID']();
	}
	/**
	 * A default unique universal identifier generated following the UUID v1 standard
	 */
	static public inline function UUIDV1():DataTypes {
		return untyped Sequelize['UUIDV1']();
	}
	/**
	 * A default unique universal identifier generated following the UUID v2 standard
	 */
	static public inline function UUIDV4():DataTypes {
		return untyped Sequelize['UUIDV4']();
	}
	/**
	 * A virtual value that is not stored in the DB. This could for example be useful if you want to provide a default value in your model that is returned to the user but not stored in the DB.
	 */
	static public inline function VIRTUAL():DataTypes {
		return untyped Sequelize['VIRTUAL']();
	}
	/**
	 * An enumeration. `DataTypes.ENUM('value', 'another value')`.
	 */
	static public inline function ENUM(?values:Array<String>):DataTypes {
		return untyped Sequelize['TIME'](values);
	}		
	/**
	 * An array of `type`, e.g. `DataTypes.ARRAY(DataTypes.DECIMAL)`. Only available in postgres.
	 */
	static public inline function ARRAY(type:String):DataTypes {
		return untyped Sequelize['ARRAY'](type);
	}	
	
}