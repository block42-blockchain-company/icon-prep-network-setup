# ICON P-Rep Network Setup

<div>
  <a href="https://zicon.tracker.solidwallet.io">
    <img src="https://img.shields.io/badge/network-mainnet-brightgreen.svg" alt="MainNet" />
  </a>
  <a href="#">
    <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License" />
  </a>
</div>

<br>

![network-setup](https://user-images.githubusercontent.com/6087393/67687644-edb63f80-f998-11e9-9a82-9cea4b2ce431.png)

## Network Setup

The setup consists of two machines: the `P-Rep` and a `Citizen` node.
Both machines use the `prep-node` docker image. Basically the only difference is that the P-Rep uses the keystore which were used to register on the network. The Citizen node uses a random keystore (as it does not sign blocks). Both nodes have a NGINX instance (acting as a reverse proxy) in front of the main node application which, for now, only rate limits the incoming traffic. The P-Rep is also connected to the Citizen node (via `ENDPOINT_URL` in the P-Rep's `docker-compose.yml`) and uses it to synchronize the blockchain.

### NGINX Whitelist

In the future the NGINX instances will also make use of a whitelist to limit the access to the gRPC service (Port 7100) only to other P-Reps. The `/nginx/access_lists/update_grpc_whitelist.sh` script will constantly refresh the IP address whitelist and reload the NGINX.

### Testing WebSocket

Install `wscat` in order to test websocket capabilities:

```
npm install -g wscat
```

Try to open a connection to your P-Rep's websocket:

```
wscat -c ws://<IP ADDRESS>:9000/api/ws/icon_dex
```

Check for a `connected` response. If you receive any error, your websocket is not working right.

### Monitoring & Notification

#### Grafana

We use `Grafana` to track and visualize our container metrics. Make sure to check out: [dockprom](https://github.com/stefanprodan/dockprom)

![grafana](https://user-images.githubusercontent.com/6087393/67688979-f4de4d00-f99a-11e9-9f59-e4787db17214.png)


#### updown.io

We use [uptime.io](https://updown.io/r/9GrXa) to track our P-Rep's uptime and get notified if something is wrong.

![uptime](https://user-images.githubusercontent.com/6087393/67688949-eb54e500-f99a-11e9-86bd-83ef98c26562.png)

## Licence

This project is licensed under the MIT license. For more information see LICENSE.md.

```
The MIT License

Copyright (c) 2019 block42 Blockchain Company GmbH

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
