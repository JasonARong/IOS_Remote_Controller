# Debug logs

Status: Historical diagnostic evidence only.

Canonical production contract: `docs/Production_Transport_Spec.md`.
Canonical motion conclusions: `docs/UDP_Motion_Findings.md`.
Canonical execution plan: `docs/tasks.md`.

These logs record experiments, failed attempts, intermediate hypotheses, and final POC evidence. Future development should not treat packet formats, constants, timings, or temporary debug fields in this file as implementation contracts.

## Log 16
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=19 17-25ms=2 25-34ms=0 34-50ms=1 >=50ms=0 max=41.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=149 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=69 4-8ms=74 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=403.3ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=119 17-25ms=1 25-34ms=0 34-50ms=0 >=50ms=0 max=20.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=501 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=216 4-8ms=284 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=59 coalescedSamples=334 motionEvents=332
  touch dt: 0-4ms=0 4-8ms=328 8-12ms=0 12-20ms=4 20-33ms=0 33-50ms=0 >=50ms=0 max=18.6ms
  coalesced dt: 0-4ms=0 4-8ms=328 8-12ms=1 12-20ms=4 20-33ms=0 33-50ms=0 >=50ms=0 max=18.6ms
  pointer: events=332 emitted=332
  speed: 0-50=0 50-150=3 150-300=24 300-600=235 600-1000=70 1000-1600=0 1600-2400=0 >=2400=0 max=884.5
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=18 3-3.5=102 >=3.5=212 max=4.8
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=2 16-32=9 32-64=20 64-127=188 >=127=437 max=686.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=31 17-25ms=1 25-34ms=30 34-50ms=13 >=50ms=1 max=53.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=324 subframes=324 capped=0 staleDrops=8 maxBatch=10 maxPending=2307
  UDP sender: ticks=500 emitted=324 emptyWhileActive=33
  UDP timer dt: 0-4ms=237 4-8ms=263 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=314 8-12ms=4 12-17ms=4 17-25ms=1 25-34ms=0 34-50ms=0 >=50ms=0 max=24.0ms
  dropped movement: events=8 absDx=586 absDy=929
📈 Movement diagnostics
  touch: callbacks=17 coalescedSamples=74 motionEvents=72
  touch dt: 0-4ms=0 4-8ms=69 8-12ms=0 12-20ms=1 20-33ms=1 33-50ms=1 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=69 8-12ms=0 12-20ms=1 20-33ms=1 33-50ms=1 >=50ms=0 max=45.8ms
  pointer: events=72 emitted=72
  speed: 0-50=1 50-150=12 150-300=8 300-600=26 600-1000=25 1000-1600=0 1600-2400=0 >=2400=0 max=851.2
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=10 2.5-3=10 3-3.5=11 >=3.5=41 max=4.7
  emit delta: 0-1=1 1-2=0 2-4=0 4-8=2 8-16=6 16-32=15 32-64=9 64-127=18 >=127=87 max=377.8
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=85 17-25ms=4 25-34ms=6 34-50ms=4 >=50ms=3 max=68.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=66 subframes=66 capped=0 staleDrops=3 maxBatch=9 maxPending=2908
  UDP sender: ticks=500 emitted=66 emptyWhileActive=16
  UDP timer dt: 0-4ms=256 4-8ms=244 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=59 8-12ms=0 12-17ms=2 17-25ms=2 25-34ms=0 34-50ms=0 >=50ms=0 max=20.2ms
  dropped movement: events=3 absDx=340 absDy=27
📈 Movement diagnostics
  touch: callbacks=28 coalescedSamples=97 motionEvents=92
  touch dt: 0-4ms=0 4-8ms=73 8-12ms=11 12-20ms=3 20-33ms=1 33-50ms=2 >=50ms=2 max=383.4ms
  coalesced dt: 0-4ms=0 4-8ms=74 8-12ms=12 12-20ms=3 20-33ms=1 33-50ms=2 >=50ms=2 max=383.4ms
  pointer: events=92 emitted=92
  speed: 0-50=30 50-150=7 150-300=10 300-600=14 600-1000=27 1000-1600=4 1600-2400=0 >=2400=0 max=1070.9
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=35 2.5-3=12 3-3.5=6 >=3.5=39 max=5.3
  emit delta: 0-1=5 1-2=0 2-4=0 4-8=51 8-16=5 16-32=5 32-64=11 64-127=15 >=127=76 max=1049.1
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=67 17-25ms=5 25-34ms=8 34-50ms=9 >=50ms=3 max=57.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=76 subframes=76 capped=1 staleDrops=6 maxBatch=10 maxPending=3372
  UDP sender: ticks=500 emitted=76 emptyWhileActive=64
  UDP timer dt: 0-4ms=261 4-8ms=240 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=61 8-12ms=1 12-17ms=3 17-25ms=4 25-34ms=2 34-50ms=0 >=50ms=0 max=28.0ms
  dropped movement: events=6 absDx=76 absDy=956
📈 Movement diagnostics
  touch: callbacks=21 coalescedSamples=112 motionEvents=110
  touch dt: 0-4ms=2 4-8ms=95 8-12ms=8 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=3 max=350.0ms
  coalesced dt: 0-4ms=2 4-8ms=97 8-12ms=8 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=3 max=350.0ms
  pointer: events=110 emitted=110
  speed: 0-50=73 50-150=9 150-300=9 300-600=19 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=491.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=80 2.5-3=9 3-3.5=13 >=3.5=8 max=3.7
  emit delta: 0-1=3 1-2=0 2-4=0 4-8=115 8-16=28 16-32=8 32-64=14 64-127=21 >=127=21 max=173.2
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=77 17-25ms=2 25-34ms=15 34-50ms=5 >=50ms=1 max=55.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=100 subframes=100 capped=0 staleDrops=3 maxBatch=10 maxPending=1489
  UDP sender: ticks=500 emitted=100 emptyWhileActive=43
  UDP timer dt: 0-4ms=254 4-8ms=246 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=89 8-12ms=1 12-17ms=3 17-25ms=2 25-34ms=1 34-50ms=0 >=50ms=0 max=28.0ms
  dropped movement: events=3 absDx=301 absDy=20

11:26:59.230 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
11:26:59.230 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
11:26:59.230 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
11:26:59.230 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
11:27:00.212 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
11:27:00.212 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
11:27:00.212 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
11:27:00.212 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
11:27:01.229 -> 📈 ESP smooth | UDP rawPkts=158/s datagrams=158/s subframes=158/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=156/s reportFails=0 staleDrops=0 lateMax=0.5ms
11:27:01.229 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=980/s
11:27:01.229 ->   HID interval ms <2=52 2-4=66 4-8=18 8-16=6 >=16=14
11:27:01.229 ->   emit delta:    0=0 1=0 2-4=3 4-8=7 8-16=59 16-32=71 32-64=15 64-127=1
11:27:02.216 -> 📈 ESP smooth | UDP rawPkts=143/s datagrams=143/s subframes=143/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=144/s reportFails=0 staleDrops=0 lateMax=0.5ms
11:27:02.216 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=986/s
11:27:02.216 ->   HID interval ms <2=36 2-4=65 4-8=28 8-16=7 >=16=8
11:27:02.216 ->   emit delta:    0=0 1=0 2-4=2 4-8=2 8-16=57 16-32=70 32-64=13 64-127=0
11:27:03.234 -> 📈 ESP smooth | UDP rawPkts=30/s datagrams=30/s subframes=30/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=30/s reportFails=0 staleDrops=0 lateMax=0.5ms
11:27:03.234 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=998/s
11:27:03.234 ->   HID interval ms <2=7 2-4=13 4-8=4 8-16=3 >=16=3
11:27:03.234 ->   emit delta:    0=0 1=1 2-4=7 4-8=3 8-16=3 16-32=6 32-64=10 64-127=0
11:27:04.216 -> 📈 ESP smooth | UDP rawPkts=35/s datagrams=35/s subframes=35/s malformed=0 queueMax=5 overflow=0 | HID ticks=500/s reports=35/s reportFails=0 staleDrops=0 lateMax=0.5ms
11:27:04.250 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=999/s
11:27:04.250 ->   HID interval ms <2=7 2-4=13 4-8=10 8-16=1 >=16=4
11:27:04.250 ->   emit delta:    0=0 1=1 2-4=1 4-8=1 8-16=7 16-32=20 32-64=5 64-127=0
11:27:05.235 -> 📈 ESP smooth | UDP rawPkts=39/s datagrams=39/s subframes=39/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=40/s reportFails=0 staleDrops=0 lateMax=0.5ms
11:27:05.235 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=997/s
11:27:05.235 ->   HID interval ms <2=9 2-4=18 4-8=6 8-16=1 >=16=6
11:27:05.235 ->   emit delta:    0=0 1=1 2-4=2 4-8=4 8-16=5 16-32=7 32-64=17 64-127=4
11:27:06.222 -> 📈 ESP smooth | UDP rawPkts=29/s datagrams=29/s subframes=29/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=21/s reportFails=0 staleDrops=0 lateMax=0.5ms
11:27:06.222 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=997/s
11:27:06.222 ->   HID interval ms <2=2 2-4=6 4-8=4 8-16=2 >=16=7
11:27:06.222 ->   emit delta:    0=0 1=19 2-4=0 4-8=2 8-16=0 16-32=0 32-64=0 64-127=0
11:27:07.241 -> 📈 ESP smooth | UDP rawPkts=93/s datagrams=93/s subframes=93/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=79/s reportFails=0 staleDrops=0 lateMax=0.5ms
11:27:07.241 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=993/s
11:27:07.241 ->   HID interval ms <2=22 2-4=28 4-8=15 8-16=3 >=16=11
11:27:07.242 ->   emit delta:    0=0 1=44 2-4=8 4-8=6 8-16=11 16-32=10 32-64=0 64-127=0
11:27:08.227 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
11:27:08.227 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s
11:27:08.227 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
11:27:08.227 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

## Log 15
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=8 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=1 max=1231.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=130 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=62 4-8ms=62 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=685.4ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=120 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=224 4-8ms=276 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=0 12-17ms=100 17-25ms=12 25-34ms=4 34-50ms=0 >=50ms=0 max=28.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=501 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=239 4-8ms=262 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=34 coalescedSamples=179 motionEvents=178
  touch dt: 0-4ms=0 4-8ms=177 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=110.5ms
  coalesced dt: 0-4ms=0 4-8ms=177 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=110.5ms
  pointer: events=178 emitted=178
  speed: 0-50=1 50-150=12 150-300=148 300-600=17 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=329.6
  gain: 0-1.1=0 1.1-1.5=178 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=3 8-16=74 16-32=244 32-64=24 64-127=2 >=127=0 max=80.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=64 17-25ms=13 25-34ms=19 34-50ms=6 >=50ms=0 max=38.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=169 subframes=169 capped=0 staleDrops=2 maxBatch=9 maxPending=258
  UDP sender: ticks=500 emitted=169 emptyWhileActive=13
  UDP timer dt: 0-4ms=251 4-8ms=249 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=162 8-12ms=3 12-17ms=3 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.0ms
  dropped movement: events=2 absDx=15 absDy=47
📈 Movement diagnostics
  touch: callbacks=86 coalescedSamples=478 motionEvents=478
  touch dt: 0-4ms=0 4-8ms=478 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=478 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=478 emitted=478
  speed: 0-50=0 50-150=2 150-300=258 300-600=218 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=485.9
  gain: 0-1.1=0 1.1-1.5=478 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=43 16-32=532 32-64=384 64-127=0 >=127=0 max=53.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=47 34-50ms=20 >=50ms=0 max=39.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=481 subframes=481 capped=0 staleDrops=0 maxBatch=8 maxPending=335
  UDP sender: ticks=501 emitted=481 emptyWhileActive=20
  UDP timer dt: 0-4ms=251 4-8ms=250 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=468 8-12ms=11 12-17ms=2 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=47 coalescedSamples=239 motionEvents=237
  touch dt: 0-4ms=0 4-8ms=231 8-12ms=4 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=1 max=76.0ms
  coalesced dt: 0-4ms=0 4-8ms=231 8-12ms=4 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=1 max=76.0ms
  pointer: events=237 emitted=237
  speed: 0-50=10 50-150=50 150-300=96 300-600=65 600-1000=16 1000-1600=0 1600-2400=0 >=2400=0 max=747.9
  gain: 0-1.1=0 1.1-1.5=237 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=0 2-4=13 4-8=13 8-16=102 16-32=207 32-64=109 64-127=27 >=127=0 max=80.5
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=41 17-25ms=7 25-34ms=22 34-50ms=11 >=50ms=3 max=75.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=235 subframes=235 capped=0 staleDrops=3 maxBatch=9 maxPending=571
  UDP sender: ticks=501 emitted=235 emptyWhileActive=21
  UDP timer dt: 0-4ms=246 4-8ms=255 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=227 8-12ms=3 12-17ms=3 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.4ms
  dropped movement: events=3 absDx=64 absDy=80
📈 Movement diagnostics
  touch: callbacks=33 coalescedSamples=158 motionEvents=156
  touch dt: 0-4ms=0 4-8ms=154 8-12ms=1 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  coalesced dt: 0-4ms=0 4-8ms=154 8-12ms=2 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  pointer: events=156 emitted=156
  speed: 0-50=23 50-150=22 150-300=40 300-600=61 600-1000=10 1000-1600=0 1600-2400=0 >=2400=0 max=750.2
  gain: 0-1.1=0 1.1-1.5=156 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=36 4-8=27 8-16=36 16-32=82 32-64=104 64-127=19 >=127=0 max=89.1
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=69 17-25ms=1 25-34ms=14 34-50ms=10 >=50ms=1 max=74.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=148 subframes=148 capped=0 staleDrops=4 maxBatch=10 maxPending=417
  UDP sender: ticks=501 emitted=148 emptyWhileActive=19
  UDP timer dt: 0-4ms=253 4-8ms=248 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=139 8-12ms=4 12-17ms=1 17-25ms=1 25-34ms=1 34-50ms=0 >=50ms=0 max=27.8ms
  dropped movement: events=4 absDx=86 absDy=25
📈 Movement diagnostics
  touch: callbacks=1 coalescedSamples=1 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=18 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=118 17-25ms=1 25-34ms=1 34-50ms=0 >=50ms=0 max=25.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=501 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=254 4-8ms=247 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=25 coalescedSamples=113 motionEvents=113
  touch dt: 0-4ms=4 4-8ms=95 8-12ms=7 12-20ms=4 20-33ms=1 33-50ms=1 >=50ms=1 max=812.5ms
  coalesced dt: 0-4ms=4 4-8ms=95 8-12ms=7 12-20ms=4 20-33ms=1 33-50ms=1 >=50ms=1 max=812.5ms
  pointer: events=113 emitted=113
  speed: 0-50=10 50-150=44 150-300=20 300-600=39 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=572.4
  gain: 0-1.1=0 1.1-1.5=113 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=3 1-2=0 2-4=8 4-8=44 8-16=50 16-32=54 32-64=56 64-127=8 >=127=0 max=97.5
  BLE: attempts=104 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=82 17-25ms=1 25-34ms=14 34-50ms=7 >=50ms=0 max=38.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=110 subframes=110 capped=0 staleDrops=1 maxBatch=8 maxPending=347
  UDP sender: ticks=501 emitted=110 emptyWhileActive=38
  UDP timer dt: 0-4ms=253 4-8ms=248 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=100 8-12ms=3 12-17ms=3 17-25ms=1 25-34ms=1 34-50ms=0 >=50ms=0 max=28.0ms
  dropped movement: events=1 absDx=0 absDy=0

16:15:36.515 -> 
16:15:37.299 -> .....
16:15:38.321 -> ✅ UDP motion listening on 192.168.18.125:4210
16:15:38.321 -> 🎯 ESP_Bridge_TinyUSB ready
16:15:38.321 -> 🚦 udp-rx task running on core 0
16:15:39.308 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=1402/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
16:15:39.308 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1002/s
16:15:39.308 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
16:15:39.308 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
16:15:40.329 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
16:15:40.329 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=1001/s
16:15:40.329 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
16:15:40.329 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
16:15:41.316 -> 📈 ESP smooth | UDP rawPkts=18/s datagrams=18/s subframes=18/s malformed=0 queueMax=5 overflow=0 | HID ticks=500/s reports=16/s reportFails=0 staleDrops=0 lateMax=0.5ms
16:15:41.316 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=999/s
16:15:41.316 ->   HID interval ms <2=3 2-4=6 4-8=3 8-16=2 >=16=1
16:15:41.316 ->   emit delta:    0=0 1=3 2-4=11 4-8=1 8-16=1 16-32=0 32-64=0 64-127=0
16:15:42.336 -> 📈 ESP smooth | UDP rawPkts=197/s datagrams=197/s subframes=197/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=193/s reportFails=0 staleDrops=0 lateMax=0.5ms
16:15:42.336 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=973/s
16:15:42.336 ->   HID interval ms <2=55 2-4=80 4-8=40 8-16=5 >=16=13
16:15:42.336 ->   emit delta:    0=0 1=12 2-4=125 4-8=56 8-16=0 16-32=0 32-64=0 64-127=0
16:15:43.321 -> 📈 ESP smooth | UDP rawPkts=210/s datagrams=210/s subframes=210/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=213/s reportFails=0 staleDrops=0 lateMax=0.4ms
16:15:43.321 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=977/s
16:15:43.321 ->   HID interval ms <2=66 2-4=90 4-8=39 8-16=3 >=16=15
16:15:43.321 ->   emit delta:    0=0 1=2 2-4=124 4-8=87 8-16=0 16-32=0 32-64=0 64-127=0
16:15:44.343 -> 📈 ESP smooth | UDP rawPkts=216/s datagrams=216/s subframes=216/s malformed=0 queueMax=8 overflow=0 | HID ticks=500/s reports=216/s reportFails=0 staleDrops=0 lateMax=0.4ms
16:15:44.343 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=967/s
16:15:44.343 ->   HID interval ms <2=71 2-4=93 4-8=33 8-16=2 >=16=17
16:15:44.343 ->   emit delta:    0=0 1=10 2-4=133 4-8=73 8-16=0 16-32=0 32-64=0 64-127=0
16:15:45.331 -> 📈 ESP smooth | UDP rawPkts=73/s datagrams=73/s subframes=73/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=73/s reportFails=0 staleDrops=0 lateMax=0.4ms
16:15:45.331 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=994/s
16:15:45.331 ->   HID interval ms <2=18 2-4=29 4-8=19 8-16=1 >=16=6
16:15:45.331 ->   emit delta:    0=0 1=18 2-4=46 4-8=9 8-16=0 16-32=0 32-64=0 64-127=0
16:15:46.320 -> 📈 ESP smooth | UDP rawPkts=128/s datagrams=128/s subframes=128/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=114/s reportFails=0 staleDrops=0 lateMax=0.5ms
16:15:46.320 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=988/s
16:15:46.320 ->   HID interval ms <2=32 2-4=41 4-8=25 8-16=5 >=16=11
16:15:46.320 ->   emit delta:    0=0 1=27 2-4=35 4-8=40 8-16=12 16-32=0 32-64=0 64-127=0
16:15:47.340 -> 📈 ESP smooth | UDP rawPkts=70/s datagrams=70/s subframes=70/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=66/s reportFails=0 staleDrops=0 lateMax=0.4ms
16:15:47.340 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=990/s
16:15:47.340 ->   HID interval ms <2=21 2-4=27 4-8=8 8-16=3 >=16=7
16:15:47.340 ->   emit delta:    0=0 1=9 2-4=23 4-8=34 8-16=0 16-32=0 32-64=0 64-127=0
16:15:48.323 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
16:15:48.323 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=1001/s
16:15:48.323 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
16:15:48.323 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
16:15:49.341 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
16:15:49.341 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1001/s
16:15:49.341 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
16:15:49.341 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
16:15:50.324 -> 📈 ESP smooth | UDP rawPkts=67/s datagrams=67/s subframes=67/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=66/s reportFails=0 staleDrops=0 lateMax=0.5ms
16:15:50.357 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=993/s
16:15:50.357 ->   HID interval ms <2=16 2-4=28 4-8=12 8-16=3 >=16=7
16:15:50.357 ->   emit delta:    0=0 1=8 2-4=13 4-8=41 8-16=4 16-32=0 32-64=0 64-127=0
16:15:51.342 -> 📈 ESP smooth | UDP rawPkts=36/s datagrams=36/s subframes=36/s malformed=0 queueMax=5 overflow=0 | HID ticks=500/s reports=29/s reportFails=0 staleDrops=0 lateMax=0.4ms
16:15:51.342 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=998/s
16:15:51.342 ->   HID interval ms <2=4 2-4=8 4-8=12 8-16=1 >=16=4
16:15:51.342 ->   emit delta:    0=0 1=23 2-4=6 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
16:15:52.360 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
16:15:52.360 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1001/s
16:15:52.360 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
16:15:52.360 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
16:15:53.348 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
16:15:53.348 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=1001/s
16:15:53.348 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
16:15:53.348 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
16:15:54.361 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
16:15:54.361 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=1001/s
16:15:54.361 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
16:15:54.361 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

## Log 14
UDP motion state: preparing
UDP motion state: ready
Unable to open mach-O at path: /Library/Caches/com.apple.xbs/Binaries/RenderBox/install/Root/System/Library/PrivateFrameworks/RenderBox.framework/default.metallib  Error:2
App is being debugged, do not track this hang
Hang detected: 0.32s (debugger attached, not reporting)
✅ Bluetooth is ON – ready to scan
Start Scanning
App is being debugged, do not track this hang
Hang detected: 0.57s (debugger attached, not reporting)
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=32 17-25ms=5 25-34ms=1 34-50ms=0 >=50ms=1 max=62.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=227 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=114 4-8ms=106 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=318.9ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=114 17-25ms=6 25-34ms=0 34-50ms=0 >=50ms=0 max=17.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=264 4-8ms=236 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=64 coalescedSamples=342 motionEvents=337
  touch dt: 0-4ms=0 4-8ms=334 8-12ms=0 12-20ms=2 20-33ms=0 33-50ms=1 >=50ms=0 max=37.6ms
  coalesced dt: 0-4ms=0 4-8ms=334 8-12ms=0 12-20ms=2 20-33ms=0 33-50ms=1 >=50ms=0 max=37.6ms
  pointer: events=337 emitted=337
  speed: 0-50=0 50-150=12 150-300=161 300-600=164 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=453.2
  gain: 0-1.1=0 1.1-1.5=337 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=28 16-32=337 32-64=307 64-127=2 >=127=0 max=70.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=31 17-25ms=1 25-34ms=29 34-50ms=16 >=50ms=1 max=52.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=65 subframes=337 capped=0 staleDrops=0 maxBatch=8 maxPending=316
  UDP sender: ticks=500 emitted=65 emptyWhileActive=289
  UDP timer dt: 0-4ms=243 4-8ms=258 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=3 8-12ms=9 12-17ms=7 17-25ms=20 25-34ms=23 34-50ms=0 >=50ms=0 max=29.0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=75 coalescedSamples=393 motionEvents=396
  touch dt: 0-4ms=2 4-8ms=389 8-12ms=1 12-20ms=4 20-33ms=0 33-50ms=0 >=50ms=0 max=12.6ms
  coalesced dt: 0-4ms=2 4-8ms=389 8-12ms=1 12-20ms=4 20-33ms=0 33-50ms=0 >=50ms=0 max=12.6ms
  pointer: events=396 emitted=396
  speed: 0-50=1 50-150=1 150-300=126 300-600=263 600-1000=5 1000-1600=0 1600-2400=0 >=2400=0 max=751.7
  gain: 0-1.1=0 1.1-1.5=396 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=0 2-4=0 4-8=0 8-16=6 16-32=295 32-64=474 64-127=8 >=127=2 max=155.9
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=14 17-25ms=1 25-34ms=34 34-50ms=18 >=50ms=3 max=60.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=73 subframes=390 capped=0 staleDrops=2 maxBatch=8 maxPending=350
  UDP sender: ticks=500 emitted=73 emptyWhileActive=345
  UDP timer dt: 0-4ms=251 4-8ms=249 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=1 8-12ms=8 12-17ms=11 17-25ms=22 25-34ms=29 34-50ms=0 >=50ms=0 max=28.3ms
  dropped movement: events=2 absDx=123 absDy=107
📈 Movement diagnostics
  touch: callbacks=31 coalescedSamples=145 motionEvents=143
  touch dt: 0-4ms=0 4-8ms=136 8-12ms=5 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=2 max=79.2ms
  coalesced dt: 0-4ms=0 4-8ms=136 8-12ms=5 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=2 max=79.2ms
  pointer: events=143 emitted=143
  speed: 0-50=20 50-150=26 150-300=20 300-600=68 600-1000=9 1000-1600=0 1600-2400=0 >=2400=0 max=643.3
  gain: 0-1.1=0 1.1-1.5=143 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=26 4-8=40 8-16=24 16-32=38 32-64=130 64-127=18 >=127=2 max=132.7
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=61 17-25ms=8 25-34ms=16 34-50ms=8 >=50ms=2 max=51.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=27 subframes=135 capped=0 staleDrops=2 maxBatch=8 maxPending=420
  UDP sender: ticks=500 emitted=27 emptyWhileActive=130
  UDP timer dt: 0-4ms=242 4-8ms=258 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=1 12-17ms=5 17-25ms=8 25-34ms=9 34-50ms=0 >=50ms=0 max=28.6ms
  dropped movement: events=2 absDx=70 absDy=123
📈 Movement diagnostics
  touch: callbacks=24 coalescedSamples=99 motionEvents=97
  touch dt: 0-4ms=0 4-8ms=86 8-12ms=5 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=5 max=587.6ms
  coalesced dt: 0-4ms=0 4-8ms=86 8-12ms=5 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=5 max=587.6ms
  pointer: events=97 emitted=97
  speed: 0-50=11 50-150=25 150-300=45 300-600=16 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=406.2
  gain: 0-1.1=0 1.1-1.5=97 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=3 1-2=0 2-4=18 4-8=8 8-16=70 16-32=60 32-64=32 64-127=0 >=127=0 max=49.8
  BLE: attempts=42 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=63 17-25ms=14 25-34ms=16 34-50ms=6 >=50ms=1 max=50.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=23 subframes=94 capped=0 staleDrops=0 maxBatch=8 maxPending=303
  UDP sender: ticks=501 emitted=23 emptyWhileActive=128
  UDP timer dt: 0-4ms=232 4-8ms=269 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=2 12-17ms=1 17-25ms=4 25-34ms=7 34-50ms=0 >=50ms=0 max=31.7ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=7 coalescedSamples=12 motionEvents=12
  touch dt: 0-4ms=0 4-8ms=2 8-12ms=4 12-20ms=5 20-33ms=1 33-50ms=0 >=50ms=0 max=20.9ms
  coalesced dt: 0-4ms=0 4-8ms=2 8-12ms=4 12-20ms=5 20-33ms=1 33-50ms=0 >=50ms=0 max=20.9ms
  pointer: events=12 emitted=12
  speed: 0-50=12 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=26.4
  gain: 0-1.1=0 1.1-1.5=12 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=4 1-2=0 2-4=15 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=3.1
  BLE: attempts=114 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=101 17-25ms=7 25-34ms=2 34-50ms=4 >=50ms=0 max=48.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=6 subframes=7 capped=0 staleDrops=1 maxBatch=2 maxPending=6
  UDP sender: ticks=501 emitted=6 emptyWhileActive=30
  UDP timer dt: 0-4ms=250 4-8ms=251 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=2 17-25ms=2 25-34ms=2 34-50ms=0 >=50ms=0 max=28.0ms
  dropped movement: events=1 absDx=3 absDy=0

15:58:30.453 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:58:30.453 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
15:58:30.453 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:58:30.453 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:58:31.440 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:58:31.440 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
15:58:31.440 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:58:31.440 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:58:32.455 -> 📈 ESP smooth | UDP rawPkts=14/s datagrams=14/s subframes=64/s malformed=0 queueMax=12 overflow=0 | HID ticks=500/s reports=12/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:58:32.455 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
15:58:32.455 ->   HID interval ms <2=1 2-4=0 4-8=1 8-16=2 >=16=8
15:58:32.455 ->   emit delta:    0=0 1=0 2-4=0 4-8=4 8-16=5 16-32=3 32-64=0 64-127=0
15:58:33.442 -> 📈 ESP smooth | UDP rawPkts=44/s datagrams=44/s subframes=237/s malformed=0 queueMax=15 overflow=0 | HID ticks=500/s reports=36/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:58:33.442 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1000/s
15:58:33.442 ->   HID interval ms <2=1 2-4=0 4-8=4 8-16=5 >=16=26
15:58:33.442 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=11 16-32=19 32-64=5 64-127=1
15:58:34.460 -> 📈 ESP smooth | UDP rawPkts=44/s datagrams=44/s subframes=240/s malformed=0 queueMax=17 overflow=0 | HID ticks=500/s reports=32/s reportFails=0 staleDrops=2 lateMax=0.5ms
15:58:34.460 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=997/s
15:58:34.460 ->   HID interval ms <2=0 2-4=1 4-8=2 8-16=7 >=16=22
15:58:34.460 ->   emit delta:    0=0 1=0 2-4=0 4-8=1 8-16=4 16-32=14 32-64=12 64-127=1
15:58:35.453 -> 📈 ESP smooth | UDP rawPkts=36/s datagrams=36/s subframes=186/s malformed=0 queueMax=12 overflow=0 | HID ticks=500/s reports=31/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:58:35.453 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=1000/s
15:58:35.453 ->   HID interval ms <2=2 2-4=0 4-8=4 8-16=4 >=16=21
15:58:35.453 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=7 16-32=18 32-64=6 64-127=0
15:58:36.466 -> 📈 ESP smooth | UDP rawPkts=13/s datagrams=13/s subframes=67/s malformed=0 queueMax=12 overflow=0 | HID ticks=500/s reports=10/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:58:36.466 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
15:58:36.466 ->   HID interval ms <2=0 2-4=0 4-8=1 8-16=1 >=16=8
15:58:36.466 ->   emit delta:    0=0 1=0 2-4=2 4-8=0 8-16=1 16-32=4 32-64=2 64-127=1
15:58:37.454 -> 📈 ESP smooth | UDP rawPkts=14/s datagrams=14/s subframes=68/s malformed=0 queueMax=12 overflow=0 | HID ticks=500/s reports=11/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:58:37.454 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=1000/s
15:58:37.454 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=2 >=16=9
15:58:37.454 ->   emit delta:    0=0 1=1 2-4=1 4-8=2 8-16=2 16-32=1 32-64=4 64-127=0
15:58:38.470 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:58:38.470 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
15:58:38.470 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:58:38.470 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:58:39.452 -> 📈 ESP smooth | UDP rawPkts=20/s datagrams=20/s subframes=91/s malformed=0 queueMax=11 overflow=0 | HID ticks=500/s reports=16/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:58:39.452 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
15:58:39.452 ->   HID interval ms <2=0 2-4=0 4-8=4 8-16=1 >=16=11
15:58:39.452 ->   emit delta:    0=0 1=1 2-4=0 4-8=3 8-16=7 16-32=3 32-64=2 64-127=0
15:58:40.473 -> 📈 ESP smooth | UDP rawPkts=9/s datagrams=9/s subframes=10/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=3/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:58:40.473 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=1001/s
15:58:40.473 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=3
15:58:40.473 ->   emit delta:    0=0 1=3 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:58:41.459 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:58:41.459 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
15:58:41.459 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:58:41.459 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:58:42.482 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:58:42.482 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
15:58:42.482 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:58:42.482 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

## Log 13

UDP motion state: preparing
UDP motion state: ready
Unable to open mach-O at path: /Library/Caches/com.apple.xbs/Binaries/RenderBox/install/Root/System/Library/PrivateFrameworks/RenderBox.framework/default.metallib  Error:2
✅ Bluetooth is ON – ready to scan
Start Scanning
App is being debugged, do not track this hang
Hang detected: 0.31s (debugger attached, not reporting)
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=55 17-25ms=0 25-34ms=1 34-50ms=1 >=50ms=1 max=360.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=310 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=150 4-8ms=154 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=221.4ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=0 12-17ms=114 17-25ms=0 25-34ms=3 34-50ms=0 >=50ms=0 max=28.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=223 4-8ms=277 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=48 coalescedSamples=263 motionEvents=262
  touch dt: 0-4ms=0 4-8ms=261 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=20.8ms
  coalesced dt: 0-4ms=0 4-8ms=261 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=20.8ms
  pointer: events=262 emitted=262
  speed: 0-50=0 50-150=1 150-300=20 300-600=134 600-1000=107 1000-1600=0 1600-2400=0 >=2400=0 max=915.0
  gain: 0-1.1=0 1.1-1.5=262 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=23 32-64=145 64-127=96 >=127=44 max=621.5
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=52 17-25ms=1 25-34ms=27 34-50ms=10 >=50ms=0 max=39.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=46 subframes=46 capped=0 staleDrops=1 maxBatch=1 maxPending=620
  UDP sender: ticks=501 emitted=47 emptyWhileActive=226
  UDP timer dt: 0-4ms=245 4-8ms=256 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=3 12-17ms=4 17-25ms=22 25-34ms=15 34-50ms=0 >=50ms=0 max=32.0ms
  dropped movement: events=1 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=54 coalescedSamples=267 motionEvents=265
  touch dt: 0-4ms=0 4-8ms=255 8-12ms=6 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=2 max=70.8ms
  coalesced dt: 0-4ms=0 4-8ms=255 8-12ms=6 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=2 max=70.8ms
  pointer: events=265 emitted=265
  speed: 0-50=18 50-150=18 150-300=16 300-600=137 600-1000=76 1000-1600=0 1600-2400=0 >=2400=0 max=864.7
  gain: 0-1.1=0 1.1-1.5=265 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=0 2-4=18 4-8=14 8-16=12 16-32=26 32-64=131 64-127=74 >=127=39 max=594.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=32 17-25ms=2 25-34ms=26 34-50ms=18 >=50ms=1 max=50.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=50 subframes=50 capped=0 staleDrops=5 maxBatch=1 maxPending=583
  UDP sender: ticks=501 emitted=49 emptyWhileActive=249
  UDP timer dt: 0-4ms=254 4-8ms=246 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=6 12-17ms=3 17-25ms=18 25-34ms=19 34-50ms=0 >=50ms=0 max=32.0ms
  dropped movement: events=5 absDx=194 absDy=127
📈 Movement diagnostics
  touch: callbacks=20 coalescedSamples=78 motionEvents=76
  touch dt: 0-4ms=0 4-8ms=71 8-12ms=2 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=1 max=762.5ms
  coalesced dt: 0-4ms=0 4-8ms=71 8-12ms=2 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=1 max=762.5ms
  pointer: events=76 emitted=76
  speed: 0-50=9 50-150=9 150-300=11 300-600=22 600-1000=25 1000-1600=0 1600-2400=0 >=2400=0 max=901.5
  gain: 0-1.1=0 1.1-1.5=76 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=0 2-4=4 4-8=9 8-16=8 16-32=9 32-64=27 64-127=27 >=127=10 max=558.7
  BLE: attempts=20 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=77 17-25ms=5 25-34ms=11 34-50ms=8 >=50ms=0 max=40.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=17 subframes=19 capped=0 staleDrops=2 maxBatch=1 maxPending=433
  UDP sender: ticks=500 emitted=19 emptyWhileActive=82
  UDP timer dt: 0-4ms=247 4-8ms=254 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=4 17-25ms=4 25-34ms=6 34-50ms=0 >=50ms=0 max=32.0ms
  dropped movement: events=2 absDx=1 absDy=0

15:33:10.981 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:33:10.981 ->   net: wifi=connected ip=192.168.18.125 rssi=-42 mounted=yes | udpRx iters=1001/s
15:33:10.981 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:33:10.981 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:33:11.968 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:33:11.968 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s
15:33:11.968 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:33:11.968 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:33:12.957 -> 📈 ESP smooth | UDP rawPkts=38/s datagrams=38/s subframes=38/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=32/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:33:12.957 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=999/s
15:33:12.957 ->   HID interval ms <2=1 2-4=1 4-8=1 8-16=3 >=16=26
15:33:12.957 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=4 16-32=8 32-64=15 64-127=5
15:33:13.975 -> 📈 ESP smooth | UDP rawPkts=29/s datagrams=29/s subframes=29/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=24/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:33:13.975 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=999/s
15:33:13.975 ->   HID interval ms <2=2 2-4=0 4-8=0 8-16=6 >=16=16
15:33:13.975 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=9 32-64=12 64-127=3
15:33:14.961 -> 📈 ESP smooth | UDP rawPkts=22/s datagrams=22/s subframes=22/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=17/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:33:14.961 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
15:33:14.961 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=5 >=16=12
15:33:14.961 ->   emit delta:    0=0 1=1 2-4=0 4-8=1 8-16=0 16-32=9 32-64=4 64-127=2
15:33:15.977 -> 📈 ESP smooth | UDP rawPkts=20/s datagrams=20/s subframes=22/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=15/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:33:15.977 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1000/s
15:33:15.977 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=2 >=16=13
15:33:15.977 ->   emit delta:    0=0 1=1 2-4=0 4-8=1 8-16=4 16-32=3 32-64=4 64-127=2
15:33:16.964 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:33:16.964 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
15:33:16.964 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:33:16.964 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:33:17.986 -> 📈 ESP smooth | UDP rawPkts=18/s datagrams=18/s subframes=18/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=18/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:33:17.986 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1000/s
15:33:17.986 ->   HID interval ms <2=1 2-4=0 4-8=5 8-16=3 >=16=9
15:33:17.986 ->   emit delta:    0=0 1=3 2-4=6 4-8=1 8-16=3 16-32=3 32-64=1 64-127=1
15:33:18.969 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:33:18.969 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
15:33:18.969 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:33:18.969 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

## LOg 12

UDP motion state: preparing
UDP motion state: ready
Unable to open mach-O at path: /Library/Caches/com.apple.xbs/Binaries/RenderBox/install/Root/System/Library/PrivateFrameworks/RenderBox.framework/default.metallib  Error:2
✅ Bluetooth is ON – ready to scan
Start Scanning
App is being debugged, do not track this hang
Hang detected: 1.19s (debugger attached, not reporting)
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=4 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=1 max=1239.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=115 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=57 4-8ms=52 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=631.7ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=15 coalescedSamples=70 motionEvents=69
  touch dt: 0-4ms=0 4-8ms=68 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  coalesced dt: 0-4ms=0 4-8ms=68 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  pointer: events=69 emitted=69
  speed: 0-50=0 50-150=6 150-300=52 300-600=11 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=390.7
  gain: 0-1.1=0 1.1-1.5=69 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=2 8-16=19 16-32=44 32-64=12 64-127=5 >=127=7 max=160.4
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=100 17-25ms=1 25-34ms=9 34-50ms=2 >=50ms=0 max=38.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=13 subframes=20 capped=7 staleDrops=0 maxBatch=1 maxPending=193
  UDP sender: ticks=500 emitted=20 emptyWhileActive=55
  UDP timer dt: 0-4ms=220 4-8ms=280 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=1 12-17ms=1 17-25ms=5 25-34ms=5 34-50ms=0 >=50ms=0 max=28.2ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=86 coalescedSamples=480 motionEvents=480
  touch dt: 0-4ms=0 4-8ms=480 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=480 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=480 emitted=480
  speed: 0-50=0 50-150=28 150-300=409 300-600=43 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=367.8
  gain: 0-1.1=0 1.1-1.5=480 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=1 4-8=2 8-16=59 16-32=391 32-64=65 64-127=45 >=127=35 max=179.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=38 34-50ms=23 >=50ms=2 max=51.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=87 subframes=118 capped=30 staleDrops=4 maxBatch=1 maxPending=257
  UDP sender: ticks=501 emitted=118 emptyWhileActive=376
  UDP timer dt: 0-4ms=240 4-8ms=260 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=1 8-12ms=7 12-17ms=15 17-25ms=33 25-34ms=27 34-50ms=0 >=50ms=0 max=32.1ms
  dropped movement: events=4 absDx=1 absDy=1
📈 Movement diagnostics
  touch: callbacks=85 coalescedSamples=480 motionEvents=480
  touch dt: 0-4ms=0 4-8ms=480 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=480 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=480 emitted=480
  speed: 0-50=0 50-150=2 150-300=291 300-600=187 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=458.7
  gain: 0-1.1=0 1.1-1.5=480 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=3 2-4=2 4-8=4 8-16=20 16-32=329 32-64=156 64-127=42 >=127=63 max=179.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=38 34-50ms=22 >=50ms=2 max=51.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=89 subframes=139 capped=54 staleDrops=3 maxBatch=1 maxPending=283
  UDP sender: ticks=500 emitted=139 emptyWhileActive=357
  UDP timer dt: 0-4ms=236 4-8ms=265 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=3 8-12ms=11 12-17ms=13 17-25ms=29 25-34ms=30 34-50ms=0 >=50ms=0 max=32.2ms
  dropped movement: events=3 absDx=1 absDy=1
📈 Movement diagnostics
  touch: callbacks=50 coalescedSamples=242 motionEvents=240
  touch dt: 0-4ms=0 4-8ms=235 8-12ms=2 12-20ms=1 20-33ms=1 33-50ms=1 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=235 8-12ms=2 12-20ms=2 20-33ms=1 33-50ms=1 >=50ms=0 max=45.8ms
  pointer: events=240 emitted=240
  speed: 0-50=4 50-150=10 150-300=66 300-600=160 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=477.0
  gain: 0-1.1=0 1.1-1.5=240 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=1 2-4=5 4-8=7 8-16=16 16-32=85 32-64=154 64-127=18 >=127=39 max=179.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=52 17-25ms=0 25-34ms=16 34-50ms=14 >=50ms=3 max=61.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=52 subframes=86 capped=39 staleDrops=3 maxBatch=1 maxPending=411
  UDP sender: ticks=500 emitted=86 emptyWhileActive=181
  UDP timer dt: 0-4ms=258 4-8ms=242 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=10 12-17ms=10 17-25ms=13 25-34ms=17 34-50ms=0 >=50ms=0 max=32.0ms
  dropped movement: events=3 absDx=25 absDy=18
📈 Movement diagnostics
  touch: callbacks=40 coalescedSamples=194 motionEvents=191
  touch dt: 0-4ms=0 4-8ms=186 8-12ms=2 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=2 max=120.9ms
  coalesced dt: 0-4ms=0 4-8ms=187 8-12ms=2 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=2 max=120.9ms
  pointer: events=191 emitted=191
  speed: 0-50=17 50-150=51 150-300=18 300-600=81 600-1000=24 1000-1600=0 1600-2400=0 >=2400=0 max=663.7
  gain: 0-1.1=0 1.1-1.5=191 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=2 1-2=0 2-4=11 4-8=28 8-16=37 16-32=26 32-64=90 64-127=31 >=127=28 max=179.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=59 17-25ms=3 25-34ms=16 34-50ms=10 >=50ms=3 max=62.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=43 subframes=62 capped=24 staleDrops=2 maxBatch=1 maxPending=313
  UDP sender: ticks=500 emitted=62 emptyWhileActive=148
  UDP timer dt: 0-4ms=255 4-8ms=245 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=2 8-12ms=6 12-17ms=12 17-25ms=13 25-34ms=8 34-50ms=0 >=50ms=0 max=32.1ms
  dropped movement: events=2 absDx=1 absDy=0
📈 Movement diagnostics
  touch: callbacks=31 coalescedSamples=131 motionEvents=128
  touch dt: 0-4ms=0 4-8ms=102 8-12ms=21 12-20ms=3 20-33ms=0 33-50ms=0 >=50ms=2 max=845.9ms
  coalesced dt: 0-4ms=0 4-8ms=102 8-12ms=23 12-20ms=3 20-33ms=0 33-50ms=0 >=50ms=2 max=845.9ms
  pointer: events=128 emitted=128
  speed: 0-50=30 50-150=7 150-300=64 300-600=27 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=441.8
  gain: 0-1.1=0 1.1-1.5=128 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=6 1-2=0 2-4=27 4-8=9 8-16=7 16-32=67 32-64=32 64-127=10 >=127=11 max=128.7
  BLE: attempts=48 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=63 17-25ms=16 25-34ms=17 34-50ms=4 >=50ms=1 max=68.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=31 subframes=41 capped=11 staleDrops=1 maxBatch=1 maxPending=355
  UDP sender: ticks=501 emitted=41 emptyWhileActive=135
  UDP timer dt: 0-4ms=256 4-8ms=245 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=0 8-12ms=4 12-17ms=3 17-25ms=10 25-34ms=12 34-50ms=0 >=50ms=0 max=32.0ms
  dropped movement: events=1 absDx=0 absDy=0

15:23:31.274 -> 📈 ESP smooth | UDP rawPkts=44/s datagrams=44/s subframes=61/s malformed=0 queueMax=4 overflow=0 | HID ticks=1303/s reports=37/s reportFails=0 staleDrops=0 lateMax=33.4ms
15:23:31.274 ->   net: wifi=connected ip=192.168.18.125 rssi=-42 mounted=yes | udpRx iters=1002/s
15:23:31.274 ->   HID interval ms <2=0 2-4=1 4-8=2 8-16=6 >=16=27
15:23:31.274 ->   emit delta:    0=0 1=0 2-4=0 4-8=4 8-16=17 16-32=14 32-64=2 64-127=0
15:23:32.260 -> 📈 ESP smooth | UDP rawPkts=44/s datagrams=44/s subframes=67/s malformed=0 queueMax=4 overflow=0 | HID ticks=500/s reports=35/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:32.260 ->   net: wifi=connected ip=192.168.18.125 rssi=-43 mounted=yes | udpRx iters=1000/s
15:23:32.260 ->   HID interval ms <2=2 2-4=1 4-8=1 8-16=3 >=16=28
15:23:32.260 ->   emit delta:    0=0 1=0 2-4=0 4-8=1 8-16=11 16-32=18 32-64=5 64-127=0
15:23:33.276 -> 📈 ESP smooth | UDP rawPkts=44/s datagrams=44/s subframes=70/s malformed=0 queueMax=5 overflow=0 | HID ticks=500/s reports=36/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:23:33.276 ->   net: wifi=connected ip=192.168.18.125 rssi=-43 mounted=yes | udpRx iters=1001/s
15:23:33.276 ->   HID interval ms <2=2 2-4=0 4-8=2 8-16=6 >=16=26
15:23:33.276 ->   emit delta:    0=0 1=1 2-4=0 4-8=0 8-16=9 16-32=21 32-64=5 64-127=0
15:23:34.265 -> 📈 ESP smooth | UDP rawPkts=37/s datagrams=37/s subframes=63/s malformed=0 queueMax=4 overflow=0 | HID ticks=500/s reports=32/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:34.265 ->   net: wifi=connected ip=192.168.18.125 rssi=-43 mounted=yes | udpRx iters=999/s
15:23:34.265 ->   HID interval ms <2=2 2-4=0 4-8=1 8-16=10 >=16=19
15:23:34.265 ->   emit delta:    0=0 1=0 2-4=0 4-8=1 8-16=6 16-32=19 32-64=6 64-127=0
15:23:35.291 -> 📈 ESP smooth | UDP rawPkts=21/s datagrams=21/s subframes=32/s malformed=0 queueMax=4 overflow=0 | HID ticks=500/s reports=16/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:35.291 ->   net: wifi=connected ip=192.168.18.125 rssi=-42 mounted=yes | udpRx iters=1001/s
15:23:35.291 ->   HID interval ms <2=0 2-4=1 4-8=1 8-16=4 >=16=10
15:23:35.291 ->   emit delta:    0=0 1=1 2-4=2 4-8=2 8-16=1 16-32=5 32-64=5 64-127=0
15:23:36.275 -> 📈 ESP smooth | UDP rawPkts=19/s datagrams=19/s subframes=28/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=15/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:23:36.275 ->   net: wifi=connected ip=192.168.18.125 rssi=-42 mounted=yes | udpRx iters=1001/s
15:23:36.275 ->   HID interval ms <2=2 2-4=0 4-8=1 8-16=4 >=16=8
15:23:36.275 ->   emit delta:    0=0 1=0 2-4=2 4-8=0 8-16=3 16-32=6 32-64=4 64-127=0
15:23:37.295 -> 📈 ESP smooth | UDP rawPkts=24/s datagrams=24/s subframes=34/s malformed=0 queueMax=4 overflow=0 | HID ticks=500/s reports=20/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:37.295 ->   net: wifi=connected ip=192.168.18.125 rssi=-43 mounted=yes | udpRx iters=999/s
15:23:37.295 ->   HID interval ms <2=0 2-4=0 4-8=2 8-16=3 >=16=15
15:23:37.295 ->   emit delta:    0=0 1=0 2-4=4 4-8=4 8-16=3 16-32=6 32-64=3 64-127=0
15:23:38.279 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:38.279 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
15:23:38.279 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:38.279 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:39.293 -> 📈 ESP smooth | UDP rawPkts=27/s datagrams=27/s subframes=37/s malformed=0 queueMax=4 overflow=0 | HID ticks=500/s reports=20/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:39.293 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
15:23:39.293 ->   HID interval ms <2=0 2-4=0 4-8=1 8-16=5 >=16=14
15:23:39.293 ->   emit delta:    0=0 1=2 2-4=1 4-8=0 8-16=8 16-32=7 32-64=2 64-127=0
15:23:40.278 -> 📈 ESP smooth | UDP rawPkts=5/s datagrams=5/s subframes=5/s malformed=0 queueMax=1 overflow=0 | HID ticks=500/s reports=3/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:40.278 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s
15:23:40.278 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=3
15:23:40.278 ->   emit delta:    0=0 1=3 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:41.292 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:41.292 ->   net: wifi=connected ip=192.168.18.125 rssi=-42 mounted=yes | udpRx iters=1001/s
15:23:41.292 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:41.292 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:42.278 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:42.311 ->   net: wifi=connected ip=192.168.18.125 rssi=-42 mounted=yes | udpRx iters=1001/s
15:23:42.311 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:42.311 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:43.299 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:43.299 ->   net: wifi=connected ip=192.168.18.125 rssi=-42 mounted=yes | udpRx iters=1001/s
15:23:43.299 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:43.299 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:44.287 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:44.287 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s
15:23:44.287 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:44.287 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:45.306 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:45.306 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
15:23:45.306 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:45.306 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:46.286 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:46.286 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
15:23:46.286 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:46.286 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:47.306 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:47.306 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
15:23:47.306 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:47.306 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:48.297 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:48.297 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
15:23:48.297 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:48.297 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:49.315 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:49.315 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
15:23:49.315 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:49.315 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:50.298 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:50.298 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s
15:23:50.298 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:50.298 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:51.318 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:51.318 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s
15:23:51.318 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:51.318 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:52.300 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:52.300 ->   net: wifi=connected ip=192.168.18.125 rssi=-43 mounted=yes | udpRx iters=1001/s
15:23:52.300 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:52.300 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:53.317 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:53.317 ->   net: wifi=connected ip=192.168.18.125 rssi=-43 mounted=yes | udpRx iters=1001/s
15:23:53.317 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:53.317 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:54.333 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:54.333 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
15:23:54.333 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:54.333 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:55.320 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:55.320 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s
15:23:55.320 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:55.320 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:56.306 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:56.339 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s
15:23:56.339 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:56.339 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:57.322 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:57.322 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s
15:23:57.322 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:57.322 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:58.311 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:58.345 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
15:23:58.345 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:58.345 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:23:59.328 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:23:59.328 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s
15:23:59.328 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:23:59.328 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:24:00.316 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:24:00.316 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s
15:24:00.316 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:24:00.316 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:24:01.337 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
15:24:01.337 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s

## Log 11

📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=11 17-25ms=3 25-34ms=1 34-50ms=0 >=50ms=2 max=77.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=150 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=72 4-8ms=72 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=456.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=5 coalescedSamples=14 motionEvents=13
  touch dt: 0-4ms=0 4-8ms=12 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=92.8ms
  coalesced dt: 0-4ms=0 4-8ms=12 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=92.8ms
  pointer: events=13 emitted=13
  speed: 0-50=1 50-150=10 150-300=2 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=171.8
  gain: 0-1.1=0 1.1-1.5=13 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=2 8-16=9 16-32=2 32-64=3 64-127=0 >=127=0 max=58
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=103 17-25ms=14 25-34ms=2 34-50ms=0 >=50ms=0 max=26.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=3 subframes=3 capped=0 staleDrops=0 maxBatch=1 maxPending=49
  UDP sender: ticks=500 emitted=4 emptyWhileActive=14
  UDP timer dt: 0-4ms=257 4-8ms=243 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=1 17-25ms=1 25-34ms=0 34-50ms=0 >=50ms=0 max=23.9ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=89 coalescedSamples=484 motionEvents=484
  touch dt: 0-4ms=0 4-8ms=484 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=484 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=484 emitted=484
  speed: 0-50=0 50-150=8 150-300=189 300-600=287 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=597.3
  gain: 0-1.1=0 1.1-1.5=484 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=2 4-8=4 8-16=11 16-32=235 32-64=266 64-127=43 >=127=75 max=179.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=1 17-25ms=0 25-34ms=36 34-50ms=26 >=50ms=0 max=41.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=101 subframes=152 capped=63 staleDrops=0 maxBatch=1 maxPending=359
  UDP sender: ticks=500 emitted=151 emptyWhileActive=349
  UDP timer dt: 0-4ms=248 4-8ms=252 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=4.9ms
  UDP send dt: 0-8ms=4 8-12ms=22 12-17ms=15 17-25ms=28 25-34ms=31 34-50ms=1 >=50ms=0 max=35.2ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=33 coalescedSamples=160 motionEvents=158
  touch dt: 0-4ms=0 4-8ms=152 8-12ms=5 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=70.8ms
  coalesced dt: 0-4ms=0 4-8ms=152 8-12ms=6 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=70.8ms
  pointer: events=158 emitted=158
  speed: 0-50=11 50-150=17 150-300=81 300-600=49 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=435.3
  gain: 0-1.1=0 1.1-1.5=158 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=0 2-4=13 4-8=8 8-16=17 16-32=84 32-64=54 64-127=13 >=127=18 max=174.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=60 17-25ms=6 25-34ms=19 34-50ms=7 >=50ms=2 max=64.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=35 subframes=50 capped=18 staleDrops=2 maxBatch=1 maxPending=313
  UDP sender: ticks=500 emitted=50 emptyWhileActive=136
  UDP timer dt: 0-4ms=246 4-8ms=254 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=2 8-12ms=5 12-17ms=6 17-25ms=9 25-34ms=12 34-50ms=0 >=50ms=0 max=32.7ms
  dropped movement: events=2 absDx=31 absDy=0
📈 Movement diagnostics
  touch: callbacks=41 coalescedSamples=184 motionEvents=179
  touch dt: 0-4ms=0 4-8ms=171 8-12ms=5 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=2 max=87.5ms
  coalesced dt: 0-4ms=0 4-8ms=172 8-12ms=5 12-20ms=3 20-33ms=0 33-50ms=0 >=50ms=2 max=87.5ms
  pointer: events=179 emitted=179
  speed: 0-50=23 50-150=24 150-300=52 300-600=80 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=580.9
  gain: 0-1.1=0 1.1-1.5=179 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=0 2-4=21 4-8=18 8-16=23 16-32=56 32-64=86 64-127=11 >=127=24 max=179.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=52 17-25ms=5 25-34ms=20 34-50ms=9 >=50ms=3 max=65.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=41 subframes=61 capped=23 staleDrops=2 maxBatch=1 maxPending=343
  UDP sender: ticks=501 emitted=61 emptyWhileActive=155
  UDP timer dt: 0-4ms=260 4-8ms=241 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=7 12-17ms=8 17-25ms=10 25-34ms=14 34-50ms=0 >=50ms=0 max=32.1ms
  dropped movement: events=2 absDx=1 absDy=1
📈 Movement diagnostics
  touch: callbacks=38 coalescedSamples=183 motionEvents=181
  touch dt: 0-4ms=0 4-8ms=177 8-12ms=0 12-20ms=1 20-33ms=1 33-50ms=0 >=50ms=2 max=109.4ms
  coalesced dt: 0-4ms=0 4-8ms=177 8-12ms=0 12-20ms=1 20-33ms=1 33-50ms=0 >=50ms=2 max=109.4ms
  pointer: events=181 emitted=181
  speed: 0-50=9 50-150=51 150-300=71 300-600=50 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=591.7
  gain: 0-1.1=0 1.1-1.5=181 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=0 2-4=5 4-8=16 8-16=45 16-32=78 32-64=58 64-127=9 >=127=19 max=179.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=65 17-25ms=5 25-34ms=20 34-50ms=6 >=50ms=1 max=75.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=36 subframes=50 capped=17 staleDrops=2 maxBatch=1 maxPending=356
  UDP sender: ticks=500 emitted=51 emptyWhileActive=147
  UDP timer dt: 0-4ms=267 4-8ms=233 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=0 8-12ms=4 12-17ms=10 17-25ms=6 25-34ms=14 34-50ms=0 >=50ms=0 max=32.2ms
  dropped movement: events=2 absDx=4 absDy=9
📈 Movement diagnostics
  touch: callbacks=15 coalescedSamples=64 motionEvents=63
  touch dt: 0-4ms=0 4-8ms=54 8-12ms=2 12-20ms=3 20-33ms=1 33-50ms=0 >=50ms=3 max=112.5ms
  coalesced dt: 0-4ms=0 4-8ms=54 8-12ms=2 12-20ms=4 20-33ms=1 33-50ms=0 >=50ms=3 max=112.5ms
  pointer: events=63 emitted=63
  speed: 0-50=9 50-150=9 150-300=45 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=221.5
  gain: 0-1.1=0 1.1-1.5=63 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=3 1-2=0 2-4=11 4-8=5 8-16=11 16-32=42 32-64=2 64-127=5 >=127=4 max=127.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=78 17-25ms=7 25-34ms=10 34-50ms=6 >=50ms=1 max=57.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=16 subframes=20 capped=3 staleDrops=4 maxBatch=1 maxPending=156
  UDP sender: ticks=500 emitted=19 emptyWhileActive=86
  UDP timer dt: 0-4ms=250 4-8ms=250 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=1 12-17ms=2 17-25ms=3 25-34ms=6 34-50ms=1 >=50ms=0 max=35.4ms
  dropped movement: events=4 absDx=1 absDy=1
📈 Movement diagnostics
  touch: callbacks=10 coalescedSamples=31 motionEvents=29
  touch dt: 0-4ms=0 4-8ms=16 8-12ms=12 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=612.5ms
  coalesced dt: 0-4ms=0 4-8ms=16 8-12ms=12 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=1 max=612.5ms
  pointer: events=29 emitted=29
  speed: 0-50=24 50-150=5 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=118.3
  gain: 0-1.1=0 1.1-1.5=29 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=0 2-4=19 4-8=6 8-16=10 16-32=0 32-64=1 64-127=0 >=127=0 max=34
  BLE: attempts=13 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=93 17-25ms=12 25-34ms=9 34-50ms=0 >=50ms=0 max=32.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=8 subframes=8 capped=0 staleDrops=0 maxBatch=1 maxPending=39
  UDP sender: ticks=500 emitted=8 emptyWhileActive=40
  UDP timer dt: 0-4ms=258 4-8ms=242 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=3 25-34ms=4 34-50ms=0 >=50ms=0 max=28.2ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=17 coalescedSamples=91 motionEvents=91
  touch dt: 0-4ms=0 4-8ms=90 8-12ms=1 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=8.3ms
  coalesced dt: 0-4ms=0 4-8ms=90 8-12ms=1 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=8.3ms
  pointer: events=91 emitted=91
  speed: 0-50=10 50-150=25 150-300=26 300-600=30 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=535.6
  gain: 0-1.1=0 1.1-1.5=91 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=0 2-4=5 4-8=21 8-16=23 16-32=18 32-64=32 64-127=9 >=127=8 max=129.4
  BLE: attempts=105 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=82 17-25ms=8 25-34ms=5 34-50ms=8 >=50ms=1 max=50.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=20 subframes=26 capped=8 staleDrops=2 maxBatch=1 maxPending=359
  UDP sender: ticks=500 emitted=26 emptyWhileActive=80
  UDP timer dt: 0-4ms=245 4-8ms=255 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=1 8-12ms=4 12-17ms=4 17-25ms=5 25-34ms=5 34-50ms=0 >=50ms=0 max=32.1ms
  dropped movement: events=2 absDx=0 absDy=0


15:13:59.393 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:13:59.393 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 mounted=yes | udpRx iters=1001/s
15:13:59.393 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:13:59.393 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:00.375 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:00.375 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 mounted=yes | udpRx iters=1001/s
15:14:00.375 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:00.375 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:01.394 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:01.394 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 mounted=yes | udpRx iters=1001/s
15:14:01.394 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:01.394 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:02.375 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:02.375 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:02.375 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:02.375 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:03.388 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.2ms
15:14:03.388 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 mounted=yes | udpRx iters=1002/s
15:14:03.388 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:03.388 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:04.376 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:04.376 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:04.376 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:04.376 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:05.394 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:05.394 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:05.394 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:05.394 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:06.377 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:06.377 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:06.411 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:06.411 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:07.395 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:07.395 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:07.395 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:07.395 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:08.415 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:08.415 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:08.415 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:08.415 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:09.399 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:09.399 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:09.399 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:09.399 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:10.417 -> 📈 ESP smooth | UDP rawPkts=43/s datagrams=43/s subframes=57/s malformed=0 queueMax=5 overflow=0 | HID ticks=500/s reports=34/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:10.417 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=999/s
15:14:10.417 ->   HID interval ms <2=1 2-4=4 4-8=3 8-16=6 >=16=20
15:14:10.417 ->   emit delta:    0=0 1=0 2-4=0 4-8=1 8-16=3 16-32=12 32-64=15 64-127=3
15:14:11.404 -> 📈 ESP smooth | UDP rawPkts=49/s datagrams=49/s subframes=81/s malformed=0 queueMax=4 overflow=0 | HID ticks=500/s reports=45/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:11.404 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1000/s
15:14:11.404 ->   HID interval ms <2=3 2-4=2 4-8=4 8-16=12 >=16=24
15:14:11.404 ->   emit delta:    0=0 1=0 2-4=1 4-8=1 8-16=2 16-32=11 32-64=24 64-127=6
15:14:12.420 -> 📈 ESP smooth | UDP rawPkts=23/s datagrams=23/s subframes=33/s malformed=0 queueMax=8 overflow=0 | HID ticks=500/s reports=17/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:12.420 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=999/s
15:14:12.420 ->   HID interval ms <2=1 2-4=1 4-8=0 8-16=4 >=16=11
15:14:12.420 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=7 32-64=6 64-127=4
15:14:13.407 -> 📈 ESP smooth | UDP rawPkts=24/s datagrams=24/s subframes=34/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=18/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:13.407 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=997/s
15:14:13.407 ->   HID interval ms <2=1 2-4=1 4-8=2 8-16=3 >=16=11
15:14:13.407 ->   emit delta:    0=0 1=0 2-4=3 4-8=0 8-16=5 16-32=3 32-64=5 64-127=2
15:14:14.424 -> 📈 ESP smooth | UDP rawPkts=22/s datagrams=22/s subframes=33/s malformed=0 queueMax=5 overflow=0 | HID ticks=500/s reports=17/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:14.424 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=998/s
15:14:14.424 ->   HID interval ms <2=2 2-4=1 4-8=0 8-16=3 >=16=11
15:14:14.424 ->   emit delta:    0=0 1=1 2-4=1 4-8=2 8-16=0 16-32=2 32-64=10 64-127=1
15:14:15.410 -> 📈 ESP smooth | UDP rawPkts=19/s datagrams=19/s subframes=28/s malformed=0 queueMax=5 overflow=0 | HID ticks=500/s reports=15/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:15.410 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1000/s
15:14:15.410 ->   HID interval ms <2=0 2-4=2 4-8=0 8-16=4 >=16=9
15:14:15.410 ->   emit delta:    0=0 1=0 2-4=2 4-8=1 8-16=3 16-32=2 32-64=5 64-127=2
15:14:16.398 -> 📈 ESP smooth | UDP rawPkts=23/s datagrams=23/s subframes=31/s malformed=0 queueMax=5 overflow=0 | HID ticks=500/s reports=18/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:16.431 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=999/s
15:14:16.431 ->   HID interval ms <2=1 2-4=1 4-8=1 8-16=4 >=16=11
15:14:16.431 ->   emit delta:    0=0 1=0 2-4=1 4-8=2 8-16=4 16-32=4 32-64=5 64-127=2
15:14:17.417 -> 📈 ESP smooth | UDP rawPkts=4/s datagrams=4/s subframes=4/s malformed=0 queueMax=1 overflow=0 | HID ticks=500/s reports=4/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:17.417 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:17.417 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=1 >=16=3
15:14:17.417 ->   emit delta:    0=0 1=0 2-4=0 4-8=2 8-16=1 16-32=1 32-64=0 64-127=0
15:14:18.404 -> 📈 ESP smooth | UDP rawPkts=25/s datagrams=25/s subframes=35/s malformed=0 queueMax=4 overflow=0 | HID ticks=500/s reports=19/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:18.404 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=999/s
15:14:18.404 ->   HID interval ms <2=0 2-4=1 4-8=1 8-16=1 >=16=16
15:14:18.404 ->   emit delta:    0=0 1=4 2-4=1 4-8=1 8-16=0 16-32=4 32-64=5 64-127=4
15:14:19.423 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:19.423 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:19.423 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:19.423 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:20.407 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:20.407 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 mounted=yes | udpRx iters=1001/s
15:14:20.440 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:20.440 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:21.428 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:21.428 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:21.428 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:21.428 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:22.413 -> 📈 ESP smooth | UDP rawPkts=28/s datagrams=28/s subframes=34/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=23/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:22.413 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:22.413 ->   HID interval ms <2=1 2-4=0 4-8=0 8-16=7 >=16=15
15:14:22.413 ->   emit delta:    0=0 1=3 2-4=4 4-8=2 8-16=2 16-32=5 32-64=5 64-127=2
15:14:23.431 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:23.431 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 mounted=yes | udpRx iters=1001/s
15:14:23.431 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:23.431 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:24.416 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:24.416 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 mounted=yes | udpRx iters=1001/s
15:14:24.416 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:24.416 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:25.430 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:25.430 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 mounted=yes | udpRx iters=1001/s
15:14:25.430 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:25.430 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:26.446 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:26.446 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 mounted=yes | udpRx iters=1001/s
15:14:26.446 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:26.446 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:27.431 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:27.431 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:27.431 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:27.431 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:28.452 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:28.452 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:28.452 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:28.452 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:29.439 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:29.439 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 mounted=yes | udpRx iters=1001/s
15:14:29.439 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:29.439 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:30.454 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
15:14:30.454 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 mounted=yes | udpRx iters=1001/s
15:14:30.454 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:30.454 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
15:14:31.437 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
15:14:31.437 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
15:14:31.437 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
15:14:31.437 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

## Log 10

UDP motion state: preparing
UDP motion state: ready
Unable to open mach-O at path: /Library/Caches/com.apple.xbs/Binaries/RenderBox/install/Root/System/Library/PrivateFrameworks/RenderBox.framework/default.metallib  Error:2
✅ Bluetooth is ON – ready to scan
Start Scanning
App is being debugged, do not track this hang
Hang detected: 0.68s (debugger attached, not reporting)
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=53 17-25ms=2 25-34ms=0 34-50ms=0 >=50ms=1 max=712.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=143 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=2 4-8ms=61 8-12ms=74 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=267.7ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=121 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=251 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=0 4-8ms=127 8-12ms=123 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=120 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=250 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=0 4-8ms=117 8-12ms=133 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.2ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=72 coalescedSamples=380 motionEvents=371
  touch dt: 0-4ms=0 4-8ms=367 8-12ms=0 12-20ms=2 20-33ms=0 33-50ms=0 >=50ms=2 max=102.2ms
  coalesced dt: 0-4ms=0 4-8ms=369 8-12ms=0 12-20ms=2 20-33ms=0 33-50ms=0 >=50ms=2 max=102.2ms
  pointer: events=371 emitted=371
  speed: 0-50=5 50-150=34 150-300=247 300-600=85 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=438.3
  gain: 0-1.1=0 1.1-1.5=371 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=3 2-4=12 4-8=37 8-16=232 16-32=98 32-64=35 64-127=22 >=127=5 max=152.8
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=13 17-25ms=3 25-34ms=46 34-50ms=13 >=50ms=0 max=47.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=63 subframes=74 capped=4 staleDrops=1 maxBatch=1 maxPending=164
  UDP sender: ticks=250 emitted=74 emptyWhileActive=129
  UDP timer dt: 0-4ms=0 4-8ms=127 8-12ms=123 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=16 17-25ms=22 25-34ms=18 34-50ms=5 >=50ms=0 max=40.0ms
  dropped movement: events=1 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=86 coalescedSamples=478 motionEvents=484
  touch dt: 0-4ms=0 4-8ms=484 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=483 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=484 emitted=484
  speed: 0-50=0 50-150=48 150-300=121 300-600=315 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=565.1
  gain: 0-1.1=0 1.1-1.5=484 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=1 4-8=49 8-16=155 16-32=295 32-64=21 64-127=48 >=127=18 max=179.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=45 34-50ms=21 >=50ms=0 max=39.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=72 subframes=103 capped=16 staleDrops=0 maxBatch=1 maxPending=213
  UDP sender: ticks=250 emitted=103 emptyWhileActive=147
  UDP timer dt: 0-4ms=0 4-8ms=134 8-12ms=117 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=11 17-25ms=27 25-34ms=22 34-50ms=12 >=50ms=0 max=40.1ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=47 coalescedSamples=230 motionEvents=228
  touch dt: 0-4ms=0 4-8ms=223 8-12ms=2 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=2 max=87.5ms
  coalesced dt: 0-4ms=0 4-8ms=223 8-12ms=2 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=2 max=87.5ms
  pointer: events=228 emitted=228
  speed: 0-50=3 50-150=17 150-300=59 300-600=149 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=554.0
  gain: 0-1.1=0 1.1-1.5=228 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=0 2-4=6 4-8=16 8-16=69 16-32=140 32-64=13 64-127=24 >=127=6 max=174.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=49 17-25ms=3 25-34ms=26 34-50ms=12 >=50ms=0 max=49.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=41 subframes=47 capped=5 staleDrops=2 maxBatch=1 maxPending=193
  UDP sender: ticks=251 emitted=48 emptyWhileActive=79
  UDP timer dt: 0-4ms=0 4-8ms=119 8-12ms=131 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=10 17-25ms=15 25-34ms=14 34-50ms=0 >=50ms=0 max=32.2ms
  dropped movement: events=2 absDx=66 absDy=7
📈 Movement diagnostics
  touch: callbacks=44 coalescedSamples=212 motionEvents=208
  touch dt: 0-4ms=0 4-8ms=200 8-12ms=5 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=2 max=70.8ms
  coalesced dt: 0-4ms=0 4-8ms=200 8-12ms=6 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=2 max=70.8ms
  pointer: events=208 emitted=208
  speed: 0-50=24 50-150=52 150-300=18 300-600=98 600-1000=16 1000-1600=0 1600-2400=0 >=2400=0 max=654.8
  gain: 0-1.1=0 1.1-1.5=208 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=2 1-2=24 2-4=35 4-8=27 8-16=24 16-32=97 32-64=19 64-127=18 >=127=9 max=179.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=39 17-25ms=4 25-34ms=28 34-50ms=11 >=50ms=2 max=62.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=33 subframes=47 capped=7 staleDrops=4 maxBatch=1 maxPending=254
  UDP sender: ticks=250 emitted=46 emptyWhileActive=74
  UDP timer dt: 0-4ms=0 4-8ms=125 8-12ms=126 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=5 17-25ms=11 25-34ms=10 34-50ms=4 >=50ms=0 max=40.1ms
  dropped movement: events=4 absDx=1 absDy=3
📈 Movement diagnostics
  touch: callbacks=41 coalescedSamples=200 motionEvents=198
  touch dt: 0-4ms=0 4-8ms=176 8-12ms=20 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=2 max=595.9ms
  coalesced dt: 0-4ms=0 4-8ms=176 8-12ms=21 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=2 max=595.9ms
  pointer: events=198 emitted=198
  speed: 0-50=79 50-150=75 150-300=44 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=239.7
  gain: 0-1.1=0 1.1-1.5=198 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=2 1-2=77 2-4=29 4-8=67 8-16=42 16-32=9 32-64=9 64-127=3 >=127=0 max=82
  BLE: attempts=63 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=6 8-12ms=0 12-17ms=42 17-25ms=1 25-34ms=28 34-50ms=9 >=50ms=3 max=61.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=34 subframes=40 capped=0 staleDrops=5 maxBatch=1 maxPending=97
  UDP sender: ticks=251 emitted=40 emptyWhileActive=80
  UDP timer dt: 0-4ms=0 4-8ms=120 8-12ms=130 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=7 17-25ms=6 25-34ms=12 34-50ms=4 >=50ms=0 max=48.1ms
  dropped movement: events=5 absDx=1 absDy=1
📈 Movement diagnostics
  touch: callbacks=53 coalescedSamples=279 motionEvents=274
  touch dt: 0-4ms=0 4-8ms=263 8-12ms=8 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=2 max=476.0ms
  coalesced dt: 0-4ms=0 4-8ms=266 8-12ms=9 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=2 max=476.0ms
  pointer: events=274 emitted=274
  speed: 0-50=71 50-150=83 150-300=85 300-600=35 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=432.2
  gain: 0-1.1=0 1.1-1.5=274 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=66 2-4=43 4-8=70 8-16=83 16-32=40 32-64=14 64-127=6 >=127=3 max=127.3
  BLE: attempts=86 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=42 17-25ms=1 25-34ms=32 34-50ms=10 >=50ms=1 max=62.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=46 subframes=52 capped=2 staleDrops=2 maxBatch=1 maxPending=184
  UDP sender: ticks=249 emitted=52 emptyWhileActive=99
  UDP timer dt: 0-4ms=0 4-8ms=130 8-12ms=120 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=12 17-25ms=12 25-34ms=15 34-50ms=4 >=50ms=0 max=47.1ms
  dropped movement: events=2 absDx=8 absDy=2
📈 Movement diagnostics
  touch: callbacks=26 coalescedSamples=107 motionEvents=106
  touch dt: 0-4ms=0 4-8ms=91 8-12ms=11 12-20ms=3 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  coalesced dt: 0-4ms=0 4-8ms=91 8-12ms=11 12-20ms=3 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  pointer: events=106 emitted=106
  speed: 0-50=25 50-150=23 150-300=37 300-600=18 600-1000=3 1000-1600=0 1600-2400=0 >=2400=0 max=611.5
  gain: 0-1.1=0 1.1-1.5=106 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=3 1-2=20 2-4=15 4-8=24 8-16=33 16-32=16 32-64=12 64-127=7 >=127=2 max=128.9
  BLE: attempts=98 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=78 17-25ms=1 25-34ms=8 34-50ms=8 >=50ms=3 max=51.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=20 subframes=26 capped=2 staleDrops=3 maxBatch=1 maxPending=221
  UDP sender: ticks=251 emitted=26 emptyWhileActive=42
  UDP timer dt: 0-4ms=0 4-8ms=122 8-12ms=128 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=4 17-25ms=7 25-34ms=3 34-50ms=4 >=50ms=0 max=48.0ms
  dropped movement: events=3 absDx=7 absDy=15


14:57:58.931 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=1274/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
14:57:58.931 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1002/s
14:57:58.931 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
14:57:58.931 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
14:57:59.951 -> 📈 ESP smooth | UDP rawPkts=32/s datagrams=32/s subframes=36/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=28/s reportFails=0 staleDrops=0 lateMax=0.4ms
14:57:59.951 ->   net: wifi=connected ip=192.168.18.125 rssi=-39 mounted=yes | udpRx iters=1001/s
14:57:59.951 ->   HID interval ms <2=1 2-4=0 4-8=1 8-16=5 >=16=20
14:57:59.951 ->   emit delta:    0=0 1=1 2-4=1 4-8=2 8-16=13 16-32=9 32-64=2 64-127=0
14:58:00.934 -> 📈 ESP smooth | UDP rawPkts=28/s datagrams=28/s subframes=34/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=26/s reportFails=0 staleDrops=0 lateMax=0.5ms
14:58:00.934 ->   net: wifi=connected ip=192.168.18.125 rssi=-39 mounted=yes | udpRx iters=1001/s
14:58:00.934 ->   HID interval ms <2=0 2-4=1 4-8=1 8-16=2 >=16=22
14:58:00.934 ->   emit delta:    0=0 1=0 2-4=0 4-8=2 8-16=8 16-32=11 32-64=5 64-127=0
14:58:01.951 -> 📈 ESP smooth | UDP rawPkts=36/s datagrams=36/s subframes=51/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=33/s reportFails=0 staleDrops=1 lateMax=0.4ms
14:58:01.951 ->   net: wifi=connected ip=192.168.18.125 rssi=-39 mounted=yes | udpRx iters=1001/s
14:58:01.951 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=6 >=16=27
14:58:01.951 ->   emit delta:    0=0 1=0 2-4=0 4-8=2 8-16=10 16-32=9 32-64=12 64-127=0
14:58:02.936 -> 📈 ESP smooth | UDP rawPkts=34/s datagrams=34/s subframes=50/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=30/s reportFails=0 staleDrops=1 lateMax=0.4ms
14:58:02.936 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1000/s
14:58:02.936 ->   HID interval ms <2=0 2-4=1 4-8=1 8-16=3 >=16=25
14:58:02.936 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=2 16-32=15 32-64=13 64-127=0
14:58:03.957 -> 📈 ESP smooth | UDP rawPkts=28/s datagrams=28/s subframes=34/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=26/s reportFails=0 staleDrops=0 lateMax=0.5ms
14:58:03.957 ->   net: wifi=connected ip=192.168.18.125 rssi=-39 mounted=yes | udpRx iters=1000/s
14:58:03.957 ->   HID interval ms <2=0 2-4=2 4-8=1 8-16=4 >=16=19
14:58:03.957 ->   emit delta:    0=0 1=0 2-4=0 4-8=1 8-16=3 16-32=15 32-64=7 64-127=0
14:58:04.945 -> 📈 ESP smooth | UDP rawPkts=16/s datagrams=16/s subframes=18/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=14/s reportFails=0 staleDrops=0 lateMax=0.4ms
14:58:04.945 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
14:58:04.945 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=3 >=16=11
14:58:04.945 ->   emit delta:    0=0 1=1 2-4=0 4-8=1 8-16=5 16-32=4 32-64=3 64-127=0
14:58:05.964 -> 📈 ESP smooth | UDP rawPkts=22/s datagrams=22/s subframes=31/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=19/s reportFails=0 staleDrops=0 lateMax=0.4ms
14:58:05.964 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
14:58:05.964 ->   HID interval ms <2=1 2-4=1 4-8=2 8-16=1 >=16=14
14:58:05.964 ->   emit delta:    0=0 1=0 2-4=2 4-8=0 8-16=3 16-32=7 32-64=6 64-127=1
14:58:06.950 -> 📈 ESP smooth | UDP rawPkts=13/s datagrams=13/s subframes=17/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=10/s reportFails=0 staleDrops=0 lateMax=0.5ms
14:58:06.950 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=998/s
14:58:06.950 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=3 >=16=7
14:58:06.950 ->   emit delta:    0=0 1=0 2-4=0 4-8=3 8-16=2 16-32=2 32-64=2 64-127=1
14:58:07.968 -> 📈 ESP smooth | UDP rawPkts=13/s datagrams=13/s subframes=16/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=12/s reportFails=0 staleDrops=0 lateMax=0.4ms
14:58:07.968 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
14:58:07.968 ->   HID interval ms <2=0 2-4=0 4-8=1 8-16=2 >=16=9
14:58:07.968 ->   emit delta:    0=0 1=3 2-4=3 4-8=0 8-16=3 16-32=3 32-64=0 64-127=0
14:58:08.954 -> 📈 ESP smooth | UDP rawPkts=21/s datagrams=21/s subframes=24/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=19/s reportFails=0 staleDrops=0 lateMax=0.5ms
14:58:08.954 ->   net: wifi=connected ip=192.168.18.125 rssi=-38 mounted=yes | udpRx iters=1001/s
14:58:08.954 ->   HID interval ms <2=0 2-4=0 4-8=1 8-16=2 >=16=16
14:58:08.954 ->   emit delta:    0=0 1=3 2-4=3 4-8=7 8-16=3 16-32=3 32-64=0 64-127=0
14:58:09.974 -> 📈 ESP smooth | UDP rawPkts=22/s datagrams=22/s subframes=24/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=19/s reportFails=0 staleDrops=0 lateMax=0.4ms
14:58:09.974 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
14:58:09.974 ->   HID interval ms <2=1 2-4=0 4-8=2 8-16=0 >=16=16
14:58:09.974 ->   emit delta:    0=0 1=1 2-4=5 4-8=3 8-16=7 16-32=3 32-64=0 64-127=0
14:58:10.965 -> 📈 ESP smooth | UDP rawPkts=19/s datagrams=19/s subframes=23/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=15/s reportFails=0 staleDrops=0 lateMax=0.3ms
14:58:10.965 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=1001/s
14:58:10.965 ->   HID interval ms <2=0 2-4=1 4-8=1 8-16=3 >=16=10
14:58:10.965 ->   emit delta:    0=0 1=0 2-4=3 4-8=4 8-16=5 16-32=0 32-64=2 64-127=1
14:58:11.980 -> 📈 ESP smooth | UDP rawPkts=24/s datagrams=24/s subframes=30/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=21/s reportFails=0 staleDrops=0 lateMax=0.4ms
14:58:11.980 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1001/s
14:58:11.980 ->   HID interval ms <2=1 2-4=1 4-8=0 8-16=2 >=16=17
14:58:11.980 ->   emit delta:    0=0 1=3 2-4=3 4-8=1 8-16=5 16-32=4 32-64=5 64-127=0
14:58:12.962 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
14:58:12.962 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=1001/s
14:58:12.962 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
14:58:12.962 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
14:58:13.978 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
14:58:13.978 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1001/s
14:58:13.978 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
14:58:13.978 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
14:58:14.964 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
14:58:14.964 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=1001/s
14:58:14.964 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
14:58:14.964 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
14:58:15.984 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
14:58:15.984 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=1001/s
14:58:15.984 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
14:58:15.984 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
14:58:16.968 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
14:58:16.968 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=1001/s
14:58:16.968 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
14:58:16.968 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
14:58:17.990 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
14:58:17.990 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=1001/s
14:58:17.990 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
14:58:17.990 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
14:58:18.978 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
14:58:18.978 ->   net: wifi=connected ip=192.168.18.125 rssi=-39 mounted=yes | udpRx iters=1001/s
14:58:18.978 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
14:58:18.978 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

## Log 9

UDP motion state: preparing
UDP motion state: ready
Unable to open mach-O at path: /Library/Caches/com.apple.xbs/Binaries/RenderBox/install/Root/System/Library/PrivateFrameworks/RenderBox.framework/default.metallib  Error:2
✅ Bluetooth is ON – ready to scan
Start Scanning
App is being debugged, do not track this hang
Hang detected: 0.49s (debugger attached, not reporting)
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=1 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=44 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=4 4-8ms=19 8-12ms=15 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=556.6ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
App is being debugged, do not track this hang
Hang detected: 0.87s (debugger attached, not reporting)
🔍 Found peripheral: ESP_MouseBridge
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=105 17-25ms=9 25-34ms=1 34-50ms=0 >=50ms=1 max=1381.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=251 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=0 4-8ms=123 8-12ms=128 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
✅ Connected to ESP_MouseBridge
🔍 Starting service discovery...
🧩 Found service: 00001234-0000-1000-8000-00805F9B34FB
📡 Found characteristic: 0000ABCD-0000-1000-8000-00805F9B34FB
✅ Write characteristic ready (props: CBCharacteristicProperties(rawValue: 4))
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=64 17-25ms=18 25-34ms=17 34-50ms=1 >=50ms=1 max=52.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=250 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=0 4-8ms=119 8-12ms=131 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=116 17-25ms=1 25-34ms=0 34-50ms=1 >=50ms=0 max=46.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=250 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=0 4-8ms=131 8-12ms=119 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=40 coalescedSamples=170 motionEvents=168
  touch dt: 0-4ms=0 4-8ms=163 8-12ms=1 12-20ms=1 20-33ms=1 33-50ms=1 >=50ms=1 max=58.3ms
  coalesced dt: 0-4ms=0 4-8ms=163 8-12ms=1 12-20ms=1 20-33ms=1 33-50ms=1 >=50ms=1 max=58.3ms
  pointer: events=168 emitted=168
  speed: 0-50=12 50-150=26 150-300=42 300-600=78 600-1000=10 1000-1600=0 1600-2400=0 >=2400=0 max=698.3
  gain: 0-1.1=0 1.1-1.5=168 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=11 2-4=9 4-8=29 8-16=32 16-32=85 32-64=15 64-127=19 >=127=5 max=127.4
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=4 8-12ms=0 12-17ms=61 17-25ms=28 25-34ms=3 34-50ms=5 >=50ms=2 max=75.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=29 subframes=38 capped=4 staleDrops=3 maxBatch=1 maxPending=230
  UDP sender: ticks=251 emitted=39 emptyWhileActive=50
  UDP timer dt: 0-4ms=0 4-8ms=131 8-12ms=120 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.9ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=8 17-25ms=14 25-34ms=3 34-50ms=2 >=50ms=0 max=40.4ms
  dropped movement: events=3 absDx=9 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=43 coalescedSamples=181 motionEvents=178
  touch dt: 0-4ms=0 4-8ms=168 8-12ms=5 12-20ms=1 20-33ms=1 33-50ms=1 >=50ms=2 max=79.2ms
  coalesced dt: 0-4ms=0 4-8ms=169 8-12ms=5 12-20ms=1 20-33ms=1 33-50ms=1 >=50ms=2 max=79.2ms
  pointer: events=178 emitted=178
  speed: 0-50=14 50-150=21 150-300=44 300-600=99 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=558.0
  gain: 0-1.1=0 1.1-1.5=178 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=12 2-4=15 4-8=20 8-16=40 16-32=103 32-64=11 64-127=12 >=127=7 max=173.4
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=5 8-12ms=0 12-17ms=32 17-25ms=35 25-34ms=8 34-50ms=9 >=50ms=2 max=54.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=32 subframes=43 capped=3 staleDrops=3 maxBatch=1 maxPending=208
  UDP sender: ticks=250 emitted=43 emptyWhileActive=65
  UDP timer dt: 0-4ms=0 4-8ms=124 8-12ms=126 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=6 17-25ms=10 25-34ms=12 34-50ms=1 >=50ms=0 max=38.9ms
  dropped movement: events=3 absDx=0 absDy=3
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=55 coalescedSamples=257 motionEvents=256
  touch dt: 0-4ms=0 4-8ms=254 8-12ms=0 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=0 max=45.9ms
  coalesced dt: 0-4ms=0 4-8ms=254 8-12ms=0 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=0 max=45.9ms
  pointer: events=256 emitted=256
  speed: 0-50=0 50-150=4 150-300=90 300-600=162 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=534.8
  gain: 0-1.1=0 1.1-1.5=256 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=2 4-8=2 8-16=101 16-32=157 32-64=18 64-127=26 >=127=8 max=178.2
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=1 12-17ms=47 17-25ms=52 25-34ms=2 34-50ms=1 >=50ms=1 max=56.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=42 subframes=58 capped=6 staleDrops=1 maxBatch=1 maxPending=212
  UDP sender: ticks=251 emitted=58 emptyWhileActive=75
  UDP timer dt: 0-4ms=0 4-8ms=133 8-12ms=117 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=10 17-25ms=16 25-34ms=13 34-50ms=2 >=50ms=0 max=40.0ms
  dropped movement: events=1 absDx=18 absDy=9
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=42 coalescedSamples=205 motionEvents=204
  touch dt: 0-4ms=0 4-8ms=200 8-12ms=0 12-20ms=3 20-33ms=1 33-50ms=0 >=50ms=0 max=20.8ms
  coalesced dt: 0-4ms=0 4-8ms=200 8-12ms=0 12-20ms=3 20-33ms=1 33-50ms=0 >=50ms=0 max=20.8ms
  pointer: events=204 emitted=204
  speed: 0-50=0 50-150=2 150-300=32 300-600=170 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=599.6
  gain: 0-1.1=0 1.1-1.5=204 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=2 8-16=41 16-32=164 32-64=7 64-127=30 >=127=9 max=170.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=1 12-17ms=63 17-25ms=36 25-34ms=3 34-50ms=1 >=50ms=1 max=54.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=35 subframes=49 capped=9 staleDrops=0 maxBatch=1 maxPending=213
  UDP sender: ticks=250 emitted=49 emptyWhileActive=55
  UDP timer dt: 0-4ms=0 4-8ms=129 8-12ms=122 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=13 17-25ms=12 25-34ms=6 34-50ms=3 >=50ms=0 max=40.6ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=63 coalescedSamples=322 motionEvents=322
  touch dt: 0-4ms=0 4-8ms=322 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=322 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=322 emitted=322
  speed: 0-50=0 50-150=5 150-300=96 300-600=214 600-1000=7 1000-1600=0 1600-2400=0 >=2400=0 max=780.7
  gain: 0-1.1=0 1.1-1.5=322 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=1 4-8=11 8-16=105 16-32=202 32-64=30 64-127=33 >=127=13 max=179.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=37 17-25ms=62 25-34ms=1 34-50ms=0 >=50ms=1 max=58.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=56 subframes=73 capped=11 staleDrops=1 maxBatch=1 maxPending=204
  UDP sender: ticks=251 emitted=73 emptyWhileActive=94
  UDP timer dt: 0-4ms=0 4-8ms=113 8-12ms=137 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=19 17-25ms=21 25-34ms=14 34-50ms=2 >=50ms=0 max=41.0ms
  dropped movement: events=1 absDx=6 absDy=9
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=19 coalescedSamples=94 motionEvents=93
  touch dt: 0-4ms=0 4-8ms=90 8-12ms=2 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=829.2ms
  coalesced dt: 0-4ms=0 4-8ms=90 8-12ms=2 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=829.2ms
  pointer: events=93 emitted=93
  speed: 0-50=7 50-150=9 150-300=49 300-600=28 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=431.3
  gain: 0-1.1=0 1.1-1.5=93 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=7 2-4=6 4-8=7 8-16=48 16-32=30 32-64=6 64-127=6 >=127=2 max=130.3
  BLE: attempts=35 sent=35 blocked=0 readyCb=34 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=1 12-17ms=85 17-25ms=14 25-34ms=3 34-50ms=3 >=50ms=1 max=59.7ms
  BLE send dt: 0-8ms=1 8-12ms=0 12-17ms=17 17-25ms=12 25-34ms=1 34-50ms=2 >=50ms=1 max=59.4ms
  UDP: datagrams=15 subframes=19 capped=2 staleDrops=1 maxBatch=1 maxPending=213
  UDP sender: ticks=250 emitted=19 emptyWhileActive=27
  UDP timer dt: 0-4ms=0 4-8ms=112 8-12ms=139 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=2 17-25ms=9 25-34ms=2 34-50ms=0 >=50ms=0 max=32.0ms
  dropped movement: events=1 absDx=0 absDy=0
📊 Sent 50 packets in 2s, dropped: 1
📈 Movement diagnostics
  touch: callbacks=4 coalescedSamples=10 motionEvents=9
  touch dt: 0-4ms=0 4-8ms=4 8-12ms=2 12-20ms=2 20-33ms=0 33-50ms=0 >=50ms=1 max=283.4ms
  coalesced dt: 0-4ms=0 4-8ms=4 8-12ms=3 12-20ms=2 20-33ms=0 33-50ms=0 >=50ms=1 max=283.4ms
  pointer: events=9 emitted=9
  speed: 0-50=9 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=32.8
  gain: 0-1.1=0 1.1-1.5=9 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=2 1-2=8 2-4=3 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=3.1
  BLE: attempts=20 sent=19 blocked=1 readyCb=20 longestBlock=19.5ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=108 17-25ms=5 25-34ms=1 34-50ms=0 >=50ms=1 max=71.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=14 17-25ms=3 25-34ms=0 34-50ms=1 >=50ms=1 max=71.2ms
  UDP: datagrams=2 subframes=4 capped=0 staleDrops=2 maxBatch=1 maxPending=6
  UDP sender: ticks=250 emitted=4 emptyWhileActive=7
  UDP timer dt: 0-4ms=0 4-8ms=128 8-12ms=122 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=1 34-50ms=1 >=50ms=0 max=40.0ms
  dropped movement: events=2 absDx=6 absDy=0
📊 Sent 4 packets in 2s, dropped: 0

14:08:14.144 -> 🔄 Restarting advertising...
14:20:45.423 -> 🔧 Initializing Custom HID Mouse...
14:20:45.423 -> ✅ Custom USB HID Mouse initialized
14:20:45.423 -> 🔧 Initializing UDP motion POC...
14:20:45.489 -> 📡 Connecting to Wi-Fi SSID: LOSUS WIFI_0122......
14:20:46.995 -> ✅ UDP motion listening on 192.168.18.125:4210
14:20:46.995 -> 🔧 Initializing NimBLE...🚦 udp-rx task running on core 0
14:20:46.995 -> 
14:20:46.995 -> ✅ BLE advertising started
14:20:46.995 -> 📱 Ready for iPhone connection
14:20:46.995 -> 🎧 Listening for writes...
14:20:46.995 -> 
14:20:47.225 -> 
14:20:48.210 -> 📏 MTU updated to: 247
14:20:48.210 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:20:48.210 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=1002 rawPkts=0
14:20:48.210 ->   BLE param: mode=snappy switches=0
14:20:48.210 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:48.210 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:48.210 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:49.232 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=124/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:20:49.232 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=998 rawPkts=0
14:20:49.232 ->   BLE param: mode=snappy switches=0
14:20:49.232 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:49.232 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:49.232 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:50.216 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:20:50.216 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 | udpRx iters=1000 rawPkts=0
14:20:50.216 ->   BLE param: mode=snappy switches=0
14:20:50.216 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:50.216 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:50.216 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:51.232 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:20:51.232 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=1000 rawPkts=0
14:20:51.232 ->   BLE param: mode=snappy switches=0
14:20:51.232 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:51.232 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:51.232 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:52.217 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=14/s subframes=20/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.1ms sendReturnFalse=20
14:20:52.217 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 | udpRx iters=999 rawPkts=14
14:20:52.217 ->   BLE param: mode=snappy switches=2
14:20:52.217 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:52.217 ->   UDP interval ms <8=4 8-12=2 12-17=1 17-25=3 25-34=0 34-50=0 >=50=3
14:20:52.217 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:53.235 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=15/s subframes=18/s seqGaps=0 malformed=0 queueMax=3 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.2ms sendReturnFalse=18
14:20:53.235 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=998 rawPkts=15
14:20:53.235 ->   BLE param: mode=snappy switches=2
14:20:53.235 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:53.235 ->   UDP interval ms <8=4 8-12=2 12-17=3 17-25=2 25-34=0 34-50=0 >=50=4
14:20:53.235 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:54.219 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=15/s subframes=20/s seqGaps=0 malformed=0 queueMax=3 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=20
14:20:54.219 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 | udpRx iters=999 rawPkts=15
14:20:54.219 ->   BLE param: mode=snappy switches=2
14:20:54.219 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:54.219 ->   UDP interval ms <8=5 8-12=0 12-17=2 17-25=0 25-34=3 34-50=0 >=50=5
14:20:54.219 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:55.237 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=17/s subframes=23/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=22
14:20:55.237 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=998 rawPkts=17
14:20:55.237 ->   BLE param: mode=snappy switches=2
14:20:55.237 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:55.237 ->   UDP interval ms <8=6 8-12=2 12-17=1 17-25=0 25-34=2 34-50=1 >=50=5
14:20:55.237 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:56.224 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=20/s subframes=27/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.1ms sendReturnFalse=26
14:20:56.224 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=997 rawPkts=20
14:20:56.224 ->   BLE param: mode=backoff switches=1
14:20:56.224 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:56.224 ->   UDP interval ms <8=9 8-12=1 12-17=1 17-25=3 25-34=0 34-50=1 >=50=5
14:20:56.224 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:57.208 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=22/s subframes=31/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.2ms sendReturnFalse=31
14:20:57.208 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 | udpRx iters=994 rawPkts=22
14:20:57.208 ->   BLE param: mode=snappy switches=1
14:20:57.208 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:57.208 ->   UDP interval ms <8=13 8-12=0 12-17=1 17-25=0 25-34=1 34-50=1 >=50=6
14:20:57.208 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:58.227 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:20:58.227 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 | udpRx iters=1000 rawPkts=0
14:20:58.227 ->   BLE param: mode=snappy switches=0
14:20:58.227 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:58.227 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:58.227 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:59.211 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=32/s subframes=44/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=42
14:20:59.211 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=998 rawPkts=32
14:20:59.211 ->   BLE param: mode=backoff switches=1
14:20:59.211 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:20:59.211 ->   UDP interval ms <8=15 8-12=3 12-17=3 17-25=0 25-34=3 34-50=0 >=50=8
14:20:59.211 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:00.223 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=43/s subframes=56/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=57
14:21:00.223 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=998 rawPkts=43
14:21:00.223 ->   BLE param: mode=backoff switches=0
14:21:00.223 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:00.223 ->   UDP interval ms <8=18 8-12=2 12-17=5 17-25=6 25-34=0 34-50=2 >=50=10
14:21:00.223 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:01.237 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=16/s subframes=22/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=23
14:21:01.237 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=998 rawPkts=16
14:21:01.237 ->   BLE param: mode=snappy switches=1
14:21:01.237 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:01.237 ->   UDP interval ms <8=6 8-12=0 12-17=2 17-25=2 25-34=1 34-50=1 >=50=4
14:21:01.237 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:02.222 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:21:02.222 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 | udpRx iters=1000 rawPkts=0
14:21:02.222 ->   BLE param: mode=snappy switches=0
14:21:02.222 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:02.222 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:02.222 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:03.206 -> 📈 ESP movement diagnostics | BLE rx=31/s seqGaps=0 malformed=0 | UDP datagrams=11/s subframes=14/s seqGaps=0 malformed=0 queueMax=3 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=15
14:21:03.239 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=999 rawPkts=11
14:21:03.239 ->   BLE param: mode=snappy switches=0
14:21:03.239 ->   BLE interval ms <8=16 8-12=0 12-17=0 17-25=0 25-34=9 34-50=0 >=50=5
14:21:03.239 ->   UDP interval ms <8=3 8-12=0 12-17=0 17-25=5 25-34=0 34-50=0 >=50=3
14:21:03.239 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:04.225 -> 📈 ESP movement diagnostics | BLE rx=23/s seqGaps=1 malformed=0 | UDP datagrams=6/s subframes=9/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=8
14:21:04.225 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=999 rawPkts=6
14:21:04.225 ->   BLE param: mode=snappy switches=0
14:21:04.225 ->   BLE interval ms <8=12 8-12=0 12-17=0 17-25=0 25-34=6 34-50=0 >=50=5
14:21:04.225 ->   UDP interval ms <8=2 8-12=1 12-17=0 17-25=0 25-34=1 34-50=0 >=50=2
14:21:04.225 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:05.211 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.2ms sendReturnFalse=0
14:21:05.211 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=999 rawPkts=0
14:21:05.211 ->   BLE param: mode=snappy switches=0
14:21:05.211 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:05.211 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:05.211 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:06.232 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:21:06.232 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 | udpRx iters=1000 rawPkts=0
14:21:06.232 ->   BLE param: mode=snappy switches=0
14:21:06.232 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:06.232 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:06.232 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:21:06.726 -> 🔌 iPhone disconnected, reason: 531
14:21:07.219 -> 🔄 Restarting advertising...

## Log 8

UDP motion state: preparing
UDP motion state: ready
Unable to open mach-O at path: /Library/Caches/com.apple.xbs/Binaries/RenderBox/install/Root/System/Library/PrivateFrameworks/RenderBox.framework/default.metallib  Error:2
App is being debugged, do not track this hang
Hang detected: 0.46s (debugger attached, not reporting)
✅ Bluetooth is ON – ready to scan
Start Scanning
App is being debugged, do not track this hang
Hang detected: 0.73s (debugger attached, not reporting)
🔍 Found peripheral: ESP_MouseBridge
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=3 17-25ms=0 25-34ms=2 34-50ms=0 >=50ms=1 max=86.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=64 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=2 4-8ms=32 8-12ms=24 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=462.8ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
✅ Connected to ESP_MouseBridge
🔍 Starting service discovery...
🧩 Found service: 00001234-0000-1000-8000-00805F9B34FB
📡 Found characteristic: 0000ABCD-0000-1000-8000-00805F9B34FB
✅ Write characteristic ready (props: CBCharacteristicProperties(rawValue: 4))
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=70 17-25ms=18 25-34ms=15 34-50ms=0 >=50ms=1 max=50.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=250 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=0 4-8ms=121 8-12ms=129 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=32 coalescedSamples=155 motionEvents=154
  touch dt: 0-4ms=0 4-8ms=151 8-12ms=0 12-20ms=2 20-33ms=0 33-50ms=1 >=50ms=0 max=43.5ms
  coalesced dt: 0-4ms=0 4-8ms=151 8-12ms=0 12-20ms=2 20-33ms=0 33-50ms=1 >=50ms=0 max=43.5ms
  pointer: events=154 emitted=154
  speed: 0-50=4 50-150=42 150-300=106 300-600=2 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=311.4
  gain: 0-1.1=0 1.1-1.5=154 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=4 2-4=6 4-8=40 8-16=103 16-32=4 32-64=20 64-127=6 >=127=0 max=115.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=1 12-17ms=70 17-25ms=26 25-34ms=3 34-50ms=4 >=50ms=1 max=54.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=25 subframes=29 capped=0 staleDrops=2 maxBatch=1 maxPending=144
  UDP sender: ticks=251 emitted=29 emptyWhileActive=49
  UDP timer dt: 0-4ms=0 4-8ms=130 8-12ms=121 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=9 17-25ms=8 25-34ms=3 34-50ms=3 >=50ms=0 max=40.7ms
  dropped movement: events=2 absDx=0 absDy=32
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=50 coalescedSamples=222 motionEvents=220
  touch dt: 0-4ms=0 4-8ms=213 8-12ms=1 12-20ms=2 20-33ms=1 33-50ms=0 >=50ms=3 max=104.2ms
  coalesced dt: 0-4ms=0 4-8ms=213 8-12ms=1 12-20ms=2 20-33ms=1 33-50ms=0 >=50ms=3 max=104.2ms
  pointer: events=220 emitted=220
  speed: 0-50=14 50-150=27 150-300=96 300-600=83 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=445.1
  gain: 0-1.1=0 1.1-1.5=220 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=2 1-2=12 2-4=7 4-8=31 8-16=91 16-32=89 32-64=14 64-127=16 >=127=5 max=140.7
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=0 12-17ms=30 17-25ms=38 25-34ms=10 34-50ms=7 >=50ms=2 max=57.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=40 subframes=47 capped=1 staleDrops=3 maxBatch=1 maxPending=153
  UDP sender: ticks=250 emitted=47 emptyWhileActive=80
  UDP timer dt: 0-4ms=0 4-8ms=127 8-12ms=123 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=10 17-25ms=12 25-34ms=15 34-50ms=0 >=50ms=0 max=32.2ms
  dropped movement: events=3 absDx=20 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=57 coalescedSamples=269 motionEvents=261
  touch dt: 0-4ms=0 4-8ms=258 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=3 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=259 8-12ms=0 12-20ms=1 20-33ms=0 33-50ms=3 >=50ms=0 max=45.8ms
  pointer: events=261 emitted=261
  speed: 0-50=7 50-150=56 150-300=120 300-600=78 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=548.8
  gain: 0-1.1=0 1.1-1.5=261 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=5 2-4=28 4-8=34 8-16=126 16-32=82 32-64=19 64-127=16 >=127=5 max=161.2
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=33 17-25ms=47 25-34ms=9 34-50ms=2 >=50ms=2 max=61.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=43 subframes=54 capped=1 staleDrops=2 maxBatch=1 maxPending=154
  UDP sender: ticks=251 emitted=54 emptyWhileActive=85
  UDP timer dt: 0-4ms=0 4-8ms=127 8-12ms=123 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=11 17-25ms=15 25-34ms=11 34-50ms=3 >=50ms=0 max=40.2ms
  dropped movement: events=2 absDx=1 absDy=1
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=82 coalescedSamples=396 motionEvents=395
  touch dt: 0-4ms=0 4-8ms=389 8-12ms=3 12-20ms=1 20-33ms=1 33-50ms=0 >=50ms=1 max=54.2ms
  coalesced dt: 0-4ms=0 4-8ms=389 8-12ms=3 12-20ms=1 20-33ms=1 33-50ms=0 >=50ms=1 max=54.2ms
  pointer: events=395 emitted=395
  speed: 0-50=6 50-150=47 150-300=113 300-600=229 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=449.9
  gain: 0-1.1=0 1.1-1.5=395 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=2 1-2=5 2-4=10 4-8=46 8-16=134 16-32=209 32-64=26 64-127=39 >=127=9 max=144.5
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=12 17-25ms=78 25-34ms=4 34-50ms=0 >=50ms=1 max=55.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=64 subframes=85 capped=5 staleDrops=1 maxBatch=1 maxPending=197
  UDP sender: ticks=250 emitted=85 emptyWhileActive=126
  UDP timer dt: 0-4ms=0 4-8ms=122 8-12ms=128 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=14 17-25ms=22 25-34ms=21 34-50ms=6 >=50ms=0 max=40.7ms
  dropped movement: events=1 absDx=10 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=39 coalescedSamples=196 motionEvents=200
  touch dt: 0-4ms=0 4-8ms=198 8-12ms=1 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  coalesced dt: 0-4ms=0 4-8ms=198 8-12ms=1 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  pointer: events=200 emitted=200
  speed: 0-50=1 50-150=19 150-300=12 300-600=168 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=537.1
  gain: 0-1.1=0 1.1-1.5=200 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=3 2-4=3 4-8=15 8-16=16 16-32=171 32-64=10 64-127=23 >=127=9 max=179.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=1 12-17ms=53 17-25ms=44 25-34ms=5 34-50ms=0 >=50ms=1 max=57.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=34 subframes=51 capped=9 staleDrops=2 maxBatch=1 maxPending=265
  UDP sender: ticks=250 emitted=51 emptyWhileActive=55
  UDP timer dt: 0-4ms=0 4-8ms=125 8-12ms=125 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=10 17-25ms=12 25-34ms=11 34-50ms=0 >=50ms=0 max=32.7ms
  dropped movement: events=2 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=28 coalescedSamples=130 motionEvents=129
  touch dt: 0-4ms=0 4-8ms=118 8-12ms=7 12-20ms=2 20-33ms=0 33-50ms=0 >=50ms=2 max=729.2ms
  coalesced dt: 0-4ms=0 4-8ms=118 8-12ms=7 12-20ms=2 20-33ms=0 33-50ms=0 >=50ms=2 max=729.2ms
  pointer: events=129 emitted=129
  speed: 0-50=16 50-150=34 150-300=54 300-600=25 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=403.2
  gain: 0-1.1=0 1.1-1.5=129 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=3 1-2=15 2-4=14 4-8=24 8-16=56 16-32=31 32-64=9 64-127=5 >=127=2 max=127.0
  BLE: attempts=76 sent=76 blocked=0 readyCb=76 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=1 12-17ms=66 17-25ms=30 25-34ms=4 34-50ms=2 >=50ms=1 max=60.1ms
  BLE send dt: 0-8ms=1 8-12ms=1 12-17ms=40 17-25ms=28 25-34ms=3 34-50ms=1 >=50ms=1 max=59.8ms
  UDP: datagrams=23 subframes=30 capped=2 staleDrops=3 maxBatch=1 maxPending=150
  UDP sender: ticks=250 emitted=30 emptyWhileActive=44
  UDP timer dt: 0-4ms=0 4-8ms=123 8-12ms=128 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=5 17-25ms=9 25-34ms=5 34-50ms=1 >=50ms=0 max=40.1ms
  dropped movement: events=3 absDx=0 absDy=0
📊 Sent 89 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=7 coalescedSamples=15 motionEvents=13
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=6 12-20ms=1 20-33ms=2 33-50ms=2 >=50ms=2 max=633.4ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=8 12-20ms=1 20-33ms=2 33-50ms=2 >=50ms=2 max=633.4ms
  pointer: events=13 emitted=13
  speed: 0-50=13 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=20.8
  gain: 0-1.1=0 1.1-1.5=13 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=4 1-2=9 2-4=6 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=3
  BLE: attempts=13 sent=13 blocked=0 readyCb=13 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=2 12-17ms=101 17-25ms=6 25-34ms=1 34-50ms=1 >=50ms=2 max=60.7ms
  BLE send dt: 0-8ms=0 8-12ms=2 12-17ms=2 17-25ms=6 25-34ms=0 34-50ms=1 >=50ms=2 max=60.4ms
  UDP: datagrams=6 subframes=6 capped=0 staleDrops=6 maxBatch=1 maxPending=3
  UDP sender: ticks=251 emitted=6 emptyWhileActive=16
  UDP timer dt: 0-4ms=0 4-8ms=121 8-12ms=129 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=6 absDx=5 absDy=0

14:07:44.796 -> 🔧 Initializing Custom HID Mouse...
14:07:44.796 -> ✅ Custom USB HID Mouse initialized
14:07:44.796 -> 🔧 Initializing UDP motion POC...
14:07:44.829 -> 📡 Connecting to Wi-Fi SSID: LOSUS WIFI_0122......
14:07:46.343 -> ✅ UDP motion listening on 192.168.18.125:4210
14:07:46.343 -> 🔧 Initializing NimBLE...🚦 udp-rx task running on core 0
14:07:46.343 -> 
14:07:46.343 -> ✅ BLE advertising started
14:07:46.343 -> 📱 Ready for iPhone connection
14:07:46.343 -> 🎧 Listening for writes...
14:07:46.343 -> 
14:07:57.318 -> 
14:07:57.680 -> 📏 MTU updated to: 247
14:07:58.338 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:07:58.338 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 | udpRx iters=1003 rawPkts=0
14:07:58.338 ->   BLE param: mode=snappy switches=0
14:07:58.338 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:07:58.338 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:07:58.338 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:07:59.326 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:07:59.326 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 | udpRx iters=998 rawPkts=0
14:07:59.326 ->   BLE param: mode=snappy switches=0
14:07:59.326 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:07:59.326 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:07:59.326 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:00.312 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:08:00.312 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 | udpRx iters=999 rawPkts=0
14:08:00.312 ->   BLE param: mode=snappy switches=0
14:08:00.312 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:00.312 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:00.312 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:01.331 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:08:01.331 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 | udpRx iters=999 rawPkts=0
14:08:01.331 ->   BLE param: mode=snappy switches=0
14:08:01.331 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:01.331 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:01.331 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:02.317 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:08:02.317 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 | udpRx iters=1000 rawPkts=0
14:08:02.317 ->   BLE param: mode=snappy switches=0
14:08:02.317 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:02.317 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:02.317 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:03.334 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:08:03.334 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 | udpRx iters=1000 rawPkts=0
14:08:03.334 ->   BLE param: mode=snappy switches=0
14:08:03.334 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:03.334 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:03.334 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:04.320 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:08:04.320 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 | udpRx iters=1000 rawPkts=0
14:08:04.320 ->   BLE param: mode=snappy switches=0
14:08:04.320 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:04.320 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:04.320 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0

14:08:05.308 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:08:05.308 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 | udpRx iters=1000 rawPkts=0
14:08:05.341 ->   BLE param: mode=snappy switches=0
14:08:05.341 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:05.341 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:05.341 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:06.325 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:08:06.325 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 | udpRx iters=1000 rawPkts=0
14:08:06.325 ->   BLE param: mode=snappy switches=0
14:08:06.325 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:06.325 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:06.325 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:07.311 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:08:07.311 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 | udpRx iters=1000 rawPkts=0
14:08:07.311 ->   BLE param: mode=snappy switches=0
14:08:07.311 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:07.311 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:07.311 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:08.328 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:08:08.328 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 | udpRx iters=999 rawPkts=0
14:08:08.328 ->   BLE param: mode=snappy switches=0
14:08:08.328 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:08.328 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:08.328 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:09.311 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:08:09.311 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 | udpRx iters=1000 rawPkts=0
14:08:09.311 ->   BLE param: mode=snappy switches=0
14:08:09.311 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:09.311 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:09.311 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:10.332 -> 📈 ESP movement diagnostics | BLE rx=29/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=1
14:08:10.332 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 | udpRx iters=998 rawPkts=0
14:08:10.332 ->   BLE param: mode=snappy switches=0
14:08:10.332 ->   BLE interval ms <8=14 8-12=0 12-17=0 17-25=0 25-34=10 34-50=0 >=50=4
14:08:10.332 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:10.332 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:11.317 -> 📈 ESP movement diagnostics | BLE rx=50/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:08:11.317 ->   net: wifi=connected ip=192.168.18.125 rssi=-32 | udpRx iters=1000 rawPkts=0
14:08:11.317 ->   BLE param: mode=snappy switches=0
14:08:11.317 ->   BLE interval ms <8=27 8-12=0 12-17=0 17-25=0 25-34=13 34-50=0 >=50=10
14:08:11.317 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:11.317 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:12.338 -> 📈 ESP movement diagnostics | BLE rx=10/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=1
14:08:12.338 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 | udpRx iters=1000 rawPkts=0
14:08:12.338 ->   BLE param: mode=snappy switches=0
14:08:12.338 ->   BLE interval ms <8=5 8-12=0 12-17=0 17-25=0 25-34=3 34-50=0 >=50=2
14:08:12.338 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:12.338 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:13.321 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
14:08:13.321 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 | udpRx iters=1000 rawPkts=0
14:08:13.321 ->   BLE param: mode=snappy switches=0
14:08:13.321 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:13.321 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:13.321 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:08:13.652 -> 🔌 iPhone disconnected, reason: 531
14:08:14.144 -> 🔄 Restarting advertising...

## Log 7

UDP motion state: preparing
UDP motion state: ready
Unable to open mach-O at path: /Library/Caches/com.apple.xbs/Binaries/RenderBox/install/Root/System/Library/PrivateFrameworks/RenderBox.framework/default.metallib  Error:2
App is being debugged, do not track this hang
Hang detected: 0.28s (debugger attached, not reporting)
✅ Bluetooth is ON – ready to scan
Start Scanning
App is being debugged, do not track this hang
Hang detected: 0.35s (debugger attached, not reporting)
🔍 Found peripheral: ESP_MouseBridge
✅ Connected to ESP_MouseBridge
🔍 Starting service discovery...
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=54 17-25ms=0 25-34ms=2 34-50ms=0 >=50ms=1 max=403.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP timer dt: 0-4ms=3 4-8ms=62 8-12ms=80 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=278.6ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
🧩 Found service: 00001234-0000-1000-8000-00805F9B34FB
📡 Found characteristic: 0000ABCD-0000-1000-8000-00805F9B34FB
✅ Write characteristic ready (props: CBCharacteristicProperties(rawValue: 4))
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=9 coalescedSamples=41 motionEvents=40
  touch dt: 0-4ms=0 4-8ms=39 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=109.3ms
  coalesced dt: 0-4ms=0 4-8ms=39 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=109.3ms
  pointer: events=40 emitted=40
  speed: 0-50=1 50-150=8 150-300=29 300-600=2 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=310.5
  gain: 0-1.1=0 1.1-1.5=40 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=1 1-2=9 2-4=26 4-8=5 8-16=4 16-32=1 32-64=0 64-127=0 >=127=0 max=16.4
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=56 17-25ms=19 25-34ms=18 34-50ms=4 >=50ms=0 max=48.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=5 subframes=6 capped=0 staleDrops=0 maxBatch=1 maxPending=40
  UDP timer dt: 0-4ms=0 4-8ms=131 8-12ms=119 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.9ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=2 25-34ms=0 34-50ms=2 >=50ms=0 max=40.6ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=98 coalescedSamples=476 motionEvents=476
  touch dt: 0-4ms=0 4-8ms=476 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=476 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=476 emitted=476
  speed: 0-50=4 50-150=104 150-300=314 300-600=54 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=361.4
  gain: 0-1.1=0 1.1-1.5=476 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=32 1-2=92 2-4=313 4-8=58 8-16=58 16-32=22 32-64=2 64-127=0 >=127=0 max=34.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=94 25-34ms=1 34-50ms=2 >=50ms=0 max=38.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=54 subframes=101 capped=0 staleDrops=1 maxBatch=1 maxPending=43
  UDP timer dt: 0-4ms=0 4-8ms=132 8-12ms=119 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.9ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=1 17-25ms=10 25-34ms=1 34-50ms=41 >=50ms=0 max=41.1ms
  dropped movement: events=1 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=98 coalescedSamples=484 motionEvents=484
  touch dt: 0-4ms=0 4-8ms=484 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=484 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=484 emitted=484
  speed: 0-50=9 50-150=144 150-300=283 300-600=48 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=393.0
  gain: 0-1.1=0 1.1-1.5=484 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=73 1-2=102 2-4=281 4-8=60 8-16=42 16-32=25 32-64=1 64-127=0 >=127=0 max=32.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=94 25-34ms=0 34-50ms=2 >=50ms=0 max=41.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=59 subframes=100 capped=1 staleDrops=0 maxBatch=1 maxPending=51
  UDP timer dt: 0-4ms=0 4-8ms=123 8-12ms=127 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=1 17-25ms=17 25-34ms=4 34-50ms=37 >=50ms=0 max=41.0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=95 coalescedSamples=460 motionEvents=458
  touch dt: 0-4ms=0 4-8ms=449 8-12ms=6 12-20ms=1 20-33ms=2 33-50ms=0 >=50ms=0 max=25.0ms
  coalesced dt: 0-4ms=0 4-8ms=449 8-12ms=8 12-20ms=1 20-33ms=2 33-50ms=0 >=50ms=0 max=25.0ms
  pointer: events=458 emitted=458
  speed: 0-50=9 50-150=65 150-300=71 300-600=208 600-1000=101 1000-1600=4 1600-2400=0 >=2400=0 max=1009.1
  gain: 0-1.1=0 1.1-1.5=458 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=34 1-2=54 2-4=85 4-8=208 8-16=124 16-32=42 32-64=35 64-127=0 >=127=0 max=45.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=1 12-17ms=0 17-25ms=83 25-34ms=1 34-50ms=5 >=50ms=0 max=42.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=70 subframes=124 capped=30 staleDrops=0 maxBatch=1 maxPending=88
  UDP timer dt: 0-4ms=0 4-8ms=123 8-12ms=127 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms

  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=10 17-25ms=30 25-34ms=12 34-50ms=18 >=50ms=0 max=47.8ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=22 coalescedSamples=94 motionEvents=93
  touch dt: 0-4ms=0 4-8ms=90 8-12ms=2 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=79.2ms
  coalesced dt: 0-4ms=0 4-8ms=90 8-12ms=2 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=79.2ms
  pointer: events=93 emitted=93
  speed: 0-50=0 50-150=15 150-300=15 300-600=42 600-1000=21 1000-1600=0 1600-2400=0 >=2400=0 max=900.8
  gain: 0-1.1=0 1.1-1.5=93 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=4 1-2=8 2-4=17 4-8=45 8-16=26 16-32=9 32-64=7 64-127=0 >=127=0 max=41.2
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=84 17-25ms=16 25-34ms=2 34-50ms=2 >=50ms=3 max=58.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=14 subframes=23 capped=5 staleDrops=2 maxBatch=1 maxPending=91
  UDP timer dt: 0-4ms=0 4-8ms=127 8-12ms=123 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=1 17-25ms=7 25-34ms=2 34-50ms=3 >=50ms=0 max=40.1ms
  dropped movement: events=2 absDx=21 absDy=36
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=55 coalescedSamples=264 motionEvents=262
  touch dt: 0-4ms=0 4-8ms=260 8-12ms=0 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=1 max=54.4ms
  coalesced dt: 0-4ms=0 4-8ms=261 8-12ms=0 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=1 max=54.4ms
  pointer: events=262 emitted=262
  speed: 0-50=2 50-150=68 150-300=114 300-600=78 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=564.4
  gain: 0-1.1=0 1.1-1.5=262 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=18 1-2=57 2-4=117 4-8=87 8-16=20 16-32=16 32-64=4 64-127=0 >=127=0 max=34.9
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=49 17-25ms=51 25-34ms=3 34-50ms=0 >=50ms=1 max=50.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=33 subframes=57 capped=4 staleDrops=0 maxBatch=1 maxPending=49
  UDP timer dt: 0-4ms=0 4-8ms=123 8-12ms=128 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=1 17-25ms=10 25-34ms=5 34-50ms=16 >=50ms=0 max=40.5ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=48 coalescedSamples=209 motionEvents=206
  touch dt: 0-4ms=2 4-8ms=202 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=1 max=70.8ms
  coalesced dt: 0-4ms=2 4-8ms=202 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=1 max=70.8ms
  pointer: events=206 emitted=206
  speed: 0-50=1 50-150=2 150-300=41 300-600=148 600-1000=14 1000-1600=0 1600-2400=0 >=2400=0 max=629.8
  gain: 0-1.1=0 1.1-1.5=206 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=4 2-4=48 4-8=156 8-16=14 16-32=27 32-64=9 64-127=0 >=127=0 max=43.9
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=4 8-12ms=0 12-17ms=41 17-25ms=36 25-34ms=4 34-50ms=6 >=50ms=4 max=55.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=29 subframes=52 capped=8 staleDrops=4 maxBatch=1 maxPending=61
  UDP timer dt: 0-4ms=0 4-8ms=125 8-12ms=125 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=4 17-25ms=9 25-34ms=6 34-50ms=7 >=50ms=0 max=40.5ms
  dropped movement: events=4 absDx=15 absDy=49
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=74 coalescedSamples=312 motionEvents=306
  touch dt: 0-4ms=6 4-8ms=299 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=26.1ms
  coalesced dt: 0-4ms=6 4-8ms=299 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=26.1ms
  pointer: events=306 emitted=306
  speed: 0-50=0 50-150=4 150-300=72 300-600=206 600-1000=24 1000-1600=0 1600-2400=0 >=2400=0 max=632.9
  gain: 0-1.1=0 1.1-1.5=306 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=8 2-4=72 4-8=224 8-16=35 16-32=23 32-64=22 64-127=0 >=127=0 max=42.5
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=1 12-17ms=12 17-25ms=33 25-34ms=7 34-50ms=15 >=50ms=5 max=58.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=45 subframes=78 capped=17 staleDrops=5 maxBatch=1 maxPending=71
  UDP timer dt: 0-4ms=0 4-8ms=131 8-12ms=120 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=4 17-25ms=23 25-34ms=5 34-50ms=7 >=50ms=0 max=40.5ms
  dropped movement: events=5 absDx=75 absDy=39
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=90 coalescedSamples=441 motionEvents=440
  touch dt: 0-4ms=0 4-8ms=440 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=440 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=440 emitted=440
  speed: 0-50=2 50-150=10 150-300=54 300-600=304 600-1000=70 1000-1600=0 1600-2400=0 >=2400=0 max=907.8
  gain: 0-1.1=0 1.1-1.5=440 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=8 1-2=8 2-4=71 4-8=303 8-16=78 16-32=58 32-64=30 64-127=0 >=127=0 max=45.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=4 17-25ms=90 25-34ms=1 34-50ms=0 >=50ms=1 max=56.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=69 subframes=116 capped=28 staleDrops=1 maxBatch=1 maxPending=89
  UDP timer dt: 0-4ms=0 4-8ms=127 8-12ms=124 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=14 17-25ms=29 25-34ms=14 34-50ms=11 >=50ms=0 max=40.0ms
  dropped movement: events=1 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=82 coalescedSamples=402 motionEvents=398
  touch dt: 0-4ms=4 4-8ms=392 8-12ms=1 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=0 max=12.5ms
  coalesced dt: 0-4ms=4 4-8ms=393 8-12ms=1 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=0 max=12.5ms
  pointer: events=398 emitted=398
  speed: 0-50=6 50-150=22 150-300=49 300-600=291 600-1000=30 1000-1600=0 1600-2400=0 >=2400=0 max=692.0
  gain: 0-1.1=0 1.1-1.5=398 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=15 1-2=14 2-4=68 4-8=287 8-16=39 16-32=45 32-64=21 64-127=0 >=127=0 max=45.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=0 12-17ms=11 17-25ms=76 25-34ms=1 34-50ms=0 >=50ms=3 max=57.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=59 subframes=91 capped=16 staleDrops=3 maxBatch=1 maxPending=71
  UDP timer dt: 0-4ms=0 4-8ms=131 8-12ms=120 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=6 17-25ms=30 25-34ms=10 34-50ms=10 >=50ms=0 max=40.3ms
  dropped movement: events=3 absDx=24 absDy=25
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=70 coalescedSamples=329 motionEvents=326
  touch dt: 0-4ms=2 4-8ms=322 8-12ms=0 12-20ms=0 20-33ms=2 33-50ms=0 >=50ms=0 max=29.2ms
  coalesced dt: 0-4ms=2 4-8ms=322 8-12ms=0 12-20ms=0 20-33ms=2 33-50ms=0 >=50ms=0 max=29.2ms
  pointer: events=326 emitted=326
  speed: 0-50=0 50-150=2 150-300=71 300-600=222 600-1000=23 1000-1600=8 1600-2400=0 >=2400=0 max=1147.4
  gain: 0-1.1=0 1.1-1.5=326 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=12 2-4=81 4-8=216 8-16=38 16-32=35 32-64=20 64-127=0 >=127=0 max=40.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=2 12-17ms=14 17-25ms=63 25-34ms=5 34-50ms=2 >=50ms=3 max=58.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=47 subframes=76 capped=13 staleDrops=3 maxBatch=1 maxPending=110
  UDP timer dt: 0-4ms=0 4-8ms=120 8-12ms=130 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=8 17-25ms=20 25-34ms=5 34-50ms=12 >=50ms=0 max=40.1ms
  dropped movement: events=3 absDx=21 absDy=86
left clicked and sent
📊 Sent 2 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=76 coalescedSamples=351 motionEvents=348
  touch dt: 0-4ms=2 4-8ms=345 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=54.2ms
  coalesced dt: 0-4ms=2 4-8ms=345 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=54.2ms
  pointer: events=348 emitted=348
  speed: 0-50=1 50-150=11 150-300=169 300-600=142 600-1000=25 1000-1600=0 1600-2400=0 >=2400=0 max=990.6
  gain: 0-1.1=0 1.1-1.5=348 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=23 2-4=167 4-8=139 8-16=56 16-32=34 32-64=10 64-127=0 >=127=0 max=37.2
  BLE: attempts=2 sent=2 blocked=0 readyCb=2 longestBlock=0.0ms
  BLE tick dt: 0-8ms=4 8-12ms=0 12-17ms=13 17-25ms=54 25-34ms=3 34-50ms=9 >=50ms=3 max=61.9ms
  BLE send dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=6.1ms
  UDP: datagrams=47 subframes=81 capped=9 staleDrops=2 maxBatch=1 maxPending=94
  UDP timer dt: 0-4ms=0 4-8ms=128 8-12ms=122 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.9ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=5 17-25ms=18 25-34ms=3 34-50ms=18 >=50ms=0 max=40.2ms
  dropped movement: events=2 absDx=37 absDy=3
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=55 coalescedSamples=219 motionEvents=214
  touch dt: 0-4ms=0 4-8ms=207 8-12ms=1 12-20ms=3 20-33ms=1 33-50ms=2 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=207 8-12ms=1 12-20ms=3 20-33ms=1 33-50ms=2 >=50ms=0 max=45.8ms
  pointer: events=214 emitted=214
  speed: 0-50=2 50-150=33 150-300=50 300-600=129 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=575.1
  gain: 0-1.1=0 1.1-1.5=214 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=6 1-2=31 2-4=45 4-8=144 8-16=10 16-32=20 32-64=8 64-127=0 >=127=0 max=39.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=7 8-12ms=0 12-17ms=22 17-25ms=39 25-34ms=8 34-50ms=5 >=50ms=6 max=80.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=32 subframes=50 capped=4 staleDrops=6 maxBatch=1 maxPending=55
  UDP timer dt: 0-4ms=0 4-8ms=127 8-12ms=123 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.9ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=1 17-25ms=14 25-34ms=3 34-50ms=9 >=50ms=0 max=40.2ms
  dropped movement: events=6 absDx=20 absDy=40
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=83 coalescedSamples=377 motionEvents=371
  touch dt: 0-4ms=2 4-8ms=366 8-12ms=0 12-20ms=0 20-33ms=2 33-50ms=1 >=50ms=0 max=45.9ms
  coalesced dt: 0-4ms=2 4-8ms=366 8-12ms=0 12-20ms=0 20-33ms=2 33-50ms=1 >=50ms=0 max=45.9ms
  pointer: events=371 emitted=371
  speed: 0-50=0 50-150=3 150-300=91 300-600=259 600-1000=18 1000-1600=0 1600-2400=0 >=2400=0 max=635.4
  gain: 0-1.1=0 1.1-1.5=371 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=4 2-4=110 4-8=249 8-16=39 16-32=36 32-64=20 64-127=0 >=127=0 max=45.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=1 12-17ms=4 17-25ms=49 25-34ms=3 34-50ms=14 >=50ms=3 max=75.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=56 subframes=87 capped=15 staleDrops=3 maxBatch=1 maxPending=62
  UDP timer dt: 0-4ms=0 4-8ms=124 8-12ms=126 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=7 17-25ms=29 25-34ms=5 34-50ms=11 >=50ms=0 max=40.9ms
  dropped movement: events=3 absDx=22 absDy=44
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=78 coalescedSamples=363 motionEvents=359
  touch dt: 0-4ms=0 4-8ms=355 8-12ms=1 12-20ms=1 20-33ms=2 33-50ms=0 >=50ms=0 max=20.8ms
  coalesced dt: 0-4ms=0 4-8ms=355 8-12ms=1 12-20ms=1 20-33ms=2 33-50ms=0 >=50ms=0 max=20.8ms
  pointer: events=359 emitted=359
  speed: 0-50=0 50-150=13 150-300=25 300-600=250 600-1000=71 1000-1600=0 1600-2400=0 >=2400=0 max=765.1
  gain: 0-1.1=0 1.1-1.5=359 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=4 1-2=15 2-4=31 4-8=257 8-16=79 16-32=39 32-64=29 64-127=0 >=127=0 max=50.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=4 8-12ms=1 12-17ms=10 17-25ms=54 25-34ms=3 34-50ms=8 >=50ms=4 max=77.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=60 subframes=95 capped=22 staleDrops=3 maxBatch=1 maxPending=71
  UDP timer dt: 0-4ms=0 4-8ms=128 8-12ms=122 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=13 17-25ms=26 25-34ms=11 34-50ms=7 >=50ms=0 max=40.6ms
  dropped movement: events=3 absDx=10 absDy=25
📊 Sent 0 packets in 2s, dropped: 0

### ESP
12:17:29.925 -> 🔧 Initializing Custom HID Mouse...
12:22:00.089 -> 🔧 Initializing Custom HID Mouse...
12:22:00.089 -> ✅ Custom USB HID Mouse initialized
12:22:00.089 -> 🔧 Initializing UDP motion POC...
12:22:00.387 -> 📡 Connecting to Wi-Fi SSID: LOSUS WIFI_0122......
12:22:01.635 -> ✅ UDP motion listening on 192.168.18.125:4210
12:22:01.635 -> 🔧 Initializing NimBLE...
12:22:01.668 -> ✅ BLE advertising started
12:22:01.668 -> 📱 Ready for iPhone connection
12:22:01.668 -> 🎧 Listening for writes...
12:22:01.668 -> 
12:22:22.234 -> 
12:22:22.234 -> ✅ Connection parameters updated
12:22:22.529 -> 📏 MTU updated to: 247
12:22:23.221 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
12:22:23.221 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:23.221 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:23.221 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:24.208 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
12:22:24.208 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:24.208 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:24.208 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:25.225 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=12/s subframes=20/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=20/s moving=20 lateMax=0.0ms sendReturnFalse=20
12:22:25.225 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:25.225 ->   UDP interval ms <8=3 8-12=1 12-17=0 17-25=1 25-34=2 34-50=0 >=50=4
12:22:25.225 ->   HID interval ms <8=8 8-12=6 12-17=1 17-25=0 25-34=0 34-50=0 >=50=4
12:22:26.213 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=27/s subframes=50/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=47/s moving=47 lateMax=0.0ms sendReturnFalse=47
12:22:26.213 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:26.213 ->   UDP interval ms <8=6 8-12=2 12-17=2 17-25=3 25-34=2 34-50=2 >=50=10
12:22:26.213 ->   HID interval ms <8=20 8-12=14 12-17=3 17-25=0 25-34=1 34-50=1 >=50=9
12:22:27.231 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=26/s subframes=48/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=124/s reports=50/s moving=50 lateMax=0.0ms sendReturnFalse=50
12:22:27.231 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:27.231 ->   UDP interval ms <8=6 8-12=2 12-17=2 17-25=3 25-34=4 34-50=0 >=50=9
12:22:27.231 ->   HID interval ms <8=25 8-12=16 12-17=0 17-25=0 25-34=0 34-50=0 >=50=9
12:22:28.216 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=29/s subframes=52/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=124/s reports=52/s moving=52 lateMax=0.4ms sendReturnFalse=52
12:22:28.216 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:28.216 ->   UDP interval ms <8=10 8-12=1 12-17=3 17-25=1 25-34=3 34-50=1 >=50=10
12:22:28.216 ->   HID interval ms <8=25 8-12=16 12-17=0 17-25=1 25-34=0 34-50=0 >=50=10
12:22:29.203 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=33/s subframes=53/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=52/s moving=52 lateMax=0.0ms sendReturnFalse=52
12:22:29.203 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:29.203 ->   UDP interval ms <8=9 8-12=5 12-17=0 17-25=5 25-34=3 34-50=1 >=50=10
12:22:29.203 ->   HID interval ms <8=23 8-12=17 12-17=2 17-25=1 25-34=0 34-50=0 >=50=10
12:22:30.219 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=32/s subframes=57/s seqGaps=0 malformed=0 queueMax=8 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=124/s reports=50/s moving=50 lateMax=0.0ms sendReturnFalse=50
12:22:30.219 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:30.219 ->   UDP interval ms <8=11 8-12=2 12-17=0 17-25=5 25-34=3 34-50=1 >=50=10
12:22:30.219 ->   HID interval ms <8=21 8-12=16 12-17=3 17-25=1 25-34=0 34-50=1 >=50=9
12:22:31.205 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=36/s subframes=64/s seqGaps=0 malformed=0 queueMax=7 overflow=0 staleFrames=2 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=124/s reports=68/s moving=68 lateMax=0.0ms sendReturnFalse=68
12:22:31.205 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:31.205 ->   UDP interval ms <8=15 8-12=3 12-17=1 17-25=3 25-34=5 34-50=0 >=50=9
12:22:31.205 ->   HID interval ms <8=35 8-12=22 12-17=2 17-25=0 25-34=1 34-50=5 >=50=3
12:22:32.222 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=124/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
12:22:32.222 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:32.222 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:32.222 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:33.207 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=7/s subframes=10/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=124/s reports=10/s moving=10 lateMax=0.0ms sendReturnFalse=10
12:22:33.207 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:33.207 ->   UDP interval ms <8=2 8-12=0 12-17=1 17-25=0 25-34=1 34-50=0 >=50=3
12:22:33.207 ->   HID interval ms <8=3 8-12=3 12-17=1 17-25=0 25-34=0 34-50=0 >=50=3
12:22:34.225 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=11/s subframes=18/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=17/s moving=17 lateMax=0.5ms sendReturnFalse=17
12:22:34.225 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:34.225 ->   UDP interval ms <8=3 8-12=1 12-17=0 17-25=1 25-34=2 34-50=0 >=50=4
12:22:34.225 ->   HID interval ms <8=7 8-12=5 12-17=0 17-25=1 25-34=0 34-50=0 >=50=4
12:22:35.215 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=26/s subframes=46/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=47/s moving=47 lateMax=0.4ms sendReturnFalse=47
12:22:35.215 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:35.215 ->   UDP interval ms <8=9 8-12=3 12-17=0 17-25=5 25-34=0 34-50=1 >=50=8
12:22:35.215 ->   HID interval ms <8=19 8-12=19 12-17=1 17-25=0 25-34=0 34-50=1 >=50=7
12:22:36.232 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=12/s subframes=21/s seqGaps=0 malformed=0 queueMax=3 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=21/s moving=21 lateMax=0.0ms sendReturnFalse=21
12:22:36.232 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:36.232 ->   UDP interval ms <8=1 8-12=1 12-17=4 17-25=1 25-34=0 34-50=0 >=50=5
12:22:36.232 ->   HID interval ms <8=9 8-12=5 12-17=2 17-25=0 25-34=0 34-50=1 >=50=4
12:22:37.218 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=22/s subframes=41/s seqGaps=0 malformed=0 queueMax=7 overflow=0 staleFrames=1 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=40/s moving=40 lateMax=0.5ms sendReturnFalse=40
12:22:37.218 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:37.218 ->   UDP interval ms <8=7 8-12=2 12-17=1 17-25=3 25-34=1 34-50=0 >=50=8
12:22:37.218 ->   HID interval ms <8=14 8-12=18 12-17=0 17-25=0 25-34=1 34-50=0 >=50=7
12:22:38.201 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=22/s subframes=36/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=36/s moving=36 lateMax=0.0ms sendReturnFalse=36
12:22:38.201 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:38.201 ->   UDP interval ms <8=7 8-12=2 12-17=0 17-25=2 25-34=2 34-50=0 >=50=9
12:22:38.201 ->   HID interval ms <8=15 8-12=9 12-17=2 17-25=1 25-34=0 34-50=1 >=50=8
12:22:39.222 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=23/s subframes=39/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=37/s moving=37 lateMax=0.0ms sendReturnFalse=37
12:22:39.222 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:39.222 ->   UDP interval ms <8=6 8-12=1 12-17=1 17-25=6 25-34=0 34-50=1 >=50=8
12:22:39.222 ->   HID interval ms <8=16 8-12=10 12-17=3 17-25=0 25-34=0 34-50=2 >=50=6
12:22:40.209 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=31/s subframes=51/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=53/s moving=53 lateMax=0.5ms sendReturnFalse=53
12:22:40.209 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:40.209 ->   UDP interval ms <8=11 8-12=2 12-17=3 17-25=5 25-34=1 34-50=1 >=50=8
12:22:40.209 ->   HID interval ms <8=24 8-12=20 12-17=1 17-25=0 25-34=0 34-50=1 >=50=7
12:22:41.230 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=38/s subframes=64/s seqGaps=0 malformed=0 queueMax=6 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=64/s moving=64 lateMax=0.5ms sendReturnFalse=64
12:22:41.230 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:41.230 ->   UDP interval ms <8=12 8-12=3 12-17=5 17-25=5 25-34=2 34-50=1 >=50=10
12:22:41.230 ->   HID interval ms <8=29 8-12=22 12-17=2 17-25=1 25-34=1 34-50=2 >=50=7
12:22:42.219 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=30/s subframes=46/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=46/s moving=46 lateMax=0.5ms sendReturnFalse=46
12:22:42.219 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:42.219 ->   UDP interval ms <8=11 8-12=3 12-17=2 17-25=4 25-34=1 34-50=0 >=50=9
12:22:42.219 ->   HID interval ms <8=22 8-12=14 12-17=1 17-25=0 25-34=0 34-50=1 >=50=8
12:22:43.203 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=29/s subframes=46/s seqGaps=0 malformed=0 queueMax=6 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=43/s moving=43 lateMax=0.0ms sendReturnFalse=43
12:22:43.203 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:43.203 ->   UDP interval ms <8=12 8-12=2 12-17=2 17-25=2 25-34=2 34-50=0 >=50=9
12:22:43.203 ->   HID interval ms <8=20 8-12=14 12-17=0 17-25=0 25-34=0 34-50=1 >=50=8
12:22:44.221 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=26/s subframes=43/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=46/s moving=46 lateMax=0.3ms sendReturnFalse=46
12:22:44.221 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:44.221 ->   UDP interval ms <8=10 8-12=1 12-17=3 17-25=3 25-34=1 34-50=1 >=50=7
12:22:44.221 ->   HID interval ms <8=18 8-12=21 12-17=0 17-25=0 25-34=0 34-50=0 >=50=7
12:22:45.204 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=19/s subframes=31/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=31/s moving=31 lateMax=0.5ms sendReturnFalse=31
12:22:45.204 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:45.204 ->   UDP interval ms <8=5 8-12=1 12-17=3 17-25=3 25-34=0 34-50=0 >=50=7
12:22:45.204 ->   HID interval ms <8=12 8-12=11 12-17=0 17-25=1 25-34=0 34-50=0 >=50=7
12:22:46.220 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=24/s subframes=43/s seqGaps=0 malformed=0 queueMax=6 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=43/s moving=43 lateMax=0.5ms sendReturnFalse=43
12:22:46.220 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:46.220 ->   UDP interval ms <8=8 8-12=2 12-17=1 17-25=5 25-34=0 34-50=0 >=50=8
12:22:46.220 ->   HID interval ms <8=18 8-12=16 12-17=1 17-25=0 25-34=0 34-50=1 >=50=7
12:22:47.204 -> 📈 ESP movement diagnostics | BLE rx=2/s seqGaps=0 malformed=0 | UDP datagrams=20/s subframes=32/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=34/s moving=32 lateMax=0.5ms sendReturnFalse=34
12:22:47.204 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=1 34-50=0 >=50=0
12:22:47.204 ->   UDP interval ms <8=7 8-12=1 12-17=2 17-25=1 25-34=0 34-50=2 >=50=7
12:22:47.204 ->   HID interval ms <8=14 8-12=9 12-17=2 17-25=2 25-34=0 34-50=1 >=50=6
12:22:48.219 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=16/s subframes=24/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=24/s moving=24 lateMax=0.3ms sendReturnFalse=24
12:22:48.219 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:48.219 ->   UDP interval ms <8=5 8-12=0 12-17=0 17-25=2 25-34=1 34-50=1 >=50=7
12:22:48.219 ->   HID interval ms <8=8 8-12=6 12-17=3 17-25=0 25-34=0 34-50=1 >=50=6
12:22:49.201 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=16/s subframes=27/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=27/s moving=27 lateMax=0.0ms sendReturnFalse=27
12:22:49.201 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:49.201 ->   UDP interval ms <8=5 8-12=1 12-17=0 17-25=1 25-34=1 34-50=1 >=50=7
12:22:49.201 ->   HID interval ms <8=12 8-12=7 12-17=0 17-25=1 25-34=0 34-50=1 >=50=6
12:22:50.219 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=24/s subframes=39/s seqGaps=0 malformed=0 queueMax=4 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=39/s moving=39 lateMax=0.0ms sendReturnFalse=39
12:22:50.219 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:50.219 ->   UDP interval ms <8=7 8-12=1 12-17=2 17-25=5 25-34=1 34-50=0 >=50=8
12:22:50.219 ->   HID interval ms <8=18 8-12=11 12-17=1 17-25=1 25-34=0 34-50=0 >=50=8
12:22:51.204 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=32/s subframes=47/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=47/s moving=47 lateMax=0.5ms sendReturnFalse=47
12:22:51.204 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:51.204 ->   UDP interval ms <8=12 8-12=1 12-17=3 17-25=6 25-34=0 34-50=0 >=50=10
12:22:51.204 ->   HID interval ms <8=21 8-12=15 12-17=0 17-25=1 25-34=0 34-50=2 >=50=8
12:22:52.221 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=32/s subframes=52/s seqGaps=0 malformed=0 queueMax=7 overflow=0 staleFrames=1 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=47/s moving=47 lateMax=0.5ms sendReturnFalse=47
12:22:52.221 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:52.221 ->   UDP interval ms <8=10 8-12=2 12-17=4 17-25=5 25-34=2 34-50=0 >=50=9
12:22:52.221 ->   HID interval ms <8=21 8-12=14 12-17=1 17-25=3 25-34=1 34-50=2 >=50=5
12:22:53.208 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=25/s subframes=38/s seqGaps=0 malformed=0 queueMax=5 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=42/s moving=42 lateMax=0.5ms sendReturnFalse=42
12:22:53.208 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:53.208 ->   UDP interval ms <8=8 8-12=1 12-17=1 17-25=5 25-34=3 34-50=0 >=50=7
12:22:53.208 ->   HID interval ms <8=17 8-12=14 12-17=2 17-25=1 25-34=1 34-50=1 >=50=6
12:22:54.223 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP datagrams=0/s subframes=0/s seqGaps=0 malformed=0 queueMax=0 overflow=0 staleFrames=0 | maxPending=0.0 staleDrops=0 capped=0 | HID ticks=125/s reports=0/s moving=0 lateMax=0.0ms sendReturnFalse=0
12:22:54.223 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:54.223 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:54.223 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
12:22:55.111 -> 🔌 iPhone disconnected, reason: 531
12:22:55.637 -> 🔄 Restarting advertising...


## Log 6

📡 UDP motion state: preparing
📡 UDP motion state: ready
Unable to open mach-O at path: /Library/Caches/com.apple.xbs/Binaries/RenderBox/install/Root/System/Library/PrivateFrameworks/RenderBox.framework/default.metallib  Error:2
App is being debugged, do not track this hang
Hang detected: 0.88s (debugger attached, not reporting)
✅ Bluetooth is ON – ready to scan
Start Scanning
🔍 Found peripheral: ESP_MouseBridge
✅ Connected to ESP_MouseBridge
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=35 17-25ms=3 25-34ms=1 34-50ms=0 >=50ms=1 max=920.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=0 capped=0 staleDrops=0 backlogCollapsed=0 maxQueuedFrames=0 maxPending=0
  UDP timer dt: 0-4ms=2 4-8ms=56 8-12ms=53 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=361.4ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
🔍 Starting service discovery...
🧩 Found service: 00001234-0000-1000-8000-00805F9B34FB
📡 Found characteristic: 0000ABCD-0000-1000-8000-00805F9B34FB
✅ Write characteristic ready (props: CBCharacteristicProperties(rawValue: 4))
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=70 17-25ms=16 25-34ms=14 34-50ms=1 >=50ms=1 max=53.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=0 capped=0 staleDrops=0 backlogCollapsed=0 maxQueuedFrames=0 maxPending=0
  UDP timer dt: 0-4ms=0 4-8ms=122 8-12ms=128 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=78 coalescedSamples=374 motionEvents=363
  touch dt: 0-4ms=0 4-8ms=361 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=1 max=93.7ms
  coalesced dt: 0-4ms=0 4-8ms=361 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=1 max=93.7ms
  pointer: events=363 emitted=363
  speed: 0-50=2 50-150=71 150-300=214 300-600=76 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=505.5
  gain: 0-1.1=0 1.1-1.5=363 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=17 1-2=76 2-4=203 4-8=67 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=6.8
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=15 17-25ms=54 25-34ms=4 34-50ms=12 >=50ms=1 max=53.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=193 capped=0 staleDrops=1 backlogCollapsed=168 maxQueuedFrames=4 maxPending=44
  UDP timer dt: 0-4ms=0 4-8ms=130 8-12ms=120 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=100 8-12ms=91 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  dropped movement: events=1 absDx=4 absDy=2
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=94 coalescedSamples=446 motionEvents=453
  touch dt: 0-4ms=0 4-8ms=446 8-12ms=6 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=100.0ms
  coalesced dt: 0-4ms=0 4-8ms=448 8-12ms=6 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=100.0ms
  pointer: events=453 emitted=453
  speed: 0-50=49 50-150=63 150-300=152 300-600=127 600-1000=62 1000-1600=0 1600-2400=0 >=2400=0 max=969.8
  gain: 0-1.1=0 1.1-1.5=453 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=75 1-2=52 2-4=144 4-8=121 8-16=61 16-32=0 32-64=0 64-127=0 >=127=0 max=13.2
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=4 17-25ms=80 25-34ms=0 34-50ms=8 >=50ms=0 max=45.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=232 capped=0 staleDrops=1 backlogCollapsed=211 maxQueuedFrames=4 maxPending=107
  UDP timer dt: 0-4ms=0 4-8ms=128 8-12ms=123 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=114 8-12ms=110 12-17ms=7 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.7ms
  dropped movement: events=1 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=95 coalescedSamples=472 motionEvents=468
  touch dt: 0-4ms=0 4-8ms=463 8-12ms=5 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=8.3ms
  coalesced dt: 0-4ms=0 4-8ms=464 8-12ms=8 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=8.3ms
  pointer: events=468 emitted=468
  speed: 0-50=0 50-150=5 150-300=52 300-600=87 600-1000=103 1000-1600=189 1600-2400=32 >=2400=0 max=1784.4
  gain: 0-1.1=0 1.1-1.5=468 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=22 1-2=31 2-4=44 4-8=67 8-16=148 16-32=156 32-64=0 64-127=0 >=127=0 max=30.2
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=95 25-34ms=0 34-50ms=0 >=50ms=0 max=24.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=250 capped=41 staleDrops=0 backlogCollapsed=219 maxQueuedFrames=4 maxPending=213
  UDP timer dt: 0-4ms=0 4-8ms=123 8-12ms=127 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=125 8-12ms=124 12-17ms=1 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.5ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=27 coalescedSamples=127 motionEvents=126
  touch dt: 0-4ms=0 4-8ms=122 8-12ms=0 12-20ms=3 20-33ms=1 33-50ms=0 >=50ms=0 max=20.9ms
  coalesced dt: 0-4ms=0 4-8ms=122 8-12ms=0 12-20ms=3 20-33ms=1 33-50ms=0 >=50ms=0 max=20.9ms
  pointer: events=126 emitted=126
  speed: 0-50=0 50-150=0 150-300=20 300-600=39 600-1000=29 1000-1600=38 1600-2400=0 >=2400=0 max=1439.0
  gain: 0-1.1=0 1.1-1.5=126 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=2 1-2=4 2-4=19 4-8=41 8-16=33 16-32=27 32-64=0 64-127=0 >=127=0 max=21.7
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=81 17-25ms=21 25-34ms=4 34-50ms=0 >=50ms=2 max=57.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=62 capped=4 staleDrops=1 backlogCollapsed=60 maxQueuedFrames=4 maxPending=144
  UDP timer dt: 0-4ms=0 4-8ms=136 8-12ms=115 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.1ms
  UDP send dt: 0-8ms=32 8-12ms=29 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  dropped movement: events=1 absDx=31 absDy=50
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=97 coalescedSamples=478 motionEvents=478
  touch dt: 0-4ms=0 4-8ms=477 8-12ms=0 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=0 max=12.5ms
  coalesced dt: 0-4ms=0 4-8ms=477 8-12ms=0 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=0 max=12.5ms
  pointer: events=478 emitted=478
  speed: 0-50=3 50-150=19 150-300=25 300-600=217 600-1000=214 1000-1600=0 1600-2400=0 >=2400=0 max=953.8
  gain: 0-1.1=0 1.1-1.5=478 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=13 1-2=14 2-4=26 4-8=237 8-16=188 16-32=0 32-64=0 64-127=0 >=127=0 max=13.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=97 25-34ms=0 34-50ms=0 >=50ms=0 max=24.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=248 capped=0 staleDrops=0 backlogCollapsed=228 maxQueuedFrames=4 maxPending=110
  UDP timer dt: 0-4ms=0 4-8ms=135 8-12ms=115 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=130 8-12ms=117 12-17ms=0 17-25ms=1 25-34ms=0 34-50ms=0 >=50ms=0 max=24.0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=28 coalescedSamples=145 motionEvents=145
  touch dt: 0-4ms=0 4-8ms=145 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=145 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=145 emitted=145
  speed: 0-50=0 50-150=0 150-300=3 300-600=31 600-1000=79 1000-1600=32 1600-2400=0 >=2400=0 max=1518.7
  gain: 0-1.1=0 1.1-1.5=145 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=6 4-8=32 8-16=84 16-32=23 32-64=0 64-127=0 >=127=0 max=20.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=79 17-25ms=26 25-34ms=2 34-50ms=0 >=50ms=1 max=57.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=76 capped=11 staleDrops=1 backlogCollapsed=69 maxQueuedFrames=4 maxPending=159
  UDP timer dt: 0-4ms=0 4-8ms=124 8-12ms=126 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.9ms
  UDP send dt: 0-8ms=34 8-12ms=42 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.9ms
  dropped movement: events=1 absDx=69 absDy=111
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=27 coalescedSamples=108 motionEvents=104
  touch dt: 0-4ms=3 4-8ms=97 8-12ms=2 12-20ms=2 20-33ms=0 33-50ms=0 >=50ms=0 max=14.1ms
  coalesced dt: 0-4ms=3 4-8ms=97 8-12ms=2 12-20ms=2 20-33ms=0 33-50ms=0 >=50ms=0 max=14.1ms
  pointer: events=104 emitted=104
  speed: 0-50=1 50-150=1 150-300=7 300-600=15 600-1000=68 1000-1600=12 1600-2400=0 >=2400=0 max=1283.4
  gain: 0-1.1=0 1.1-1.5=104 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=2 1-2=1 2-4=5 4-8=14 8-16=74 16-32=8 32-64=0 64-127=0 >=127=0 max=26.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=0 12-17ms=75 17-25ms=12 25-34ms=4 34-50ms=4 >=50ms=4 max=55.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=46 capped=6 staleDrops=3 backlogCollapsed=46 maxQueuedFrames=4 maxPending=158
  UDP timer dt: 0-4ms=0 4-8ms=123 8-12ms=127 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.9ms
  UDP send dt: 0-8ms=18 8-12ms=24 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.9ms
  dropped movement: events=3 absDx=67 absDy=155
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=97 coalescedSamples=475 motionEvents=467
  touch dt: 0-4ms=0 4-8ms=461 8-12ms=3 12-20ms=1 20-33ms=2 33-50ms=0 >=50ms=0 max=25.0ms
  coalesced dt: 0-4ms=0 4-8ms=461 8-12ms=3 12-20ms=1 20-33ms=2 33-50ms=0 >=50ms=0 max=25.0ms
  pointer: events=467 emitted=467
  speed: 0-50=0 50-150=11 150-300=73 300-600=174 600-1000=183 1000-1600=26 1600-2400=0 >=2400=0 max=1258.8
  gain: 0-1.1=0 1.1-1.5=467 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=8 1-2=17 2-4=82 4-8=160 8-16=196 16-32=4 32-64=0 64-127=0 >=127=0 max=16.9
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=88 25-34ms=0 34-50ms=3 >=50ms=1 max=61.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=251 capped=3 staleDrops=1 backlogCollapsed=221 maxQueuedFrames=4 maxPending=134
  UDP timer dt: 0-4ms=0 4-8ms=125 8-12ms=125 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.9ms
  UDP send dt: 0-8ms=126 8-12ms=124 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.9ms
  dropped movement: events=1 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: callbacks=3 coalescedSamples=10 motionEvents=18
  touch dt: 0-4ms=0 4-8ms=18 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=18 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=18 emitted=18
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=5 1000-1600=13 1600-2400=0 >=2400=0 max=1223.4
  gain: 0-1.1=0 1.1-1.5=18 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=17 16-32=1 32-64=0 64-127=0 >=127=0 max=16.1
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=114 17-25ms=3 25-34ms=0 34-50ms=0 >=50ms=1 max=53.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=8 capped=0 staleDrops=1 backlogCollapsed=8 maxQueuedFrames=4 maxPending=119
  UDP timer dt: 0-4ms=0 4-8ms=142 8-12ms=108 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=9.0ms
  UDP send dt: 0-8ms=4 8-12ms=4 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.8ms
  dropped movement: events=1 absDx=5 absDy=56
📊 Sent 0 packets in 2s, dropped: 0

11:40:05.653 -> 🔧 Initializing Custom HID Mouse...
11:40:05.653 -> ✅ Custom USB HID Mouse initialized
11:40:05.653 -> 🔧 Initializing UDP motion POC...
11:40:05.686 -> 📡 Connecting to Wi-Fi SSID: LOSUS WIFI_0122.......
11:40:07.425 -> ✅ UDP motion listening on 192.168.18.125:4210
11:40:07.425 -> 🔧 Initializing NimBLE...
11:40:07.459 -> ✅ BLE advertising started
11:40:07.459 -> 📱 Ready for iPhone connection
11:40:07.459 -> 🎧 Listening for writes...
11:40:07.459 -> 
11:40:20.082 -> 📶 iPhone con
11:40:20.411 -> 📏 MTU updated to: 247
11:40:21.103 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
11:40:21.103 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:21.103 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:21.103 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:22.089 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
11:40:22.089 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:22.089 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:22.089 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:22.648 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.648 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.648 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.648 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.648 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.648 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.648 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.681 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.681 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.681 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.681 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.681 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.745 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.745 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.745 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.745 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.745 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.745 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.745 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:22.745 -> 📡 UDP packet size=6 from 192.168.18.105:61729
11:40:23.107 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=58/s seqGaps=4 malformed=0 | maxPending=30.0 staleDrops=0 capped=0 | HID reports=19/s moving=19 sendReturnFalse=19
11:40:23.107 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:23.107 ->   UDP interval ms <8=46 8-12=5 12-17=0 17-25=2 25-34=0 34-50=0 >=50=4
11:40:23.107 ->   HID interval ms <8=1 8-12=9 12-17=1 17-25=3 25-34=0 34-50=0 >=50=4
11:40:24.092 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=81/s seqGaps=9 malformed=0 | maxPending=48.0 staleDrops=0 capped=0 | HID reports=24/s moving=24 sendReturnFalse=24
11:40:24.092 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:24.092 ->   UDP interval ms <8=61 8-12=7 12-17=1 17-25=2 25-34=1 34-50=1 >=50=8
11:40:24.092 ->   HID interval ms <8=4 8-12=6 12-17=0 17-25=4 25-34=1 34-50=2 >=50=7
11:40:25.113 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=98/s seqGaps=10 malformed=0 | maxPending=50.0 staleDrops=0 capped=0 | HID reports=43/s moving=43 sendReturnFalse=43
11:40:25.113 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:25.113 ->   UDP interval ms <8=68 8-12=14 12-17=5 17-25=1 25-34=1 34-50=0 >=50=9
11:40:25.113 ->   HID interval ms <8=7 8-12=20 12-17=2 17-25=5 25-34=0 34-50=0 >=50=9
11:40:26.101 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=115/s seqGaps=7 malformed=0 | maxPending=82.0 staleDrops=0 capped=2 | HID reports=51/s moving=51 sendReturnFalse=51
11:40:26.101 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:26.101 ->   UDP interval ms <8=83 8-12=17 12-17=5 17-25=0 25-34=0 34-50=0 >=50=10
11:40:26.101 ->   HID interval ms <8=7 8-12=29 12-17=3 17-25=2 25-34=0 34-50=0 >=50=10
11:40:27.085 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=117/s seqGaps=8 malformed=0 | maxPending=119.0 staleDrops=0 capped=3 | HID reports=48/s moving=48 sendReturnFalse=48
11:40:27.085 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:27.085 ->   UDP interval ms <8=87 8-12=16 12-17=3 17-25=1 25-34=0 34-50=0 >=50=10
11:40:27.085 ->   HID interval ms <8=6 8-12=28 12-17=1 17-25=3 25-34=0 34-50=0 >=50=10
11:40:28.107 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=111/s seqGaps=15 malformed=0 | maxPending=193.0 staleDrops=0 capped=12 | HID reports=45/s moving=45 sendReturnFalse=45
11:40:28.107 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:28.107 ->   UDP interval ms <8=88 8-12=9 12-17=3 17-25=1 25-34=0 34-50=0 >=50=10
11:40:28.107 ->   HID interval ms <8=10 8-12=21 12-17=2 17-25=2 25-34=0 34-50=0 >=50=10
11:40:29.090 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=74/s seqGaps=6 malformed=0 | maxPending=155.0 staleDrops=0 capped=6 | HID reports=29/s moving=29 sendReturnFalse=29
11:40:29.090 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:29.090 ->   UDP interval ms <8=52 8-12=9 12-17=4 17-25=3 25-34=0 34-50=0 >=50=6
11:40:29.090 ->   HID interval ms <8=5 8-12=14 12-17=3 17-25=1 25-34=0 34-50=0 >=50=6
11:40:30.107 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
11:40:30.107 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:30.107 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:30.107 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:31.094 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=102/s seqGaps=3 malformed=0 | maxPending=152.0 staleDrops=0 capped=7 | HID reports=46/s moving=46 sendReturnFalse=46
11:40:31.094 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:31.094 ->   UDP interval ms <8=72 8-12=16 12-17=4 17-25=0 25-34=1 34-50=1 >=50=8
11:40:31.094 ->   HID interval ms <8=8 8-12=24 12-17=2 17-25=2 25-34=1 34-50=1 >=50=8
11:40:32.081 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=110/s seqGaps=15 malformed=0 | maxPending=146.0 staleDrops=0 capped=8 | HID reports=41/s moving=41 sendReturnFalse=41
11:40:32.081 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:32.081 ->   UDP interval ms <8=83 8-12=12 12-17=4 17-25=0 25-34=1 34-50=0 >=50=10
11:40:32.081 ->   HID interval ms <8=7 8-12=19 12-17=3 17-25=2 25-34=0 34-50=0 >=50=10
11:40:33.098 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=105/s seqGaps=13 malformed=0 | maxPending=143.0 staleDrops=0 capped=13 | HID reports=44/s moving=44 sendReturnFalse=44
11:40:33.098 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:33.098 ->   UDP interval ms <8=76 8-12=15 12-17=3 17-25=1 25-34=0 34-50=1 >=50=9
11:40:33.098 ->   HID interval ms <8=11 8-12=21 12-17=1 17-25=0 25-34=2 34-50=0 >=50=9
11:40:34.087 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
11:40:34.087 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:34.087 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:34.087 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:35.109 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
11:40:35.109 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:35.109 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:35.109 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:36.096 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=17/s seqGaps=0 malformed=0 | maxPending=192.0 staleDrops=0 capped=4 | HID reports=8/s moving=8 sendReturnFalse=8
11:40:36.096 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:36.096 ->   UDP interval ms <8=13 8-12=1 12-17=0 17-25=0 25-34=0 34-50=0 >=50=3
11:40:36.096 ->   HID interval ms <8=3 8-12=2 12-17=0 17-25=0 25-34=0 34-50=0 >=50=3
11:40:37.113 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=103/s seqGaps=8 malformed=0 | maxPending=156.0 staleDrops=0 capped=6 | HID reports=42/s moving=42 sendReturnFalse=42
11:40:37.113 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:37.113 ->   UDP interval ms <8=76 8-12=12 12-17=2 17-25=2 25-34=1 34-50=0 >=50=10
11:40:37.113 ->   HID interval ms <8=10 8-12=19 12-17=3 17-25=1 25-34=0 34-50=1 >=50=8
11:40:38.101 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=115/s seqGaps=6 malformed=0 | maxPending=113.0 staleDrops=0 capped=7 | HID reports=51/s moving=51 sendReturnFalse=51
11:40:38.101 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:38.101 ->   UDP interval ms <8=82 8-12=18 12-17=5 17-25=1 25-34=0 34-50=0 >=50=9
11:40:38.101 ->   HID interval ms <8=6 8-12=30 12-17=3 17-25=2 25-34=0 34-50=0 >=50=10
11:40:39.088 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=54/s seqGaps=2 malformed=0 | maxPending=103.0 staleDrops=0 capped=4 | HID reports=23/s moving=23 sendReturnFalse=23
11:40:39.088 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:39.088 ->   UDP interval ms <8=40 8-12=6 12-17=3 17-25=0 25-34=0 34-50=0 >=50=5
11:40:39.088 ->   HID interval ms <8=3 8-12=12 12-17=2 17-25=1 25-34=0 34-50=0 >=50=5
11:40:40.109 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
11:40:40.109 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:40.109 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:40.109 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
11:40:41.028 -> 🔌 iPhone disconnected, reason: 531

## Log 5

### iOS

📡 UDP motion state: preparing
📡 UDP motion state: ready
Unable to open mach-O at path: /Library/Caches/com.apple.xbs/Binaries/RenderBox/install/Root/System/Library/PrivateFrameworks/RenderBox.framework/default.metallib  Error:2
App is being debugged, do not track this hang
Hang detected: 0.31s (debugger attached, not reporting)
✅ Bluetooth is ON – ready to scan
Start Scanning
App is being debugged, do not track this hang
Hang detected: 0.77s (debugger attached, not reporting)
🔍 Found peripheral: ESP_MouseBridge
✅ Connected to ESP_MouseBridge
🔍 Starting service discovery...
📈 Movement diagnostics
  touch: events=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=62 17-25ms=5 25-34ms=1 34-50ms=1 >=50ms=1 max=835.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=0
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
🧩 Found service: 00001234-0000-1000-8000-00805F9B34FB
📡 Found characteristic: 0000ABCD-0000-1000-8000-00805F9B34FB
✅ Write characteristic ready (props: CBCharacteristicProperties(rawValue: 4))
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=72 17-25ms=12 25-34ms=18 34-50ms=2 >=50ms=0 max=39.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=0
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=78
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=41 20-33ms=37 33-50ms=0 >=50ms=0 max=26.8ms
  pointer: events=78 emitted=78
  speed: 0-50=0 50-150=0 150-300=10 300-600=58 600-1000=10 1000-1600=0 1600-2400=0 >=2400=0 max=886.0
  gain: 0-1.1=0 1.1-1.5=78 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=1 2-4=3 4-8=13 8-16=48 16-32=13 32-64=0 64-127=0 >=127=0 max=30.1
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=1 12-17ms=17 17-25ms=79 25-34ms=1 34-50ms=2 >=50ms=0 max=45.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=78
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=75 25-34ms=1 34-50ms=0 >=50ms=1 max=64.6ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=94
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=15 20-33ms=76 33-50ms=3 >=50ms=0 max=43.1ms
  pointer: events=94 emitted=94
  speed: 0-50=0 50-150=0 150-300=33 300-600=61 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=534.8
  gain: 0-1.1=0 1.1-1.5=94 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=8 4-8=43 8-16=36 16-32=7 32-64=0 64-127=0 >=127=0 max=21.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=91 25-34ms=0 34-50ms=3 >=50ms=0 max=43.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=94
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=91 25-34ms=0 34-50ms=3 >=50ms=0 max=43.1ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=85
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=3 20-33ms=75 33-50ms=7 >=50ms=0 max=42.3ms
  pointer: events=85 emitted=83
  speed: 0-50=0 50-150=45 150-300=40 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=276.5
  gain: 0-1.1=0 1.1-1.5=85 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=15 2-4=33 4-8=27 8-16=8 16-32=0 32-64=0 64-127=0 >=127=0 max=12.5
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=2 17-25ms=78 25-34ms=1 34-50ms=7 >=50ms=0 max=42.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=83
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=74 25-34ms=1 34-50ms=7 >=50ms=1 max=122.6ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=95
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=3 20-33ms=92 33-50ms=0 >=50ms=0 max=26.3ms
  pointer: events=95 emitted=93
  speed: 0-50=3 50-150=88 150-300=4 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=190.9
  gain: 0-1.1=0 1.1-1.5=95 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=30 2-4=55 4-8=8 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=6.7
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=94 25-34ms=1 34-50ms=0 >=50ms=0 max=26.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=93
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=90 25-34ms=1 34-50ms=2 >=50ms=0 max=42.7ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=55
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=54 33-50ms=1 >=50ms=0 max=35.7ms
  pointer: events=55 emitted=54
  speed: 0-50=2 50-150=51 150-300=0 300-600=2 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=579.0
  gain: 0-1.1=0 1.1-1.5=55 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=9 2-4=35 4-8=8 8-16=0 16-32=1 32-64=1 64-127=0 >=127=0 max=40
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=1 12-17ms=39 17-25ms=54 25-34ms=2 34-50ms=3 >=50ms=1 max=56.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=54
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=51 25-34ms=0 34-50ms=2 >=50ms=1 max=866.3ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=23
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=12 20-33ms=10 33-50ms=1 >=50ms=0 max=44.1ms
  pointer: events=23 emitted=22
  speed: 0-50=0 50-150=0 150-300=3 300-600=7 600-1000=13 1000-1600=0 1600-2400=0 >=2400=0 max=914.7
  gain: 0-1.1=0 1.1-1.5=23 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=1 4-8=5 8-16=8 16-32=7 32-64=1 64-127=0 >=127=0 max=39.4
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=1 12-17ms=79 17-25ms=23 25-34ms=2 34-50ms=1 >=50ms=2 max=53.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=22
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=20 25-34ms=0 34-50ms=1 >=50ms=1 max=1496.5ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=15
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=5 20-33ms=7 33-50ms=3 >=50ms=0 max=41.2ms
  pointer: events=15 emitted=15
  speed: 0-50=0 50-150=3 150-300=1 300-600=11 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=473.6
  gain: 0-1.1=0 1.1-1.5=15 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=4 8-16=8 16-32=3 32-64=0 64-127=0 >=127=0 max=22.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=0 12-17ms=74 17-25ms=12 25-34ms=8 34-50ms=5 >=50ms=1 max=57.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=15
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=8 25-34ms=2 34-50ms=3 >=50ms=2 max=1030.8ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=42
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=12 20-33ms=28 33-50ms=2 >=50ms=0 max=45.4ms
  pointer: events=42 emitted=41
  speed: 0-50=0 50-150=1 150-300=7 300-600=16 600-1000=17 1000-1600=1 1600-2400=0 >=2400=0 max=1000.7
  gain: 0-1.1=0 1.1-1.5=42 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=3 4-8=4 8-16=18 16-32=12 32-64=4 64-127=0 >=127=0 max=34.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=56 17-25ms=40 25-34ms=2 34-50ms=2 >=50ms=2 max=53.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=41
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=36 25-34ms=1 34-50ms=3 >=50ms=1 max=1107.7ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=95
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=94 33-50ms=0 >=50ms=0 max=25.4ms
  pointer: events=95 emitted=95
  speed: 0-50=0 50-150=0 150-300=0 300-600=4 600-1000=16 1000-1600=70 1600-2400=5 >=2400=0 max=1655.9
  gain: 0-1.1=0 1.1-1.5=95 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=1 4-8=4 8-16=3 16-32=16 32-64=71 64-127=0 >=127=0 max=45.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=94 25-34ms=1 34-50ms=0 >=50ms=0 max=25.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=95
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=94 25-34ms=1 34-50ms=0 >=50ms=0 max=25.4ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=32
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=31 33-50ms=0 >=50ms=0 max=32.9ms
  pointer: events=32 emitted=32
  speed: 0-50=0 50-150=2 150-300=1 300-600=0 600-1000=5 1000-1600=22 1600-2400=2 >=2400=0 max=1670.9
  gain: 0-1.1=0 1.1-1.5=32 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=2 8-16=3 16-32=2 32-64=25 64-127=0 >=127=0 max=45.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=69 17-25ms=31 25-34ms=3 34-50ms=1 >=50ms=1 max=57.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=32
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=31 25-34ms=0 34-50ms=0 >=50ms=1 max=1351.9ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=58
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=4 20-33ms=53 33-50ms=1 >=50ms=0 max=41.6ms
  pointer: events=58 emitted=58
  speed: 0-50=0 50-150=0 150-300=1 300-600=1 600-1000=23 1000-1600=31 1600-2400=2 >=2400=0 max=1707.3
  gain: 0-1.1=0 1.1-1.5=58 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=1 8-16=4 16-32=18 32-64=35 64-127=0 >=127=0 max=45.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=29 17-25ms=57 25-34ms=4 34-50ms=2 >=50ms=2 max=57.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=58
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=55 25-34ms=1 34-50ms=1 >=50ms=1 max=639.2ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=36
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=8 20-33ms=25 33-50ms=3 >=50ms=0 max=42.0ms
  pointer: events=36 emitted=36
  speed: 0-50=1 50-150=2 150-300=1 300-600=1 600-1000=8 1000-1600=23 1600-2400=0 >=2400=0 max=1591.1
  gain: 0-1.1=0 1.1-1.5=36 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=3 8-16=1 16-32=1 32-64=31 64-127=0 >=127=0 max=45.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=8 8-12ms=1 12-17ms=24 17-25ms=44 25-34ms=6 34-50ms=3 >=50ms=7 max=57.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=36
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=26 25-34ms=1 34-50ms=2 >=50ms=7 max=287.6ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=17
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=16 33-50ms=1 >=50ms=0 max=33.9ms
  pointer: events=17 emitted=17
  speed: 0-50=0 50-150=1 150-300=1 300-600=1 600-1000=4 1000-1600=10 1600-2400=0 >=2400=0 max=1531.4
  gain: 0-1.1=0 1.1-1.5=17 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=1 16-32=2 32-64=14 64-127=0 >=127=0 max=45.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=1 12-17ms=66 17-25ms=21 25-34ms=8 34-50ms=0 >=50ms=4 max=56.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=17
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=13 25-34ms=0 34-50ms=0 >=50ms=4 max=225.4ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=37
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=13 20-33ms=22 33-50ms=1 >=50ms=1 max=50.0ms
  pointer: events=37 emitted=37
  speed: 0-50=0 50-150=2 150-300=0 300-600=7 600-1000=9 1000-1600=19 1600-2400=0 >=2400=0 max=1596.7
  gain: 0-1.1=0 1.1-1.5=37 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=3 8-16=0 16-32=8 32-64=26 64-127=0 >=127=0 max=45.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=7 8-12ms=0 12-17ms=31 17-25ms=43 25-34ms=7 34-50ms=1 >=50ms=6 max=57.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=37
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=28 25-34ms=2 34-50ms=1 >=50ms=6 max=1354.5ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=10
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=2 20-33ms=7 33-50ms=1 >=50ms=0 max=40.4ms
  pointer: events=10 emitted=10
  speed: 0-50=0 50-150=1 150-300=0 300-600=2 600-1000=2 1000-1600=5 1600-2400=0 >=2400=0 max=1495.0
  gain: 0-1.1=0 1.1-1.5=10 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=1 16-32=3 32-64=6 64-127=0 >=127=0 max=45.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=4 8-12ms=1 12-17ms=80 17-25ms=14 25-34ms=5 34-50ms=1 >=50ms=3 max=56.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=10
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=7 25-34ms=0 34-50ms=1 >=50ms=2 max=233.4ms
  dropped movement: events=0 absDx=0 absDy=0

### ESP
10:54:42.336 -> 🔧 Initializing Custom HID Mouse...
10:54:42.336 -> ✅ Custom USB HID Mouse initialized
10:54:42.336 -> 🔧 Initializing UDP motion POC...
10:54:42.435 -> 📡 Connecting to Wi-Fi SSID: LOSUS WIFI_0122......
10:54:43.948 -> ✅ UDP motion listening on 192.168.18.125:4210
10:54:43.948 -> 🔧 Initializing NimBLE...
10:54:43.948 -> ✅ BLE advertising started
10:54:43.948 -> 📱 Ready for iPhone connection
10:54:43.948 -> 🎧 Listening for writes...
10:54:43.948 -> 
10:55:09.876 -> 
10:55:09.876 -> ✅ Connection parameters updated
10:55:10.238 -> 📏 MTU updated to: 247
10:55:10.862 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:55:10.862 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:10.862 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:10.862 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:11.884 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:55:11.884 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:11.884 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:11.884 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:12.870 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:55:12.870 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:12.870 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:12.870 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:13.069 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.069 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.069 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.102 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.168 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.168 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.168 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.168 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.200 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.265 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.265 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.265 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.265 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.298 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.362 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.362 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.362 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.362 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.395 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.460 -> 📡 UDP packet size=6 from 192.168.18.105:57302
10:55:13.886 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=40/s seqGaps=0 malformed=0 | maxPending=46.0 staleDrops=0 capped=0 | HID reports=23/s moving=23 sendReturnFalse=23
10:55:13.886 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:13.886 ->   UDP interval ms <8=18 8-12=3 12-17=2 17-25=7 25-34=1 34-50=1 >=50=7
10:55:13.886 ->   HID interval ms <8=0 8-12=5 12-17=3 17-25=5 25-34=2 34-50=0 >=50=7
10:55:14.874 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=44/s seqGaps=0 malformed=0 | maxPending=41.0 staleDrops=0 capped=0 | HID reports=24/s moving=24 sendReturnFalse=24
10:55:14.874 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:14.874 ->   UDP interval ms <8=21 8-12=2 12-17=2 17-25=7 25-34=2 34-50=0 >=50=10
10:55:14.874 ->   HID interval ms <8=1 8-12=2 12-17=6 17-25=4 25-34=1 34-50=0 >=50=10
10:55:15.860 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=49/s seqGaps=0 malformed=0 | maxPending=38.0 staleDrops=0 capped=0 | HID reports=28/s moving=28 sendReturnFalse=28
10:55:15.860 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:15.860 ->   UDP interval ms <8=24 8-12=1 12-17=4 17-25=9 25-34=1 34-50=0 >=50=10
10:55:15.860 ->   HID interval ms <8=0 8-12=4 12-17=9 17-25=5 25-34=0 34-50=0 >=50=10
10:55:16.878 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=47/s seqGaps=0 malformed=0 | maxPending=27.0 staleDrops=0 capped=0 | HID reports=27/s moving=27 sendReturnFalse=27
10:55:16.878 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:16.878 ->   UDP interval ms <8=22 8-12=3 12-17=2 17-25=8 25-34=1 34-50=1 >=50=10
10:55:17.867 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=35/s seqGaps=0 malformed=0 | maxPending=14.0 staleDrops=0 capped=0 | HID reports=26/s moving=26 sendReturnFalse=26
10:55:17.867 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:17.867 ->   UDP interval ms <8=13 8-12=1 12-17=2 17-25=9 25-34=0 34-50=1 >=50=9
10:55:17.867 ->   HID interval ms <8=2 8-12=3 12-17=8 17-25=2 25-34=1 34-50=1 >=50=9
10:55:18.886 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=48/s seqGaps=0 malformed=0 | maxPending=13.0 staleDrops=0 capped=0 | HID reports=29/s moving=29 sendReturnFalse=29
10:55:18.886 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:18.886 ->   UDP interval ms <8=20 8-12=4 12-17=3 17-25=11 25-34=0 34-50=0 >=50=10
10:55:18.886 ->   HID interval ms <8=1 8-12=3 12-17=8 17-25=7 25-34=0 34-50=0 >=50=10
10:55:19.870 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=47/s seqGaps=0 malformed=0 | maxPending=12.0 staleDrops=0 capped=0 | HID reports=29/s moving=29 sendReturnFalse=29
10:55:19.870 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:19.870 ->   UDP interval ms <8=20 8-12=3 12-17=3 17-25=10 25-34=0 34-50=1 >=50=10
10:55:19.870 ->   HID interval ms <8=2 8-12=3 12-17=4 17-25=8 25-34=1 34-50=1 >=50=10
10:55:20.886 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=47/s seqGaps=0 malformed=0 | maxPending=10.0 staleDrops=0 capped=0 | HID reports=28/s moving=28 sendReturnFalse=28
10:55:20.886 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:20.886 ->   UDP interval ms <8=22 8-12=3 12-17=1 17-25=10 25-34=1 34-50=0 >=50=10
10:55:20.886 ->   HID interval ms <8=1 8-12=6 12-17=4 17-25=5 25-34=2 34-50=0 >=50=10
10:55:21.871 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=43/s seqGaps=0 malformed=0 | maxPending=10.0 staleDrops=0 capped=0 | HID reports=23/s moving=23 sendReturnFalse=23
10:55:21.871 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:21.871 ->   UDP interval ms <8=21 8-12=1 12-17=2 17-25=8 25-34=0 34-50=2 >=50=9
10:55:21.871 ->   HID interval ms <8=1 8-12=1 12-17=7 17-25=3 25-34=0 34-50=2 >=50=9
10:55:22.854 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=8/s seqGaps=0 malformed=0 | maxPending=49.0 staleDrops=0 capped=0 | HID reports=5/s moving=5 sendReturnFalse=5
10:55:22.854 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:22.854 ->   UDP interval ms <8=4 8-12=0 12-17=0 17-25=1 25-34=1 34-50=0 >=50=2
10:55:22.854 ->   HID interval ms <8=0 8-12=1 12-17=1 17-25=1 25-34=0 34-50=0 >=50=2
10:55:23.877 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=4/s seqGaps=0 malformed=0 | maxPending=14.0 staleDrops=0 capped=0 | HID reports=1/s moving=1 sendReturnFalse=1
10:55:23.877 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:23.877 ->   UDP interval ms <8=3 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=1
10:55:23.877 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=1
10:55:24.863 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=12/s seqGaps=0 malformed=0 | maxPending=58.0 staleDrops=0 capped=0 | HID reports=7/s moving=7 sendReturnFalse=7
10:55:24.863 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:24.863 ->   UDP interval ms <8=6 8-12=0 12-17=0 17-25=3 25-34=0 34-50=0 >=50=3
10:55:24.863 ->   HID interval ms <8=0 8-12=1 12-17=2 17-25=1 25-34=0 34-50=0 >=50=3
10:55:25.881 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=12/s seqGaps=0 malformed=0 | maxPending=26.0 staleDrops=0 capped=0 | HID reports=8/s moving=8 sendReturnFalse=8
10:55:25.881 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:25.881 ->   UDP interval ms <8=4 8-12=0 12-17=0 17-25=4 25-34=0 34-50=0 >=50=4
10:55:25.881 ->   HID interval ms <8=0 8-12=0 12-17=1 17-25=3 25-34=0 34-50=0 >=50=4
10:55:26.867 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=9/s seqGaps=0 malformed=0 | maxPending=49.0 staleDrops=0 capped=0 | HID reports=6/s moving=6 sendReturnFalse=6
10:55:26.867 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:26.867 ->   UDP interval ms <8=3 8-12=0 12-17=1 17-25=3 25-34=0 34-50=0 >=50=2
10:55:26.867 ->   HID interval ms <8=0 8-12=0 12-17=2 17-25=2 25-34=0 34-50=0 >=50=2
10:55:27.885 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=1/s seqGaps=0 malformed=0 | maxPending=3.0 staleDrops=0 capped=0 | HID reports=1/s moving=1 sendReturnFalse=1
10:55:27.886 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:27.886 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=1
10:55:27.886 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=1
10:55:28.870 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=41/s seqGaps=0 malformed=0 | maxPending=70.0 staleDrops=0 capped=1 | HID reports=26/s moving=26 sendReturnFalse=26
10:55:28.870 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:28.870 ->   UDP interval ms <8=18 8-12=0 12-17=1 17-25=10 25-34=0 34-50=2 >=50=10
10:55:28.870 ->   HID interval ms <8=0 8-12=3 12-17=9 17-25=2 25-34=0 34-50=2 >=50=10
10:55:29.855 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=48/s seqGaps=0 malformed=0 | maxPending=113.0 staleDrops=0 capped=7 | HID reports=32/s moving=32 sendReturnFalse=32
10:55:29.855 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:29.855 ->   UDP interval ms <8=23 8-12=2 12-17=2 17-25=11 25-34=0 34-50=0 >=50=10
10:55:29.855 ->   HID interval ms <8=1 8-12=9 12-17=8 17-25=4 25-34=0 34-50=0 >=50=10
10:55:30.875 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=44/s seqGaps=0 malformed=0 | maxPending=96.0 staleDrops=0 capped=5 | HID reports=32/s moving=32 sendReturnFalse=32
10:55:30.875 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:30.875 ->   UDP interval ms <8=18 8-12=3 12-17=1 17-25=13 25-34=0 34-50=0 >=50=9
10:55:30.875 ->   HID interval ms <8=0 8-12=10 12-17=9 17-25=3 25-34=1 34-50=0 >=50=9
10:55:31.864 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=25/s seqGaps=0 malformed=0 | maxPending=95.0 staleDrops=0 capped=2 | HID reports=14/s moving=14 sendReturnFalse=14
10:55:31.864 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:31.864 ->   UDP interval ms <8=12 8-12=1 12-17=1 17-25=4 25-34=1 34-50=0 >=50=6
10:55:31.864 ->   HID interval ms <8=0 8-12=3 12-17=0 17-25=4 25-34=1 34-50=0 >=50=6
10:55:32.882 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=9/s seqGaps=0 malformed=0 | maxPending=66.0 staleDrops=0 capped=1 | HID reports=7/s moving=7 sendReturnFalse=7
10:55:32.882 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:32.882 ->   UDP interval ms <8=3 8-12=0 12-17=2 17-25=2 25-34=0 34-50=0 >=50=2
10:55:32.882 ->   HID interval ms <8=1 8-12=2 12-17=1 17-25=1 25-34=0 34-50=0 >=50=2
10:55:33.867 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=45/s seqGaps=0 malformed=0 | maxPending=96.0 staleDrops=0 capped=5 | HID reports=31/s moving=31 sendReturnFalse=31
10:55:33.867 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:33.867 ->   UDP interval ms <8=20 8-12=2 12-17=1 17-25=12 25-34=0 34-50=0 >=50=10
10:55:33.867 ->   HID interval ms <8=4 8-12=6 12-17=5 17-25=5 25-34=1 34-50=0 >=50=10
10:55:34.881 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=7/s seqGaps=0 malformed=0 | maxPending=64.0 staleDrops=0 capped=0 | HID reports=5/s moving=5 sendReturnFalse=5
10:55:34.881 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:34.881 ->   UDP interval ms <8=2 8-12=0 12-17=0 17-25=1 25-34=1 34-50=0 >=50=3
10:55:34.881 ->   HID interval ms <8=0 8-12=0 12-17=1 17-25=1 25-34=0 34-50=0 >=50=3
10:55:35.865 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=18/s seqGaps=0 malformed=0 | maxPending=69.0 staleDrops=0 capped=2 | HID reports=13/s moving=13 sendReturnFalse=13
10:55:35.865 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:35.865 ->   UDP interval ms <8=6 8-12=1 12-17=1 17-25=4 25-34=0 34-50=0 >=50=6
10:55:35.865 ->   HID interval ms <8=0 8-12=3 12-17=2 17-25=1 25-34=1 34-50=0 >=50=6
10:55:36.881 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=18/s seqGaps=0 malformed=0 | maxPending=96.0 staleDrops=0 capped=2 | HID reports=13/s moving=13 sendReturnFalse=13
10:55:36.881 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:36.881 ->   UDP interval ms <8=6 8-12=2 12-17=2 17-25=3 25-34=0 34-50=0 >=50=5
10:55:36.881 ->   HID interval ms <8=0 8-12=3 12-17=2 17-25=3 25-34=0 34-50=0 >=50=5
10:55:37.870 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=17/s seqGaps=0 malformed=0 | maxPending=96.0 staleDrops=0 capped=2 | HID reports=12/s moving=12 sendReturnFalse=12
10:55:37.870 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:37.870 ->   UDP interval ms <8=7 8-12=2 12-17=0 17-25=1 25-34=0 34-50=0 >=50=7
10:55:37.870 ->   HID interval ms <8=1 8-12=3 12-17=1 17-25=0 25-34=0 34-50=0 >=50=7
10:55:38.854 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:55:38.854 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:38.854 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:38.854 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:39.873 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=14/s seqGaps=0 malformed=0 | maxPending=96.0 staleDrops=0 capped=1 | HID reports=11/s moving=11 sendReturnFalse=11
10:55:39.873 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:39.873 ->   UDP interval ms <8=4 8-12=0 12-17=3 17-25=2 25-34=0 34-50=0 >=50=5
10:55:39.873 ->   HID interval ms <8=1 8-12=1 12-17=3 17-25=1 25-34=0 34-50=0 >=50=5
10:55:40.860 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=24/s seqGaps=0 malformed=0 | maxPending=96.0 staleDrops=0 capped=3 | HID reports=17/s moving=17 sendReturnFalse=17
10:55:40.860 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:40.860 ->   UDP interval ms <8=10 8-12=1 12-17=1 17-25=4 25-34=0 34-50=0 >=50=8
10:55:40.860 ->   HID interval ms <8=2 8-12=1 12-17=4 17-25=2 25-34=0 34-50=0 >=50=8
10:55:41.878 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=9/s seqGaps=0 malformed=0 | maxPending=32.0 staleDrops=0 capped=0 | HID reports=9/s moving=9 sendReturnFalse=9
10:55:41.878 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:41.878 ->   UDP interval ms <8=1 8-12=0 12-17=1 17-25=3 25-34=0 34-50=0 >=50=4
10:55:41.878 ->   HID interval ms <8=0 8-12=2 12-17=0 17-25=3 25-34=0 34-50=0 >=50=4
10:55:42.861 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:55:42.861 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:42.861 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:42.861 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:55:43.222 -> 🔌 iPhone disconnected, reason: 531
10:55:43.746 -> 🔄 Restarting advertising...



## Log 4

### IOS

🧩 Found service: 00001234-0000-1000-8000-00805F9B34FB
📡 Found characteristic: 0000ABCD-0000-1000-8000-00805F9B34FB
✅ Write characteristic ready (props: CBCharacteristicProperties(rawValue: 4))
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=68 17-25ms=15 25-34ms=18 34-50ms=0 >=50ms=1 max=61.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=0
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=112 17-25ms=1 25-34ms=1 34-50ms=2 >=50ms=0 max=44.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=0
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=34
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=19 20-33ms=7 33-50ms=8 >=50ms=0 max=41.0ms
  pointer: events=34 emitted=34
  speed: 0-50=0 50-150=0 150-300=1 300-600=10 600-1000=18 1000-1600=5 1600-2400=0 >=2400=0 max=1214.9
  gain: 0-1.1=0 1.1-1.5=34 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=14 16-32=11 32-64=9 64-127=0 >=127=0 max=40.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=62 17-25ms=27 25-34ms=2 34-50ms=9 >=50ms=0 max=45.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=34
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=24 25-34ms=1 34-50ms=8 >=50ms=0 max=41.0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=99
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=13 20-33ms=86 33-50ms=0 >=50ms=0 max=24.6ms
  pointer: events=99 emitted=99
  speed: 0-50=0 50-150=0 150-300=2 300-600=25 600-1000=23 1000-1600=46 1600-2400=3 >=2400=0 max=1690.1
  gain: 0-1.1=0 1.1-1.5=99 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=1 4-8=9 8-16=23 16-32=39 32-64=27 64-127=0 >=127=0 max=45.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=99 25-34ms=0 34-50ms=0 >=50ms=0 max=24.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=99
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=99 25-34ms=0 34-50ms=0 >=50ms=0 max=24.6ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=98
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=34 20-33ms=64 33-50ms=0 >=50ms=0 max=26.0ms
  pointer: events=98 emitted=98
  speed: 0-50=0 50-150=9 150-300=62 300-600=26 600-1000=1 1000-1600=0 1600-2400=0 >=2400=0 max=605.5
  gain: 0-1.1=0 1.1-1.5=98 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=1 2-4=21 4-8=50 8-16=23 16-32=3 32-64=0 64-127=0 >=127=0 max=22.4
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=97 25-34ms=1 34-50ms=0 >=50ms=0 max=26.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=98
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=97 25-34ms=1 34-50ms=0 >=50ms=0 max=26.0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=75
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=21 20-33ms=53 33-50ms=1 >=50ms=0 max=43.6ms
  pointer: events=75 emitted=75
  speed: 0-50=0 50-150=6 150-300=60 300-600=9 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=449.6
  gain: 0-1.1=0 1.1-1.5=75 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=2 2-4=16 4-8=40 8-16=16 16-32=1 32-64=0 64-127=0 >=127=0 max=17
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=23 17-25ms=72 25-34ms=1 34-50ms=1 >=50ms=1 max=60.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=75
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=73 25-34ms=1 34-50ms=1 >=50ms=0 max=43.6ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=33
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=24 20-33ms=5 33-50ms=4 >=50ms=0 max=42.6ms
  pointer: events=33 emitted=33
  speed: 0-50=0 50-150=4 150-300=10 300-600=17 600-1000=2 1000-1600=0 1600-2400=0 >=2400=0 max=673.2
  gain: 0-1.1=0 1.1-1.5=33 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=1 2-4=7 4-8=8 8-16=10 16-32=7 32-64=0 64-127=0 >=127=0 max=24.8
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=60 17-25ms=32 25-34ms=3 34-50ms=5 >=50ms=1 max=52.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=33
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=27 25-34ms=1 34-50ms=3 >=50ms=2 max=1064.9ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=66
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=33 20-33ms=33 33-50ms=0 >=50ms=0 max=25.4ms
  pointer: events=66 emitted=66
  speed: 0-50=0 50-150=0 150-300=10 300-600=56 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=598.1
  gain: 0-1.1=0 1.1-1.5=66 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=26 8-16=32 16-32=8 32-64=0 64-127=0 >=127=0 max=21.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=1 12-17ms=34 17-25ms=65 25-34ms=2 34-50ms=0 >=50ms=1 max=53.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=66
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=65 25-34ms=1 34-50ms=0 >=50ms=0 max=25.4ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=60
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=26 20-33ms=27 33-50ms=7 >=50ms=0 max=40.8ms
  pointer: events=60 emitted=60
  speed: 0-50=0 50-150=0 150-300=8 300-600=47 600-1000=5 1000-1600=0 1600-2400=0 >=2400=0 max=706.3
  gain: 0-1.1=0 1.1-1.5=60 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=22 8-16=29 16-32=9 32-64=0 64-127=0 >=127=0 max=27.8
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=27 17-25ms=53 25-34ms=3 34-50ms=8 >=50ms=1 max=54.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=60
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=51 25-34ms=1 34-50ms=7 >=50ms=1 max=869.8ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=81
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=27 20-33ms=52 33-50ms=2 >=50ms=0 max=41.0ms
  pointer: events=81 emitted=81
  speed: 0-50=0 50-150=0 150-300=4 300-600=77 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=562.2
  gain: 0-1.1=0 1.1-1.5=81 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=32 8-16=41 16-32=8 32-64=0 64-127=0 >=127=0 max=20.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=14 17-25ms=78 25-34ms=3 34-50ms=2 >=50ms=0 max=41.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=81
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=77 25-34ms=2 34-50ms=1 >=50ms=1 max=766.3ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=55
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=55 33-50ms=0 >=50ms=0 max=23.5ms
  pointer: events=55 emitted=55
  speed: 0-50=0 50-150=0 150-300=23 300-600=32 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=527.3
  gain: 0-1.1=0 1.1-1.5=55 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=4 4-8=31 8-16=16 16-32=4 32-64=0 64-127=0 >=127=0 max=21.9
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=45 17-25ms=54 25-34ms=2 34-50ms=0 >=50ms=1 max=58.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=55
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=55 25-34ms=0 34-50ms=0 >=50ms=0 max=23.5ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=5
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=2 33-50ms=2 >=50ms=0 max=42.7ms
  pointer: events=5 emitted=5
  speed: 0-50=0 50-150=0 150-300=2 300-600=3 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=337.6
  gain: 0-1.1=0 1.1-1.5=5 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=1 8-16=3 16-32=1 32-64=0 64-127=0 >=127=0 max=17.5
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=102 17-25ms=4 25-34ms=3 34-50ms=4 >=50ms=0 max=42.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=5
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=1 25-34ms=1 34-50ms=2 >=50ms=1 max=2713.5ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=93
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=28 20-33ms=61 33-50ms=2 >=50ms=2 max=59.2ms
  pointer: events=93 emitted=93
  speed: 0-50=0 50-150=0 150-300=32 300-600=57 600-1000=4 1000-1600=0 1600-2400=0 >=2400=0 max=676.5
  gain: 0-1.1=0 1.1-1.5=93 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=5 4-8=40 8-16=36 16-32=12 32-64=0 64-127=0 >=127=0 max=27.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=88 25-34ms=2 34-50ms=1 >=50ms=2 max=59.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=93
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=87 25-34ms=2 34-50ms=2 >=50ms=2 max=59.2ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=81
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=79 33-50ms=2 >=50ms=0 max=41.7ms
  pointer: events=81 emitted=81
  speed: 0-50=0 50-150=0 150-300=12 300-600=64 600-1000=5 1000-1600=0 1600-2400=0 >=2400=0 max=747.7
  gain: 0-1.1=0 1.1-1.5=81 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=5 4-8=21 8-16=41 16-32=14 32-64=0 64-127=0 >=127=0 max=26.9
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=8 17-25ms=76 25-34ms=3 34-50ms=2 >=50ms=1 max=56.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=81
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=77 25-34ms=2 34-50ms=2 >=50ms=0 max=41.7ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=118 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=29.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=0
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=112 17-25ms=1 25-34ms=3 34-50ms=1 >=50ms=0 max=35.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=0
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=34
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=17 20-33ms=10 33-50ms=7 >=50ms=0 max=42.4ms
  pointer: events=34 emitted=34
  speed: 0-50=0 50-150=1 150-300=1 300-600=29 600-1000=3 1000-1600=0 1600-2400=0 >=2400=0 max=628.7
  gain: 0-1.1=0 1.1-1.5=34 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=6 8-16=17 16-32=11 32-64=0 64-127=0 >=127=0 max=27.5
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=58 17-25ms=26 25-34ms=4 34-50ms=7 >=50ms=2 max=53.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: sent=34
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=26 25-34ms=0 34-50ms=7 >=50ms=1 max=4667.7ms
  dropped movement: events=0 absDx=0 absDy=0

### ESP
10:37:17.322 -> 📶 iP
10:37:17.322 -> ✅ Connection parameters updated
10:37:17.682 -> 📏 MTU updated to: 247
10:37:18.306 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:18.306 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:18.306 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:18.306 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:19.325 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:19.325 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:19.325 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:19.325 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:20.310 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:20.310 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:20.310 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:20.310 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:21.328 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:21.328 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:21.328 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:21.328 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:22.315 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:22.315 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:22.315 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:22.315 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:23.300 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:23.300 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:23.300 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:23.300 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:24.329 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:40.328 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:40.328 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:40.328 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:41.312 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:41.313 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:41.313 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:41.313 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:42.302 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:42.302 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:42.302 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:42.302 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:43.317 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:43.317 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:43.317 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:43.317 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:44.305 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:44.305 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:44.305 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:44.305 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:45.297 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:45.297 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:45.297 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:45.297 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:46.317 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:46.317 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:46.317 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:46.317 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:47.302 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:47.302 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:47.302 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:47.302 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:48.324 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:48.324 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:48.324 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:48.324 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:49.311 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:49.311 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:49.311 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:49.311 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:50.300 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:50.300 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:50.300 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:50.300 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:51.319 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:51.319 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:51.319 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:51.319 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:52.306 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:52.306 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:52.306 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:52.306 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:53.325 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 | UDP rx=0/s seqGaps=0 malformed=0 | maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
10:37:53.325 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:53.325 ->   UDP interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:53.325 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
10:37:53.391 -> 🔌 iPhone disconnected, reason: 531
10:37:53.917 -> 🔄 Restarting advertising...



## Log 3

### IOS

🔍 Found peripheral: ESP_MouseBridge
✅ Connected to ESP_MouseBridge
🔍 Starting service discovery...
🧩 Found service: 00001234-0000-1000-8000-00805F9B34FB
📈 Movement diagnostics
  touch: events=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=61 17-25ms=2 25-34ms=0 34-50ms=0 >=50ms=1 max=973.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📡 Found characteristic: 0000ABCD-0000-1000-8000-00805F9B34FB
✅ Write characteristic ready (props: CBCharacteristicProperties(rawValue: 4))
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=73 17-25ms=14 25-34ms=15 34-50ms=0 >=50ms=1 max=50.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 35 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=51
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=7 20-33ms=44 33-50ms=0 >=50ms=0 max=27.9ms
  pointer: events=51 emitted=51
  speed: 0-50=0 50-150=1 150-300=3 300-600=22 600-1000=22 1000-1600=3 1600-2400=0 >=2400=0 max=1185.7
  gain: 0-1.1=0 1.1-1.5=51 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=2 2-4=0 4-8=12 8-16=16 16-32=17 32-64=4 64-127=0 >=127=0 max=43.9
  BLE: attempts=51 sent=51 blocked=0 readyCb=51 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=43 17-25ms=51 25-34ms=4 34-50ms=2 >=50ms=1 max=54.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=48 25-34ms=2 34-50ms=0 >=50ms=0 max=27.6ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 90 packets in 2s, dropped: 2
📈 Movement diagnostics
  touch: events=93
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=20 20-33ms=67 33-50ms=6 >=50ms=0 max=41.5ms
  pointer: events=93 emitted=93
  speed: 0-50=0 50-150=1 150-300=2 300-600=11 600-1000=38 1000-1600=41 1600-2400=0 >=2400=0 max=1479.3
  gain: 0-1.1=0 1.1-1.5=93 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=4 2-4=2 4-8=1 8-16=19 16-32=35 32-64=32 64-127=0 >=127=0 max=45.3
  BLE: attempts=93 sent=91 blocked=2 readyCb=91 longestBlock=39.7ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=85 25-34ms=1 34-50ms=6 >=50ms=0 max=41.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=82 25-34ms=1 34-50ms=7 >=50ms=1 max=59.7ms
  dropped movement: events=2 absDx=30 absDy=38
📊 Sent 41 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=40
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=37 33-50ms=2 >=50ms=0 max=46.9ms
  pointer: events=40 emitted=40
  speed: 0-50=0 50-150=0 150-300=1 300-600=0 600-1000=18 1000-1600=21 1600-2400=0 >=2400=0 max=1545.8
  gain: 0-1.1=0 1.1-1.5=40 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=5 16-32=18 32-64=17 64-127=0 >=127=0 max=45.3
  BLE: attempts=40 sent=40 blocked=0 readyCb=40 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=61 17-25ms=36 25-34ms=3 34-50ms=2 >=50ms=1 max=55.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=36 25-34ms=2 34-50ms=1 >=50ms=1 max=1156.8ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 42 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=40
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=38 33-50ms=1 >=50ms=0 max=40.4ms
  pointer: events=40 emitted=40
  speed: 0-50=0 50-150=0 150-300=1 300-600=5 600-1000=18 1000-1600=16 1600-2400=0 >=2400=0 max=1423.1
  gain: 0-1.1=0 1.1-1.5=40 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=1 2-4=0 4-8=2 8-16=8 16-32=15 32-64=14 64-127=0 >=127=0 max=45.3
  BLE: attempts=40 sent=40 blocked=0 readyCb=40 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=62 17-25ms=38 25-34ms=2 34-50ms=2 >=50ms=1 max=53.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=37 25-34ms=1 34-50ms=1 >=50ms=1 max=1189.4ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 58 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=62
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=8 20-33ms=54 33-50ms=0 >=50ms=0 max=29.4ms
  pointer: events=62 emitted=62
  speed: 0-50=0 50-150=0 150-300=0 300-600=11 600-1000=31 1000-1600=20 1600-2400=0 >=2400=0 max=1541.3
  gain: 0-1.1=0 1.1-1.5=62 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=1 2-4=4 4-8=4 8-16=12 16-32=24 32-64=17 64-127=0 >=127=0 max=45.3
  BLE: attempts=62 sent=62 blocked=0 readyCb=62 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=36 17-25ms=60 25-34ms=3 34-50ms=0 >=50ms=2 max=53.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=60 25-34ms=1 34-50ms=0 >=50ms=1 max=769.3ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 97 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=89
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=89 33-50ms=0 >=50ms=0 max=25.3ms
  pointer: events=89 emitted=89
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=10 1000-1600=57 1600-2400=22 >=2400=0 max=1775.3
  gain: 0-1.1=0 1.1-1.5=89 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=1 4-8=1 8-16=2 16-32=6 32-64=79 64-127=0 >=127=0 max=45.3
  BLE: attempts=89 sent=89 blocked=0 readyCb=89 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=6 17-25ms=88 25-34ms=2 34-50ms=0 >=50ms=1 max=53.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=88 25-34ms=1 34-50ms=0 >=50ms=0 max=25.3ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 34 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=42
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=11 20-33ms=30 33-50ms=1 >=50ms=0 max=49.6ms
  pointer: events=42 emitted=42
  speed: 0-50=0 50-150=0 150-300=0 300-600=2 600-1000=19 1000-1600=21 1600-2400=0 >=2400=0 max=1393.6
  gain: 0-1.1=0 1.1-1.5=42 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=1 2-4=2 4-8=1 8-16=7 16-32=14 32-64=17 64-127=0 >=127=0 max=45.3
  BLE: attempts=42 sent=42 blocked=0 readyCb=42 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=64 17-25ms=40 25-34ms=2 34-50ms=1 >=50ms=0 max=49.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=40 25-34ms=1 34-50ms=0 >=50ms=1 max=1328.5ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 50 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=39
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=2 20-33ms=35 33-50ms=2 >=50ms=0 max=45.4ms
  pointer: events=39 emitted=39
  speed: 0-50=0 50-150=1 150-300=1 300-600=3 600-1000=7 1000-1600=27 1600-2400=0 >=2400=0 max=1529.6
  gain: 0-1.1=0 1.1-1.5=39 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=1 8-16=3 16-32=11 32-64=24 64-127=0 >=127=0 max=45.3
  BLE: attempts=39 sent=39 blocked=0 readyCb=39 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=0 12-17ms=41 17-25ms=36 25-34ms=9 34-50ms=4 >=50ms=3 max=55.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=34 25-34ms=1 34-50ms=1 >=50ms=3 max=530.1ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 15 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=25
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=20 33-50ms=4 >=50ms=0 max=45.3ms
  pointer: events=25 emitted=25
  speed: 0-50=1 50-150=0 150-300=1 300-600=10 600-1000=9 1000-1600=4 1600-2400=0 >=2400=0 max=1430.2
  gain: 0-1.1=0 1.1-1.5=25 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=3 8-16=7 16-32=8 32-64=7 64-127=0 >=127=0 max=45.3
  BLE: attempts=25 sent=25 blocked=0 readyCb=25 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=50 17-25ms=26 25-34ms=10 34-50ms=4 >=50ms=3 max=55.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=19 25-34ms=2 34-50ms=1 >=50ms=3 max=579.8ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 43 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=34
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=11 20-33ms=15 33-50ms=8 >=50ms=0 max=41.8ms
  pointer: events=34 emitted=34
  speed: 0-50=0 50-150=0 150-300=14 300-600=20 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=519.3
  gain: 0-1.1=0 1.1-1.5=34 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=1 2-4=5 4-8=11 8-16=11 16-32=6 32-64=0 64-127=0 >=127=0 max=23.4
  BLE: attempts=34 sent=34 blocked=0 readyCb=34 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=54 17-25ms=26 25-34ms=4 34-50ms=9 >=50ms=2 max=53.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=24 25-34ms=1 34-50ms=8 >=50ms=1 max=985.4ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 58 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=50
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=10 20-33ms=32 33-50ms=8 >=50ms=0 max=41.4ms
  pointer: events=50 emitted=50
  speed: 0-50=0 50-150=1 150-300=12 300-600=30 600-1000=7 1000-1600=0 1600-2400=0 >=2400=0 max=844.5
  gain: 0-1.1=0 1.1-1.5=50 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=1 2-4=5 4-8=14 8-16=21 16-32=8 32-64=1 64-127=0 >=127=0 max=32.0
  BLE: attempts=50 sent=50 blocked=0 readyCb=50 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=38 17-25ms=42 25-34ms=3 34-50ms=9 >=50ms=1 max=53.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=40 25-34ms=1 34-50ms=8 >=50ms=1 max=635.7ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 68 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=83
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=34 20-33ms=47 33-50ms=2 >=50ms=0 max=48.4ms
  pointer: events=83 emitted=83
  speed: 0-50=0 50-150=2 150-300=32 300-600=45 600-1000=4 1000-1600=0 1600-2400=0 >=2400=0 max=730.9
  gain: 0-1.1=0 1.1-1.5=83 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.1
  emit delta: 0-1=0 1-2=1 2-4=3 4-8=43 8-16=28 16-32=8 32-64=0 64-127=0 >=127=0 max=25.6
  BLE: attempts=83 sent=83 blocked=0 readyCb=83 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=12 17-25ms=79 25-34ms=3 34-50ms=2 >=50ms=0 max=48.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=79 25-34ms=2 34-50ms=1 >=50ms=1 max=680.7ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 20 packets in 2s, dropped: 0

### ESP
15:18:53.246 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
15:18:53.246 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
15:18:53.246 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
15:18:54.231 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
15:18:54.231 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
15:18:54.231 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
15:18:55.251 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
15:18:55.251 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
15:18:55.251 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
15:18:56.238 -> 📈 ESP movement diagnostics | BLE rx=19/s seqGaps=0 malformed=0 maxPending=40.0 staleDrops=0 capped=0 | HID reports=13/s moving=13 sendReturnFalse=13
15:18:56.238 ->   BLE interval ms <8=6 8-12=0 12-17=0 17-25=0 25-34=12 34-50=0 >=50=0
15:18:56.238 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=3 25-34=3 34-50=6 >=50=0
15:18:57.253 -> 📈 ESP movement diagnostics | BLE rx=44/s seqGaps=0 malformed=0 maxPending=47.0 staleDrops=0 capped=0 | HID reports=33/s moving=33 sendReturnFalse=33
15:18:57.253 ->   BLE interval ms <8=12 8-12=0 12-17=0 17-25=0 25-34=31 34-50=0 >=50=1
15:18:57.253 ->   HID interval ms <8=0 8-12=0 12-17=1 17-25=8 25-34=3 34-50=20 >=50=1
15:18:58.239 -> 📈 ESP movement diagnostics | BLE rx=46/s seqGaps=2 malformed=0 maxPending=64.0 staleDrops=0 capped=0 | HID reports=31/s moving=31 sendReturnFalse=31
15:18:58.239 ->   BLE interval ms <8=14 8-12=0 12-17=0 17-25=0 25-34=30 34-50=0 >=50=2
15:18:58.239 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=5 25-34=4 34-50=20 >=50=2
15:18:59.248 -> 📈 ESP movement diagnostics | BLE rx=48/s seqGaps=0 malformed=0 maxPending=64.0 staleDrops=0 capped=0 | HID reports=32/s moving=32 sendReturnFalse=32
15:18:59.248 ->   BLE interval ms <8=16 8-12=0 12-17=0 17-25=0 25-34=31 34-50=0 >=50=1
15:18:59.248 ->   HID interval ms <8=0 8-12=0 12-17=1 17-25=7 25-34=4 34-50=19 >=50=1
15:19:00.229 -> 📈 ESP movement diagnostics | BLE rx=4/s seqGaps=0 malformed=0 maxPending=50.0 staleDrops=0 capped=0 | HID reports=4/s moving=4 sendReturnFalse=4
15:19:00.229 ->   BLE interval ms <8=1 8-12=0 12-17=0 17-25=0 25-34=3 34-50=0 >=50=0
15:19:00.229 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=1 25-34=2 34-50=1 >=50=0
15:19:01.247 -> 📈 ESP movement diagnostics | BLE rx=36/s seqGaps=0 malformed=0 maxPending=64.0 staleDrops=0 capped=0 | HID reports=26/s moving=26 sendReturnFalse=26
15:19:01.247 ->   BLE interval ms <8=9 8-12=0 12-17=0 17-25=0 25-34=26 34-50=0 >=50=1
15:19:01.247 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=6 25-34=4 34-50=15 >=50=1
15:19:02.234 -> 📈 ESP movement diagnostics | BLE rx=10/s seqGaps=0 malformed=0 maxPending=51.0 staleDrops=0 capped=0 | HID reports=8/s moving=8 sendReturnFalse=8
15:19:02.234 ->   BLE interval ms <8=3 8-12=0 12-17=0 17-25=0 25-34=6 34-50=0 >=50=1
15:19:02.234 ->   HID interval ms <8=0 8-12=0 12-17=1 17-25=1 25-34=2 34-50=3 >=50=1
15:19:03.253 -> 📈 ESP movement diagnostics | BLE rx=28/s seqGaps=0 malformed=0 maxPending=59.0 staleDrops=0 capped=0 | HID reports=21/s moving=21 sendReturnFalse=21
15:19:03.253 ->   BLE interval ms <8=8 8-12=0 12-17=0 17-25=0 25-34=19 34-50=0 >=50=1
15:19:03.253 ->   HID interval ms <8=0 8-12=0 12-17=2 17-25=5 25-34=1 34-50=12 >=50=1
15:19:04.240 -> 📈 ESP movement diagnostics | BLE rx=13/s seqGaps=0 malformed=0 maxPending=55.0 staleDrops=0 capped=0 | HID reports=8/s moving=8 sendReturnFalse=8
15:19:04.240 ->   BLE interval ms <8=4 8-12=0 12-17=0 17-25=0 25-34=8 34-50=0 >=50=1
15:19:04.240 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=1 25-34=2 34-50=4 >=50=1
15:19:05.256 -> 📈 ESP movement diagnostics | BLE rx=49/s seqGaps=0 malformed=0 maxPending=64.0 staleDrops=0 capped=0 | HID reports=34/s moving=34 sendReturnFalse=34
15:19:05.256 ->   BLE interval ms <8=16 8-12=0 12-17=0 17-25=0 25-34=33 34-50=0 >=50=0
15:19:05.256 ->   HID interval ms <8=0 8-12=0 12-17=2 17-25=8 25-34=2 34-50=22 >=50=0
15:19:06.245 -> 📈 ESP movement diagnostics | BLE rx=48/s seqGaps=0 malformed=0 maxPending=64.0 staleDrops=0 capped=0 | HID reports=35/s moving=35 sendReturnFalse=35
15:19:06.245 ->   BLE interval ms <8=15 8-12=0 12-17=0 17-25=0 25-34=33 34-50=0 >=50=0
15:19:06.245 ->   HID interval ms <8=0 8-12=0 12-17=2 17-25=8 25-34=2 34-50=23 >=50=0



## Log 2

### IOS
🔍 Found peripheral: ESP_MouseBridge
✅ Connected to ESP_MouseBridge
🔍 Starting service discovery...
📈 Movement diagnostics
  touch: events=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=47 17-25ms=2 25-34ms=0 34-50ms=0 >=50ms=1 max=1211.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
🧩 Found service: 00001234-0000-1000-8000-00805F9B34FB
📡 Found characteristic: 0000ABCD-0000-1000-8000-00805F9B34FB
✅ Write characteristic ready (props: CBCharacteristicProperties(rawValue: 4))
📊 Sent 18 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=25
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=6 20-33ms=10 33-50ms=9 >=50ms=0 max=41.8ms
  pointer: events=25 emitted=25
  speed: 0-50=0 50-150=3 150-300=11 300-600=10 600-1000=1 1000-1600=0 1600-2400=0 >=2400=0 max=631.7
  gain: 0-1.1=0 1.1-1.5=25 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.5
  emit delta: 0-1=0 1-2=0 2-4=3 4-8=7 8-16=11 16-32=4 32-64=0 64-127=0 >=127=0 max=26.9
  BLE: attempts=25 sent=25 blocked=0 readyCb=25 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=26 17-25ms=30 25-34ms=18 34-50ms=11 >=50ms=0 max=41.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=15 25-34ms=0 34-50ms=9 >=50ms=0 max=41.8ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 93 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=94
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=22 20-33ms=67 33-50ms=5 >=50ms=0 max=41.5ms
  pointer: events=94 emitted=94
  speed: 0-50=0 50-150=0 150-300=18 300-600=44 600-1000=27 1000-1600=5 1600-2400=0 >=2400=0 max=1240.9
  gain: 0-1.1=0 1.1-1.5=65 1.5-2=26 2-2.5=3 2.5-3=0 3-3.5=0 >=3.5=0 max=2.2
  emit delta: 0-1=0 1-2=0 2-4=2 4-8=22 8-16=30 16-32=29 32-64=8 64-127=3 >=127=0 max=83.9
  BLE: attempts=94 sent=94 blocked=0 readyCb=94 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=88 25-34ms=1 34-50ms=5 >=50ms=0 max=41.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=88 25-34ms=1 34-50ms=5 >=50ms=0 max=41.5ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 56 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=48
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=3 20-33ms=41 33-50ms=4 >=50ms=0 max=40.6ms
  pointer: events=48 emitted=48
  speed: 0-50=0 50-150=1 150-300=3 300-600=21 600-1000=16 1000-1600=7 1600-2400=0 >=2400=0 max=1207.7
  gain: 0-1.1=0 1.1-1.5=28 1.5-2=18 2-2.5=2 2.5-3=0 3-3.5=0 >=3.5=0 max=2.1
  emit delta: 0-1=0 1-2=1 2-4=3 4-8=2 8-16=17 16-32=10 32-64=11 64-127=4 >=127=0 max=80.1
  BLE: attempts=48 sent=48 blocked=0 readyCb=48 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=46 17-25ms=44 25-34ms=4 34-50ms=4 >=50ms=1 max=75.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=41 25-34ms=1 34-50ms=5 >=50ms=1 max=65.3ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 78 packets in 2s, dropped: 1
📈 Movement diagnostics
  touch: events=79
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=10 20-33ms=64 33-50ms=5 >=50ms=0 max=49.2ms
  pointer: events=79 emitted=79
  speed: 0-50=0 50-150=0 150-300=0 300-600=4 600-1000=17 1000-1600=52 1600-2400=6 >=2400=0 max=1711.9
  gain: 0-1.1=0 1.1-1.5=6 1.5-2=17 2-2.5=56 2.5-3=0 3-3.5=0 >=3.5=0 max=2.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=10 8-16=0 16-32=3 32-64=10 64-127=56 >=127=0 max=113.1
  BLE: attempts=79 sent=78 blocked=1 readyCb=78 longestBlock=20.1ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=9 17-25ms=74 25-34ms=1 34-50ms=6 >=50ms=1 max=55.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=70 25-34ms=1 34-50ms=6 >=50ms=1 max=992.5ms
  dropped movement: events=1 absDx=26 absDy=32
📊 Sent 9 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=16
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=3 20-33ms=12 33-50ms=0 >=50ms=1 max=53.6ms
  pointer: events=16 emitted=16
  speed: 0-50=0 50-150=1 150-300=0 300-600=2 600-1000=4 1000-1600=9 1600-2400=0 >=2400=0 max=1596.7
  gain: 0-1.1=0 1.1-1.5=3 1.5-2=6 2-2.5=7 2.5-3=0 3-3.5=0 >=3.5=0 max=2.4
  emit delta: 0-1=0 1-2=1 2-4=1 4-8=1 8-16=1 16-32=0 32-64=1 64-127=11 >=127=0 max=113.1
  BLE: attempts=16 sent=16 blocked=0 readyCb=16 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=95 17-25ms=13 25-34ms=3 34-50ms=0 >=50ms=1 max=53.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=13 25-34ms=2 34-50ms=0 >=50ms=1 max=1867.1ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 96 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=96
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=96 33-50ms=0 >=50ms=0 max=25.0ms
  pointer: events=96 emitted=96
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=8 1000-1600=71 1600-2400=17 >=2400=0 max=1750.9
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=12 2-2.5=84 2.5-3=0 3-3.5=0 >=3.5=0 max=2.4
  emit delta: 0-1=0 1-2=0 2-4=1 4-8=1 8-16=0 16-32=4 32-64=14 64-127=76 >=127=0 max=113.1
  BLE: attempts=96 sent=96 blocked=0 readyCb=96 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=95 25-34ms=1 34-50ms=0 >=50ms=0 max=25.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=95 25-34ms=1 34-50ms=0 >=50ms=0 max=25.0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 32 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=25
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=23 33-50ms=1 >=50ms=0 max=50.0ms
  pointer: events=25 emitted=25
  speed: 0-50=0 50-150=2 150-300=1 300-600=0 600-1000=11 1000-1600=11 1600-2400=0 >=2400=0 max=1594.5
  gain: 0-1.1=0 1.1-1.5=3 1.5-2=12 2-2.5=10 2.5-3=0 3-3.5=0 >=3.5=0 max=2.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=1 8-16=2 16-32=9 32-64=4 64-127=9 >=127=0 max=112.4
  BLE: attempts=25 sent=25 blocked=0 readyCb=25 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=78 17-25ms=23 25-34ms=3 34-50ms=1 >=50ms=2 max=54.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=23 25-34ms=1 34-50ms=0 >=50ms=1 max=1042.4ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 12 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=13
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=5 20-33ms=7 33-50ms=0 >=50ms=1 max=50.9ms
  pointer: events=13 emitted=13
  speed: 0-50=1 50-150=0 150-300=3 300-600=1 600-1000=7 1000-1600=1 1600-2400=0 >=2400=0 max=1079.3
  gain: 0-1.1=0 1.1-1.5=5 1.5-2=8 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=2.0
  emit delta: 0-1=0 1-2=0 2-4=1 4-8=0 8-16=5 16-32=5 32-64=1 64-127=1 >=127=0 max=71.5
  BLE: attempts=13 sent=13 blocked=0 readyCb=13 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=1 12-17ms=90 17-25ms=11 25-34ms=3 34-50ms=2 >=50ms=2 max=55.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=10 25-34ms=1 34-50ms=0 >=50ms=2 max=1188.6ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 34 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=39
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=11 20-33ms=25 33-50ms=3 >=50ms=0 max=40.0ms
  pointer: events=39 emitted=38
  speed: 0-50=0 50-150=1 150-300=8 300-600=20 600-1000=10 1000-1600=0 1600-2400=0 >=2400=0 max=721.4
  gain: 0-1.1=0 1.1-1.5=35 1.5-2=4 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.6
  emit delta: 0-1=0 1-2=0 2-4=3 4-8=9 8-16=10 16-32=13 32-64=3 64-127=0 >=127=0 max=45.0
  BLE: attempts=38 sent=38 blocked=0 readyCb=38 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=45 17-25ms=37 25-34ms=5 34-50ms=5 >=50ms=3 max=55.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=32 25-34ms=1 34-50ms=3 >=50ms=2 max=637.4ms
  dropped movement: events=0 absDx=0 absDy=0
left clicked and sent
📊 Sent 34 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=28
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=7 20-33ms=20 33-50ms=1 >=50ms=0 max=34.3ms
  pointer: events=28 emitted=28
  speed: 0-50=0 50-150=2 150-300=7 300-600=9 600-1000=10 1000-1600=0 1600-2400=0 >=2400=0 max=842.7
  gain: 0-1.1=0 1.1-1.5=22 1.5-2=6 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.7
  emit delta: 0-1=0 1-2=2 2-4=3 4-8=5 8-16=6 16-32=7 32-64=5 64-127=0 >=127=0 max=54.1
  BLE: attempts=31 sent=31 blocked=0 readyCb=31 longestBlock=0.0ms
  BLE tick dt: 0-8ms=5 8-12ms=0 12-17ms=53 17-25ms=32 25-34ms=5 34-50ms=3 >=50ms=3 max=57.0ms
  BLE send dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=25 25-34ms=1 34-50ms=0 >=50ms=4 max=528.2ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 46 packets in 2s, dropped: 1
📈 Movement diagnostics
  touch: events=45
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=2 20-33ms=26 33-50ms=17 >=50ms=0 max=42.2ms
  pointer: events=45 emitted=45
  speed: 0-50=1 50-150=0 150-300=2 300-600=18 600-1000=19 1000-1600=5 1600-2400=0 >=2400=0 max=1214.2
  gain: 0-1.1=0 1.1-1.5=23 1.5-2=20 2-2.5=2 2.5-3=0 3-3.5=0 >=3.5=0 max=2.1
  emit delta: 0-1=0 1-2=1 2-4=1 4-8=7 8-16=6 16-32=15 32-64=7 64-127=8 >=127=0 max=84.2
  BLE: attempts=45 sent=44 blocked=1 readyCb=44 longestBlock=20.1ms
  BLE tick dt: 0-8ms=3 8-12ms=1 12-17ms=23 17-25ms=31 25-34ms=5 34-50ms=17 >=50ms=3 max=56.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=25 25-34ms=0 34-50ms=17 >=50ms=2 max=317.9ms
  dropped movement: events=1 absDx=5 absDy=10
📊 Sent 36 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=41
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=12 20-33ms=23 33-50ms=6 >=50ms=0 max=41.1ms
  pointer: events=41 emitted=41
  speed: 0-50=1 50-150=0 150-300=3 300-600=19 600-1000=16 1000-1600=2 1600-2400=0 >=2400=0 max=1065.9
  gain: 0-1.1=0 1.1-1.5=26 1.5-2=15 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.9
  emit delta: 0-1=0 1-2=3 2-4=1 4-8=8 8-16=9 16-32=12 32-64=5 64-127=3 >=127=0 max=89
  BLE: attempts=41 sent=41 blocked=0 readyCb=41 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=1 12-17ms=21 17-25ms=41 25-34ms=11 34-50ms=8 >=50ms=3 max=73.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=30 25-34ms=1 34-50ms=6 >=50ms=4 max=518.5ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 49 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=48
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=3 20-33ms=38 33-50ms=6 >=50ms=1 max=57.7ms
  pointer: events=48 emitted=48
  speed: 0-50=0 50-150=0 150-300=1 300-600=23 600-1000=15 1000-1600=9 1600-2400=0 >=2400=0 max=1412.9
  gain: 0-1.1=0 1.1-1.5=25 1.5-2=14 2-2.5=9 2.5-3=0 3-3.5=0 >=3.5=0 max=2.4
  emit delta: 0-1=0 1-2=0 2-4=2 4-8=4 8-16=14 16-32=12 32-64=3 64-127=13 >=127=0 max=113.1
  BLE: attempts=48 sent=48 blocked=0 readyCb=48 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=34 17-25ms=42 25-34ms=5 34-50ms=7 >=50ms=2 max=57.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=37 25-34ms=2 34-50ms=6 >=50ms=3 max=625.5ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 90 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=92
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=91 33-50ms=1 >=50ms=0 max=42.1ms
  pointer: events=92 emitted=92
  speed: 0-50=0 50-150=0 150-300=0 300-600=1 600-1000=10 1000-1600=66 1600-2400=15 >=2400=0 max=1762.8
  gain: 0-1.1=0 1.1-1.5=1 1.5-2=23 2-2.5=68 2.5-3=0 3-3.5=0 >=3.5=0 max=2.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=2 8-16=2 16-32=9 32-64=18 64-127=61 >=127=0 max=113.1
  BLE: attempts=92 sent=92 blocked=0 readyCb=92 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=90 25-34ms=1 34-50ms=1 >=50ms=0 max=42.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=90 25-34ms=1 34-50ms=1 >=50ms=0 max=42.1ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 77 packets in 2s, dropped: 1
📈 Movement diagnostics
  touch: events=66
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=66 33-50ms=0 >=50ms=0 max=23.9ms
  pointer: events=66 emitted=66
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=8 1000-1600=45 1600-2400=13 >=2400=0 max=1749.2
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=12 2-2.5=54 2.5-3=0 3-3.5=0 >=3.5=0 max=2.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=2 16-32=6 32-64=13 64-127=45 >=127=0 max=113.1
  BLE: attempts=72 sent=71 blocked=1 readyCb=71 longestBlock=21.3ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=19 17-25ms=72 25-34ms=1 34-50ms=0 >=50ms=2 max=57.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=68 25-34ms=0 34-50ms=1 >=50ms=2 max=105.0ms
  dropped movement: events=1 absDx=21 absDy=17

### ESP
14:51:49.384 ->   HID interval ms <8=0 8-12=0 12-17=2 17-25=11 25-34=0 34-50=5 >=50=4
14:51:50.370 -> 📈 ESP movement diagnostics | BLE rx=24/s seqGaps=0 malformed=0 maxPending=85.0 staleDrops=0 capped=4 | HID reports=20/s moving=20 sendReturnFalse=20
14:51:50.370 ->   BLE interval ms <8=7 8-12=0 12-17=0 17-25=0 25-34=16 34-50=0 >=50=1
14:51:50.370 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=9 25-34=4 34-50=6 >=50=1
14:51:51.391 -> 📈 ESP movement diagnostics | BLE rx=34/s seqGaps=0 malformed=0 maxPending=228.0 staleDrops=0 capped=40 | HID reports=47/s moving=47 sendReturnFalse=47
14:51:51.391 ->   BLE interval ms <8=7 8-12=0 12-17=0 17-25=0 25-34=25 34-50=0 >=50=3
14:51:51.391 ->   HID interval ms <8=0 8-12=0 12-17=3 17-25=38 25-34=3 34-50=2 >=50=1
14:51:52.375 -> 📈 ESP movement diagnostics | BLE rx=45/s seqGaps=0 malformed=0 maxPending=224.0 staleDrops=0 capped=53 | HID reports=56/s moving=56 sendReturnFalse=56
14:51:52.375 ->   BLE interval ms <8=13 8-12=0 12-17=0 17-25=0 25-34=31 34-50=0 >=50=1
14:51:52.375 ->   HID interval ms <8=0 8-12=0 12-17=6 17-25=48 25-34=0 34-50=2 >=50=0
14:51:53.359 -> 📈 ESP movement diagnostics | BLE rx=44/s seqGaps=0 malformed=0 maxPending=297.0 staleDrops=0 capped=53 | HID reports=56/s moving=56 sendReturnFalse=56
14:51:53.359 ->   BLE interval ms <8=13 8-12=0 12-17=0 17-25=0 25-34=29 34-50=0 >=50=2
14:51:53.359 ->   HID interval ms <8=0 8-12=0 12-17=7 17-25=47 25-34=0 34-50=1 >=50=1
14:51:54.378 -> 📈 ESP movement diagnostics | BLE rx=46/s seqGaps=1 malformed=0 maxPending=224.0 staleDrops=0 capped=54 | HID reports=58/s moving=58 sendReturnFalse=58
14:51:54.378 ->   BLE interval ms <8=13 8-12=0 12-17=0 17-25=0 25-34=32 34-50=0 >=50=1
14:51:54.378 ->   HID interval ms <8=0 8-12=0 12-17=6 17-25=51 25-34=0 34-50=1 >=50=0
14:51:55.364 -> 📈 ESP movement diagnostics | BLE rx=10/s seqGaps=0 malformed=0 maxPending=160.0 staleDrops=1 capped=9 | HID reports=14/s moving=9 sendReturnFalse=14
14:51:55.364 ->   BLE interval ms <8=3 8-12=0 12-17=0 17-25=0 25-34=5 34-50=0 >=50=2
14:51:55.364 ->   HID interval ms <8=0 8-12=0 12-17=3 17-25=9 25-34=0 34-50=1 >=50=1
14:51:56.385 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 maxPending=0.0 staleDrops=0 capped=0 | HID reports=0/s moving=0 sendReturnFalse=0
14:51:56.385 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:51:56.385 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:51:56.385 -> 🔌 iPhone disconnected, reason: 531
14:51:56.880 -> 🔄 Restarting advertising...




## Log 1

### IOS

✅ Connected to ESP_MouseBridge
🔍 Starting service discovery...
🧩 Found service: 00001234-0000-1000-8000-00805F9B34FB
📡 Found characteristic: 0000ABCD-0000-1000-8000-00805F9B34FB
✅ Write characteristic ready (props: CBCharacteristicProperties(rawValue: 4))
📈 Movement diagnostics
  touch: events=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=2 12-17ms=62 17-25ms=1 25-34ms=3 34-50ms=1 >=50ms=2 max=795.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=1 12-17ms=112 17-25ms=0 25-34ms=1 34-50ms=1 >=50ms=1 max=55.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 0 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=21
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=1 12-20ms=16 20-33ms=4 33-50ms=0 >=50ms=0 max=25.0ms
  pointer: events=21 emitted=21
  speed: 0-50=0 50-150=5 150-300=5 300-600=8 600-1000=2 1000-1600=1 1600-2400=0 >=2400=0 max=1040.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=19 2-2.5=1 2.5-3=1 3-3.5=0 >=3.5=0 max=2.5
  emit delta: 0-1=0 1-2=0 2-4=3 4-8=6 8-16=8 16-32=3 32-64=1 64-127=0 >=127=0 max=40.7
  BLE: attempts=21 sent=21 blocked=0 readyCb=21 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=88 17-25ms=20 25-34ms=0 34-50ms=3 >=50ms=0 max=45.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=20 25-34ms=0 34-50ms=0 >=50ms=0 max=24.7ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 81 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=96
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=78 20-33ms=18 33-50ms=0 >=50ms=0 max=24.4ms
  pointer: events=96 emitted=96
  speed: 0-50=0 50-150=14 150-300=51 300-600=24 600-1000=7 1000-1600=0 1600-2400=0 >=2400=0 max=780.8
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=94 2-2.5=2 2.5-3=0 3-3.5=0 >=3.5=0 max=2.1
  emit delta: 0-1=0 1-2=1 2-4=10 4-8=28 8-16=40 16-32=16 32-64=1 64-127=0 >=127=0 max=34.1
  BLE: attempts=96 sent=96 blocked=0 readyCb=96 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=3 17-25ms=96 25-34ms=0 34-50ms=0 >=50ms=1 max=53.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=95 25-34ms=0 34-50ms=0 >=50ms=1 max=53.1ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 36 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=32
  touch dt: 0-4ms=1 4-8ms=0 8-12ms=1 12-20ms=20 20-33ms=10 33-50ms=0 >=50ms=0 max=27.6ms
  pointer: events=32 emitted=32
  speed: 0-50=1 50-150=2 150-300=7 300-600=11 600-1000=8 1000-1600=2 1600-2400=1 >=2400=0 max=1872.8
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=25 2-2.5=4 2.5-3=2 3-3.5=1 >=3.5=0 max=3.4
  emit delta: 0-1=0 1-2=1 2-4=0 4-8=5 8-16=6 16-32=15 32-64=4 64-127=1 >=127=0 max=70.7
  BLE: attempts=31 sent=31 blocked=0 readyCb=31 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=76 17-25ms=29 25-34ms=3 34-50ms=1 >=50ms=0 max=48.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=29 25-34ms=1 34-50ms=0 >=50ms=1 max=1455.2ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 91 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=100
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=54 20-33ms=46 33-50ms=0 >=50ms=0 max=24.2ms
  pointer: events=100 emitted=100
  speed: 0-50=0 50-150=10 150-300=14 300-600=59 600-1000=14 1000-1600=3 1600-2400=0 >=2400=0 max=1459.4
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=88 2-2.5=9 2.5-3=2 3-3.5=1 >=3.5=0 max=3.4
  emit delta: 0-1=0 1-2=0 2-4=4 4-8=15 8-16=40 16-32=30 32-64=10 64-127=1 >=127=0 max=100.6
  BLE: attempts=99 sent=99 blocked=0 readyCb=99 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=98 25-34ms=0 34-50ms=1 >=50ms=0 max=38.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=98 25-34ms=0 34-50ms=1 >=50ms=0 max=38.2ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 91 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=53
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=24 20-33ms=29 33-50ms=0 >=50ms=0 max=23.1ms
  pointer: events=53 emitted=53
  speed: 0-50=2 50-150=3 150-300=13 300-600=27 600-1000=7 1000-1600=1 1600-2400=0 >=2400=0 max=1309.7
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=49 2-2.5=3 2.5-3=0 3-3.5=1 >=3.5=0 max=3.1
  emit delta: 0-1=0 1-2=2 2-4=2 4-8=9 8-16=21 16-32=15 32-64=3 64-127=1 >=127=0 max=82.3
  BLE: attempts=52 sent=52 blocked=0 readyCb=52 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=55 17-25ms=50 25-34ms=0 34-50ms=1 >=50ms=1 max=53.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=50 25-34ms=0 34-50ms=1 >=50ms=1 max=53.1ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 35 packets in 2s, dropped: 1
📈 Movement diagnostics
  touch: events=77
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=1 12-20ms=41 20-33ms=35 33-50ms=0 >=50ms=0 max=28.5ms
  pointer: events=77 emitted=77
  speed: 0-50=2 50-150=4 150-300=15 300-600=35 600-1000=18 1000-1600=2 1600-2400=1 >=2400=0 max=1617.1
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=64 2-2.5=10 2.5-3=2 3-3.5=1 >=3.5=0 max=3.4
  emit delta: 0-1=0 1-2=2 2-4=2 4-8=10 8-16=28 16-32=24 32-64=10 64-127=0 >=127=1 max=128.0
  BLE: attempts=76 sent=75 blocked=1 readyCb=75 longestBlock=19.7ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=22 17-25ms=75 25-34ms=2 34-50ms=1 >=50ms=0 max=48.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=73 25-34ms=0 34-50ms=1 >=50ms=1 max=1398.2ms
  dropped movement: events=1 absDx=42 absDy=8
📊 Sent 69 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=54
  touch dt: 0-4ms=2 4-8ms=0 8-12ms=2 12-20ms=15 20-33ms=35 33-50ms=0 >=50ms=0 max=28.6ms
  pointer: events=53 emitted=53
  speed: 0-50=0 50-150=2 150-300=3 300-600=26 600-1000=12 1000-1600=6 1600-2400=3 >=2400=1 max=4806.7
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=33 2-2.5=11 2.5-3=4 3-3.5=5 >=3.5=0 max=3.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=3 8-16=19 16-32=14 32-64=13 64-127=4 >=127=0 max=116.6
  BLE: attempts=51 sent=51 blocked=0 readyCb=51 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=41 17-25ms=46 25-34ms=7 34-50ms=3 >=50ms=1 max=53.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=45 25-34ms=3 34-50ms=0 >=50ms=3 max=618.7ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 77 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=71
  touch dt: 0-4ms=1 4-8ms=0 8-12ms=1 12-20ms=18 20-33ms=51 33-50ms=0 >=50ms=0 max=27.6ms
  pointer: events=72 emitted=71
  speed: 0-50=2 50-150=4 150-300=16 300-600=30 600-1000=12 1000-1600=6 1600-2400=1 >=2400=1 max=8996.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=59 2-2.5=7 2.5-3=3 3-3.5=3 >=3.5=0 max=3.4
  emit delta: 0-1=0 1-2=1 2-4=3 4-8=6 8-16=30 16-32=17 32-64=11 64-127=2 >=127=1 max=128.0
  BLE: attempts=68 sent=68 blocked=0 readyCb=68 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=1 12-17ms=25 17-25ms=59 25-34ms=6 34-50ms=3 >=50ms=2 max=60.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=57 25-34ms=5 34-50ms=3 >=50ms=3 max=450.1ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 13 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=17
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=1 12-20ms=6 20-33ms=10 33-50ms=0 >=50ms=0 max=30.1ms
  pointer: events=17 emitted=16
  speed: 0-50=2 50-150=3 150-300=3 300-600=7 600-1000=2 1000-1600=0 1600-2400=0 >=2400=0 max=639.4
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=17 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=1.9
  emit delta: 0-1=0 1-2=1 2-4=2 4-8=4 8-16=5 16-32=4 32-64=0 64-127=0 >=127=0 max=29.6
  BLE: attempts=16 sent=16 blocked=0 readyCb=16 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=85 17-25ms=16 25-34ms=5 34-50ms=1 >=50ms=1 max=54.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=12 25-34ms=3 34-50ms=0 >=50ms=1 max=1507.0ms
  dropped movement: events=0 absDx=0 absDy=0
📊 Sent 36 packets in 2s, dropped: 0
📈 Movement diagnostics
  touch: events=21
  touch dt: 0-4ms=1 4-8ms=0 8-12ms=1 12-20ms=14 20-33ms=5 33-50ms=0 >=50ms=0 max=27.6ms
  pointer: events=21 emitted=21
  speed: 0-50=1 50-150=5 150-300=6 300-600=3 600-1000=5 1000-1600=1 1600-2400=0 >=2400=0 max=1035.9
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=20 2-2.5=0 2.5-3=1 3-3.5=0 >=3.5=0 max=2.5
  emit delta: 0-1=0 1-2=1 2-4=4 4-8=6 8-16=3 16-32=6 32-64=1 64-127=0 >=127=0 max=58.2
  BLE: attempts=20 sent=20 blocked=0 readyCb=20 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=86 17-25ms=18 25-34ms=4 34-50ms=1 >=50ms=1 max=52.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=17 25-34ms=1 34-50ms=0 >=50ms=2 max=411.8ms
  dropped movement: events=0 absDx=0 absDy=0

### ESP

14:02:40.257 ->   HID interval ms <8=8 8-12=0 12-17=0 17-25=0 25-34=16 34-50=0 >=50=0
14:02:41.275 -> 📈 ESP movement diagnostics | BLE rx=32/s seqGaps=0 malformed=0 maxPending=0.0 | HID reports=32/s moving=32 failures=32
14:02:41.275 ->   BLE interval ms <8=10 8-12=0 12-17=0 17-25=0 25-34=20 34-50=0 >=50=2
14:02:41.275 ->   HID interval ms <8=10 8-12=0 12-17=0 17-25=0 25-34=20 34-50=0 >=50=2
14:02:42.261 -> 📈 ESP movement diagnostics | BLE rx=41/s seqGaps=0 malformed=0 maxPending=0.0 | HID reports=41/s moving=41 failures=41
14:02:42.261 ->   BLE interval ms <8=11 8-12=0 12-17=0 17-25=0 25-34=28 34-50=0 >=50=2
14:02:42.261 ->   HID interval ms <8=11 8-12=0 12-17=0 17-25=0 25-34=28 34-50=0 >=50=2
14:02:43.281 -> 📈 ESP movement diagnostics | BLE rx=24/s seqGaps=0 malformed=0 maxPending=0.0 | HID reports=24/s moving=24 failures=24
14:02:43.281 ->   BLE interval ms <8=7 8-12=0 12-17=0 17-25=0 25-34=14 34-50=0 >=50=3
14:02:43.281 ->   HID interval ms <8=7 8-12=0 12-17=0 17-25=0 25-34=14 34-50=0 >=50=3
14:02:44.266 -> 📈 ESP movement diagnostics | BLE rx=6/s seqGaps=0 malformed=0 maxPending=0.0 | HID reports=6/s moving=6 failures=6
14:02:44.266 ->   BLE interval ms <8=2 8-12=0 12-17=0 17-25=0 25-34=3 34-50=0 >=50=1
14:02:44.266 ->   HID interval ms <8=2 8-12=0 12-17=0 17-25=0 25-34=3 34-50=0 >=50=1
14:02:45.254 -> 📈 ESP movement diagnostics | BLE rx=16/s seqGaps=0 malformed=0 maxPending=0.0 | HID reports=16/s moving=16 failures=16
14:02:45.254 ->   BLE interval ms <8=3 8-12=0 12-17=0 17-25=0 25-34=12 34-50=0 >=50=1
14:02:45.254 ->   HID interval ms <8=3 8-12=0 12-17=0 17-25=0 25-34=12 34-50=0 >=50=1
14:02:46.275 -> 📈 ESP movement diagnostics | BLE rx=20/s seqGaps=0 malformed=0 maxPending=0.0 | HID reports=20/s moving=20 failures=20
14:02:46.275 ->   BLE interval ms <8=5 8-12=0 12-17=0 17-25=0 25-34=14 34-50=0 >=50=1
14:02:46.275 ->   HID interval ms <8=5 8-12=0 12-17=0 17-25=0 25-34=14 34-50=0 >=50=1
14:02:47.261 -> 📈 ESP movement diagnostics | BLE rx=0/s seqGaps=0 malformed=0 maxPending=0.0 | HID reports=0/s moving=0 failures=0
14:02:47.261 ->   BLE interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:02:47.261 ->   HID interval ms <8=0 8-12=0 12-17=0 17-25=0 25-34=0 34-50=0 >=50=0
14:02:47.652 -> 🔌 iPhone disconnected, reason: 531
14:02:48.178 -> 🔄 Restarting advertising...
