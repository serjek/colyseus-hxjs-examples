# colyseus-hxjs-examples

Server examples for [colyseus-hxjs](https://github.com/serjek/colyseus-hxjs) -- Haxe externs for Colyseus v0.17.

## Requirements

- Haxe 4.x+
- [lix](https://github.com/lix-pm/lix.client) dependency manager (`npm i lix -g`)
- Node.js

## Setup & run

```bash
lix download
haxe server.hxml          # compile to bin/server/index.js
cd bin/server && npm i     # install node deps (first time only)
node index.js              # start server on port 2567
```

The server starts with Colyseus playground at `http://localhost:2567/`.

## Example rooms

| Room | What it demonstrates |
|---|---|
| **ChatRoom** | Basic messaging, `broadcast`, `onMessage` callback |
| **StateHandlerRoom** | `MapSchema` state, player CRUD, `allowReconnection` on drop |
| **ViewRoom** | `@:view` decorators, `StateView` per-client, conditional view grant based on score threshold |
| **NotAllowedRoom** | Async `onJoin` rejection with error code |

## Project structure

- `src/MainServer.hx` -- entry point, `defineServer` with room registration and express routes
- `src/server/rooms/` -- room implementations
- `server.hxml` -- Haxe build config
- `bin/server/` -- compiled output + node_modules
- `my-server/` -- reference JS Colyseus server used during extern development
