# Sample Haxe Slackbot in nodejs using Xene and Ava

An experiment on consuming TS and JS libraries from Haxe.

* Xene: https://github.com/dempfi/xene
* Ava: https://github.com/avajs/ava

# Why Haxe?

* Powerful type system, everything is an expression,  good balance between OOP/imperative and functional, see: https://haxe.org/manual/introduction-what-is-haxe.html, and read on;
* A bit more strict than TS, which provides for more sanity when working with larger codebases and teams;
* Strict but very flexible at the same time. Powerful metaprogramming through macros, see: https://haxe.org/manual/macro.html
* Very efficient js output by default, js output is also modifiable if needed, see: https://github.com/kevinresol/modular-js (although we won't need to do so);
* Very easy to integrate and consume javascript libraries;
* Potential to compile to other targets (C++, Python, etc), although we won't really use it I'd say :);
* Powerful libraries that support functional programming, see: https://github.com/fponticelli/thx.core (a better lodash for Haxe) and https://github.com/haxetink (tink_core and tink_lang).

# Todo
* Better type definitions for Xene (externs) - right now I'm using a lot of `Dynamic`, so the typing info is weak;
* I'm not even scratching the surface of Haxe capabilities here, so there's a lot of room for improvement!;
* Add a linter (there are some for Haxe, looking at the options now);
* Think about how to write tests, in Haxe, JS or TS? (Haxe classes can be consumed from plain js if needed).

# Misc
* The (haxe) source code is in the `haxe_src/` directory;
* *IF* needed, TS/JS can be used alongisde Haxe, although I see no real reason for that, but then TS and Babel would need to be included.

# Compiling and running

1. First, install Haxe: http://haxe.org/download/. Use vscode with https://github.com/vshaxe/vshaxe to start with. There also https://github.com/jdonaldson/vaxe for Vim.

2. Then install the required Haxe libraries:

```
haxelib install build.hxml
```

3. Setup your slack app and bot token as env vars (See the config/ dir);

4. Then compile and run:

```
haxe build.hxml && NODE_PATH=./dest node dest/src/app.js
```

You can also use `npm run start` to run the command above or `npm run watch` to run it eveytime a file changes.

Be sure to set the env vars defined in `config/custom-environment-variables.yml` before.
