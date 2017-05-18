package xene;

import js.Promise;

@:jsRequire('@xene/slack', 'default')
extern class SlackBot {
  public function new(options: {
      ?id: String,
      botToken: String,
      ?appToken: String,
      dialogs: Array<Dynamic>, // Create enum
      ?commands: Array<Dynamic>, // Create enum
      ?dispatcher: Dynamic // Create proper extern type
  });

  var channels: Dynamic;
  var botId: String;

  public function getUser(id: String):Dynamic {}
  public function formatMessage(message: Dynamic, object: Dynamic):Dynamic {}
  public function sendMessage(chat: String, message: Dynamic, ?options: Dynamic):Promise<Dynamic>;
}


