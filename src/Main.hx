import js.npm.express.Middleware;
import js.npm.express.Request;
import js.npm.express.Response;
import xene.SlackBot;
import js.node.Process;
import js.Promise;
import tink.CoreApi.Surprise;
import tink.CoreApi.Future;
import tink.CoreApi.Noise;
import helpers.Config;

@:await class AvengerBot extends SlackBot {
  @:async public function send(chat: String, message: Dynamic, object: Dynamic): Noise {
    var formatted = this.formatMessage(message, object);
    if (new Process().env.get('NODE_ENV') == 'test') return Noise;
    try {
      return @:await Future.ofJsPromise(this.sendMessage(chat, formatted));
    } catch(e:Dynamic) {
      js.Lib.debug();
      @:await this.channels.invite(chat, this.botId);
      //
      return @:await Future.ofJsPromise(this.sendMessage(chat, formatted));
    }
  }
}

class Main {
  public static function main() {
    trace('Starting bot');
    var app:js.npm.express.Application = new js.npm.Express();
    var bot = new AvengerBot({
        botToken: Config.get('slack.botToken'),
        appToken: Config.get('slack.appToken'),
        dialogs: [dialogs.Default]
    });

    bot.sendMessage('@fullofcaffeine', 'Hello from Haxe bot!');

    // Express is here just as an example of how to use it from Haxe, not being used yet
    app.get("/some-endpoint", function(req:Request, res:Response) {
      res.send(200);
    });

    app.listen(3000);
  }
}
