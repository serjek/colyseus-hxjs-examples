# colyseus-hxjs-examples
Examples for [colyseus-hxjs](https://github.com/serjek/colyseus-hxjs) library ported from official [Colyseus examples](https://github.com/colyseus/colyseus-examples)

- Note that since ES6 code is required you should use haxe no earlier than 4.0.0-rc.3
- Project is using [lix](https://github.com/lix-pm/lix.client) dependency manager.
To install lix globally use this command
`npm i lix -g`

### Compile server example
```
lix download
haxe server.hxml
cd bin/server
yarn
node index.js
```

### Run client(s) of your choice

Please note that these are only server side examples. You should take care of creating proper client yourself:
- Either compile and run client.hxml
```
haxe client.hxml
cd bin/client
yarn
node index.js
```
- Or use client provided in official [Colyseus examples](https://github.com/colyseus/colyseus-examples) at `/static` (don't forget to bundle client lib so that colyseus.js got created) 
