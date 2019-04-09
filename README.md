# colyseus-hxjs-examples
Examples for [colyseus-hxjs](https://github.com/serjek/colyseus-hxjs) library ported from official [Colyseus examples](https://github.com/colyseus/colyseus-examples)

### Compile server example
```
lix download
haxe server.hxml
cd bin/server
yarn
node index.js
```
- Note you should have lix installed:
`npm i lix -g`

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