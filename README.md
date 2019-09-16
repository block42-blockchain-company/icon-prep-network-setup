# ICON P-Rep Network Setup

<div>
  <a href="https://zicon.tracker.solidwallet.io">
    <img src="https://img.shields.io/badge/network-testnet 3-brightgreen.svg" alt="TestNet 3 (PAGODA)" />
  </a>
  <a href="#">
    <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License" />
  </a>
</div>

<br>

![network-setup](https://user-images.githubusercontent.com/6087393/64905914-e552bf80-d6de-11e9-9bb0-f2bdeec08259.png)

## Network Setup

At the moment there is only a single host machine (protected by a firewall) running in the cloud. On this machine both the P-Rep as well as the NGINX (Reverse Proxy) are running as a docker container. All the traffic enters the NGINX at port 7100 and 9000, gets rate limited + whitelisted and then forwarded to the P-Rep.

### Whitelist

Currently there is only a whitelist for the API in use, the gRPC service is not yet protected as it is kind of unclear where to get a proper whitelist from. The first try for automating the whitelist update can be found in the `/nginx/access_lists/update_grpc_whitelist.sh` script.

### WebSocket

Install `wscat` in order to test websocket capabilities:

```
npm install -g wscat
```

Try to open a connection to your P-Rep's websocket:

```
wscat -c ws://<IP ADDRESS>:9000/api/ws/icon_dex
```

Check for a `connected` response. If you receive any error, your websocket is not working right.

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
