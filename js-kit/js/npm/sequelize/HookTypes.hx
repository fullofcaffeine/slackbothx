js.npm.sequelize;

/**
 * HookTypes
 * @author TiagoLr
 */
@:enum abstract HookTypes(String) {
	var BEFORE_VALIDATE = "beforeValidate";
	var AFTER_VALIDATE = "afterValidate";
	var BEFORE_CREATE = "beforeCreate";
	var AFTER_CREATE = "afterCreate";
	var BEFORE_DESTROY = "beforeDestroy";
	var AFTER_DESTROY = "afterDestroy";
	var BEFORE_UPDATE = "beforeUpdate";
	var AFTER_UPDATE = "afterUpdate";
	var BEFORE_BULK_CREATE = "beforeBulkCreate";
	var AFTER_BULK_CREATE = "afterBulkCreate";
	var BEFORE_BULK_DESTROY = "beforeBulkDestroy";
	var AFTER_BULK_DESTROY = "afterBulkDestroy";
	var BEFORE_BULK_UPDATE = "beforeBulkUpdate";
	var AFTER_BULK_UPDATE = "afterBulkUpdate";
	var BEFORE_FIND = "beforeFind";
	var BEFORE_FIND_AFTER_EXPAND_INCLUDE_ALL = "beforeFindAfterExpandIncludeAll";
	var BEFORE_FIND_AFTER_OPTIONS = "beforeFindAfterOptions";
	var AFTER_FIND = "afterFind";
	var BEFORE_DEFINE = "beforeDefine";
	var AFTER_DEFINE = "afterDefine";
	var BEFORE_INIT = "beforeInit";
	var AFTER_INIT = "afterInit";
}