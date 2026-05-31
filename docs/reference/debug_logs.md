# Debug logs

Status: Historical diagnostic evidence only.

Canonical production contract: `docs/Production_Transport_Spec.md`.
Canonical motion conclusions: `docs/reference/UDP_Motion_Findings.md`.
Performance baseline: `docs/reference/Performance_Findings.md`.
Canonical execution plan: `docs/tasks.md`.

Logs for further smoothness 

log 6
📈 Movement diagnostics
  experiment: udpMode=fifo250Hz pointerDt=clamped90Hz pointerFilter=oneEuroLight
  touch: callbacks=21 coalescedSamples=200 motionEvents=192
  touch dt: 0-4ms=0 4-8ms=180 8-12ms=2 12-20ms=5 20-33ms=2 33-50ms=1 >=50ms=2 max=84.8ms
  coalesced dt: 0-4ms=0 4-8ms=180 8-12ms=2 12-20ms=9 20-33ms=2 33-50ms=1 >=50ms=2 max=84.8ms
  pointer: events=190 emitted=190
  speed: 0-50=16 50-150=35 150-300=44 300-600=95 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=490.5
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=41 2.5-3=43 3-3.5=79 >=3.5=27 max=3.7
  emit delta: 0-1=2 1-2=3 2-4=1 4-8=13 8-16=13 16-32=29 32-64=33 64-127=122 >=127=32 max=163.1
  probe raw: delta: 0-0.2=6 0.2-0.5=12 0.5-1=11 1-2=25 2-4=67 4-8=70 8-16=1 16-32=0 >=32=0 max=9.0 | turn: 0-2=53 2-5=62 5-10=39 10-20=16 20-35=3 35-60=1 60-90=5 >=90=3 max=90 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=6 33-50ms=13 50-100ms=62 >=100ms=110 max=897.1ms
  probe pointer: dtMinClamp=181 dtMaxClamp=1 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=182 12-17ms=4 17-25ms=1 25-34ms=3 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=99 2-5=56 5-10=16 10-20=7 20-35=2 35-60=1 60-90=1 >=90=2 max=137.7
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=28 34-50ms=0 >=50ms=15 max=1573.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=58 subframes=58 capped=0 staleDrops=29 maxBatch=53 maxPending=4015
  UDP sender: ticks=501 emitted=58 emptyWhileActive=30
  UDP timer dt: 0-4ms=261 4-8ms=240 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=47 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  probe UDP: queueAge: 0-4ms=11 4-8ms=11 8-12ms=6 12-20ms=13 20-33ms=17 33-50ms=0 >=50ms=0 max=32.0ms | delta: 0-1=0 1-2=1 2-4=0 4-8=5 8-16=0 16-32=9 32-64=7 64-127=36 >=127=0 max=120.9 | turn: 0-2=28 2-5=14 5-10=2 10-20=1 20-35=1 35-60=0 60-90=1 >=90=0 max=87.6
  dropped movement: events=29 absDx=5351 absDy=9223
📈 Movement diagnostics
  experiment: udpMode=fifo250Hz pointerDt=clamped90Hz pointerFilter=oneEuroLight
  touch: callbacks=6 coalescedSamples=55 motionEvents=54
  touch dt: 0-4ms=0 4-8ms=53 8-12ms=1 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=8.3ms
  coalesced dt: 0-4ms=0 4-8ms=53 8-12ms=1 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=8.3ms
  pointer: events=54 emitted=54
  speed: 0-50=2 50-150=22 150-300=11 300-600=19 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=521.9
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=9 2.5-3=25 3-3.5=10 >=3.5=10 max=3.8
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=5 8-16=2 16-32=20 32-64=26 64-127=13 >=127=23 max=188.3
  probe raw: delta: 0-0.2=1 0.2-0.5=4 0.5-1=5 1-2=20 2-4=9 4-8=15 8-16=0 16-32=0 >=32=0 max=6.1 | turn: 0-2=13 2-5=12 5-10=14 10-20=10 20-35=0 35-60=3 60-90=0 >=90=1 max=90.0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=8 50-100ms=43 >=100ms=3 max=105.3ms
  probe pointer: dtMinClamp=54 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=54 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=11.1ms | turn: 0-2=24 2-5=24 5-10=4 10-20=2 20-35=0 35-60=0 60-90=0 >=90=0 max=14.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=28 34-50ms=15 >=50ms=9 max=110.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=35 subframes=35 capped=0 staleDrops=20 maxBatch=16 maxPending=1446
  UDP sender: ticks=501 emitted=35 emptyWhileActive=8
  UDP timer dt: 0-4ms=254 4-8ms=247 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=30 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=4.7ms
  probe UDP: queueAge: 0-4ms=6 4-8ms=5 8-12ms=3 12-20ms=9 20-33ms=12 33-50ms=0 >=50ms=0 max=31.9ms | delta: 0-1=0 1-2=0 2-4=0 4-8=2 8-16=0 16-32=7 32-64=11 64-127=4 >=127=11 max=188.3 | turn: 0-2=14 2-5=13 5-10=3 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=7.8
  dropped movement: events=20 absDx=565 absDy=625
📈 Movement diagnostics
  experiment: udpMode=fifo250Hz pointerDt=clamped90Hz pointerFilter=oneEuroLight
  touch: callbacks=27 coalescedSamples=276 motionEvents=235
  touch dt: 0-4ms=0 4-8ms=226 8-12ms=6 12-20ms=0 20-33ms=2 33-50ms=1 >=50ms=0 max=37.5ms
  coalesced dt: 0-4ms=0 4-8ms=227 8-12ms=7 12-20ms=0 20-33ms=2 33-50ms=1 >=50ms=0 max=37.5ms
  pointer: events=235 emitted=235
  speed: 0-50=31 50-150=55 150-300=90 300-600=59 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=464.3
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=61 2.5-3=97 3-3.5=63 >=3.5=14 max=3.6
  emit delta: 0-1=0 1-2=0 2-4=9 4-8=22 8-16=35 16-32=55 32-64=108 64-127=118 >=127=25 max=152.4
  probe raw: delta: 0-0.2=1 0.2-0.5=29 0.5-1=16 1-2=67 2-4=90 4-8=32 8-16=0 16-32=0 >=32=0 max=6.7 | turn: 0-2=87 2-5=34 5-10=51 10-20=37 20-35=13 35-60=6 60-90=2 >=90=2 max=90 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=6 33-50ms=24 50-100ms=181 >=100ms=24 max=131.7ms
  probe pointer: dtMinClamp=232 dtMaxClamp=1 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=232 12-17ms=0 17-25ms=0 25-34ms=3 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=110 2-5=71 5-10=31 10-20=16 20-35=2 35-60=2 60-90=1 >=90=0 max=74.4
  BLE: attempts=2 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=18 34-50ms=1 >=50ms=19 max=143.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=137 subframes=137 capped=0 staleDrops=67 maxBatch=22 maxPending=2090
  UDP sender: ticks=500 emitted=137 emptyWhileActive=1
  UDP timer dt: 0-4ms=244 4-8ms=256 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=121 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  probe UDP: queueAge: 0-4ms=16 4-8ms=17 8-12ms=17 12-20ms=35 20-33ms=52 33-50ms=0 >=50ms=0 max=32.0ms | delta: 0-1=0 1-2=0 2-4=3 4-8=8 8-16=12 16-32=21 32-64=43 64-127=41 >=127=9 max=152.4 | turn: 0-2=59 2-5=32 5-10=22 10-20=4 20-35=2 35-60=2 60-90=0 >=90=0 max=52.1
  dropped movement: events=67 absDx=3271 absDy=3774
📈 Movement diagnostics
  experiment: udpMode=fifo250Hz pointerDt=clamped90Hz pointerFilter=oneEuroLight
  touch: callbacks=31 coalescedSamples=396 motionEvents=395
  touch dt: 0-4ms=0 4-8ms=391 8-12ms=0 12-20ms=3 20-33ms=1 33-50ms=0 >=50ms=0 max=25.9ms
  coalesced dt: 0-4ms=0 4-8ms=391 8-12ms=0 12-20ms=3 20-33ms=1 33-50ms=0 >=50ms=0 max=25.9ms
  pointer: events=395 emitted=395
  speed: 0-50=1 50-150=3 150-300=147 300-600=240 600-1000=4 1000-1600=0 1600-2400=0 >=2400=0 max=624.7
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=2 2.5-3=83 3-3.5=228 >=3.5=82 max=4.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=6 32-64=63 64-127=389 >=127=164 max=232.1
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=3 2-4=217 4-8=175 8-16=0 16-32=0 >=32=0 max=7.6 | turn: 0-2=129 2-5=126 5-10=108 10-20=27 20-35=3 35-60=1 60-90=0 >=90=0 max=36.9 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=2 20-33ms=13 33-50ms=43 50-100ms=286 >=100ms=51 max=132.1ms
  probe pointer: dtMinClamp=391 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=391 12-17ms=3 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=25.9ms | turn: 0-2=205 2-5=145 5-10=37 10-20=7 20-35=0 35-60=0 60-90=0 >=90=0 max=18.4
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=10 34-50ms=0 >=50ms=26 max=92.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=227 subframes=227 capped=0 staleDrops=158 maxBatch=24 maxPending=2291
  UDP sender: ticks=500 emitted=227 emptyWhileActive=6
  UDP timer dt: 0-4ms=239 4-8ms=261 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=201 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  probe UDP: queueAge: 0-4ms=28 4-8ms=30 8-12ms=28 12-20ms=57 20-33ms=84 33-50ms=0 >=50ms=0 max=32.0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=3 32-64=26 64-127=139 >=127=59 max=216.2 | turn: 0-2=99 2-5=75 5-10=22 10-20=5 20-35=0 35-60=0 60-90=0 >=90=0 max=17.8
  dropped movement: events=158 absDx=9673 absDy=11961
📈 Movement diagnostics
  experiment: udpMode=fifo250Hz pointerDt=clamped90Hz pointerFilter=oneEuroLight
  touch: callbacks=26 coalescedSamples=333 motionEvents=332
  touch dt: 0-4ms=0 4-8ms=330 8-12ms=1 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=26.0ms
  coalesced dt: 0-4ms=0 4-8ms=330 8-12ms=1 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=26.0ms
  pointer: events=332 emitted=332
  speed: 0-50=0 50-150=27 150-300=79 300-600=226 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=457.3
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=23 2.5-3=66 3-3.5=226 >=3.5=17 max=3.6
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=3 16-32=33 32-64=74 64-127=349 >=127=52 max=158.0
  probe raw: delta: 0-0.2=0 0.2-0.5=2 0.5-1=3 1-2=39 2-4=157 4-8=130 8-16=1 16-32=0 >=32=0 max=9.0 | turn: 0-2=119 2-5=91 5-10=80 10-20=34 20-35=7 35-60=0 60-90=0 >=90=0 max=31.0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=3 33-50ms=31 50-100ms=264 >=100ms=33 max=113.1ms
  probe pointer: dtMinClamp=331 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=331 12-17ms=0 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=26.0ms | turn: 0-2=145 2-5=132 5-10=47 10-20=7 20-35=0 35-60=0 60-90=0 >=90=0 max=13.8
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=14 34-50ms=0 >=50ms=24 max=113.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=179 subframes=179 capped=0 staleDrops=152 maxBatch=28 maxPending=1842
  UDP sender: ticks=501 emitted=179 emptyWhileActive=2
  UDP timer dt: 0-4ms=266 4-8ms=235 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=158 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  probe UDP: queueAge: 0-4ms=24 4-8ms=22 8-12ms=22 12-20ms=44 20-33ms=67 33-50ms=0 >=50ms=0 max=32.0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=8 32-64=23 64-127=128 >=127=20 max=158.0 | turn: 0-2=62 2-5=65 5-10=25 10-20=5 20-35=0 35-60=1 60-90=0 >=90=0 max=40.4
  dropped movement: events=152 absDx=8346 absDy=8743
📈 Movement diagnostics
  experiment: udpMode=fifo250Hz pointerDt=clamped90Hz pointerFilter=oneEuroLight
  touch: callbacks=33 coalescedSamples=440 motionEvents=439
  touch dt: 0-4ms=0 4-8ms=438 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=20.8ms
  coalesced dt: 0-4ms=0 4-8ms=438 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=20.8ms
  pointer: events=439 emitted=439
  speed: 0-50=0 50-150=1 150-300=16 300-600=299 600-1000=123 1000-1600=0 1600-2400=0 >=2400=0 max=862.4
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=1 2.5-3=13 3-3.5=97 >=3.5=328 max=4.7
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=13 64-127=143 >=127=525 max=379.5
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=1 2-4=42 4-8=353 8-16=43 16-32=0 >=32=0 max=10.1 | turn: 0-2=109 2-5=125 5-10=138 10-20=56 20-35=8 35-60=2 60-90=0 >=90=0 max=53.1 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=6 33-50ms=42 50-100ms=346 >=100ms=45 max=112.9ms
  probe pointer: dtMinClamp=438 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=438 12-17ms=0 17-25ms=1 25-34ms=0 34-50ms=0 >=50ms=0 max=20.8ms | turn: 0-2=79 2-5=163 5-10=148 10-20=47 20-35=1 35-60=0 60-90=0 >=90=0 max=20.1
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=5 34-50ms=0 >=50ms=29 max=119.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=242 subframes=242 capped=0 staleDrops=181 maxBatch=20 maxPending=3782
  UDP sender: ticks=500 emitted=242 emptyWhileActive=1
  UDP timer dt: 0-4ms=245 4-8ms=255 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=214 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  probe UDP: queueAge: 0-4ms=30 4-8ms=30 8-12ms=28 12-20ms=60 20-33ms=94 33-50ms=0 >=50ms=0 max=32.0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=6 64-127=49 >=127=187 max=349.0 | turn: 0-2=40 2-5=70 5-10=73 10-20=26 20-35=3 35-60=1 60-90=1 >=90=0 max=63.9
  dropped movement: events=181 absDx=19178 absDy=23297
📈 Movement diagnostics
  experiment: udpMode=fifo250Hz pointerDt=clamped90Hz pointerFilter=oneEuroLight
  touch: callbacks=3 coalescedSamples=41 motionEvents=41
  touch dt: 0-4ms=0 4-8ms=41 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=41 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=41 emitted=41
  speed: 0-50=0 50-150=0 150-300=5 300-600=36 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=599.2
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=3 3-3.5=13 >=3.5=25 max=4.0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=4 64-127=16 >=127=45 max=205.2
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=10 4-8=31 8-16=0 16-32=0 >=32=0 max=6.3 | turn: 0-2=9 2-5=11 5-10=9 10-20=11 20-35=1 35-60=0 60-90=0 >=90=0 max=24.4 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=5 50-100ms=33 >=100ms=3 max=106.4ms
  probe pointer: dtMinClamp=41 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=41 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=11.1ms | turn: 0-2=7 2-5=12 5-10=14 10-20=8 20-35=0 35-60=0 60-90=0 >=90=0 max=19.9
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=5 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=45 34-50ms=0 >=50ms=10 max=112.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=24 subframes=24 capped=0 staleDrops=25 maxBatch=16 maxPending=2229
  UDP sender: ticks=501 emitted=24 emptyWhileActive=0
  UDP timer dt: 0-4ms=265 4-8ms=235 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=21 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=4.8ms
  probe UDP: queueAge: 0-4ms=3 4-8ms=3 8-12ms=3 12-20ms=6 20-33ms=9 33-50ms=0 >=50ms=0 max=30.8ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=1 64-127=3 >=127=20 max=205.2 | turn: 0-2=6 2-5=9 5-10=5 10-20=1 20-35=0 35-60=0 60-90=0 >=90=0 max=10.8
  dropped movement: events=25 absDx=2818 absDy=3271

23:10:37.436 -> 
23:10:37.436 -> 🔧 Initializing TinyUSB HID Mouse...
23:10:38.258 -> .......
23:10:39.762 -> ✅ UDP motion listening on 192.168.18.125:4210
23:10:39.762 -> 🎯 ESP_Bridge_TinyUSB ready
23:10:39.762 -> 🚦 udp-rx task running on core 0
23:10:40.747 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=1649/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:40.747 ->   net: wifi=connected ip=192.168.18.125 rssi=-50 mounted=yes | udpRx iters=1002/s
23:10:40.747 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
23:10:40.747 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
23:10:41.766 -> 📈 ESP smooth | UDP rawPkts=1/s datagrams=1/s subframes=1/s malformed=0 queueMax=1 overflow=0 | HID ticks=500/s reports=1/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:41.766 ->   net: wifi=connected ip=192.168.18.125 rssi=-48 mounted=yes | udpRx iters=1001/s
23:10:41.766 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
23:10:41.766 ->   emit delta:    0=0 1=0 2-4=0 4-8=1 8-16=0 16-32=0 32-64=0 64-127=0
23:10:42.749 -> 📈 ESP smooth | UDP rawPkts=41/s datagrams=41/s subframes=41/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=38/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:42.749 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=992/s
23:10:42.749 ->   HID interval ms <2=4 2-4=21 4-8=2 8-16=3 >=16=8
23:10:42.749 ->   emit delta:    0=0 1=3 2-4=4 4-8=9 8-16=22 16-32=0 32-64=0 64-127=0
23:10:43.766 -> 📈 ESP smooth | UDP rawPkts=30/s datagrams=30/s subframes=30/s malformed=0 queueMax=5 overflow=0 | HID ticks=500/s reports=30/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:43.766 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=997/s
23:10:43.766 ->   HID interval ms <2=5 2-4=12 4-8=8 8-16=0 >=16=5
23:10:43.766 ->   emit delta:    0=0 1=3 2-4=5 4-8=7 8-16=6 16-32=9 32-64=0 64-127=0
23:10:44.782 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:44.782 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1001/s
23:10:44.782 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
23:10:44.782 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
23:10:45.762 -> 📈 ESP smooth | UDP rawPkts=63/s datagrams=63/s subframes=63/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=61/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:45.762 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=986/s
23:10:45.762 ->   HID interval ms <2=9 2-4=36 4-8=6 8-16=0 >=16=10
23:10:45.762 ->   emit delta:    0=0 1=5 2-4=7 4-8=22 8-16=27 16-32=0 32-64=0 64-127=0
23:10:46.779 -> 📈 ESP smooth | UDP rawPkts=36/s datagrams=36/s subframes=36/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=36/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:46.779 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=996/s
23:10:46.779 ->   HID interval ms <2=7 2-4=13 4-8=12 8-16=1 >=16=3
23:10:46.779 ->   emit delta:    0=0 1=0 2-4=1 4-8=11 8-16=15 16-32=9 32-64=0 64-127=0
23:10:47.761 -> 📈 ESP smooth | UDP rawPkts=55/s datagrams=55/s subframes=55/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=52/s reportFails=0 staleDrops=0 lateMax=0.4ms
23:10:47.761 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=991/s
23:10:47.761 ->   HID interval ms <2=13 2-4=18 4-8=14 8-16=0 >=16=7
23:10:47.761 ->   emit delta:    0=0 1=5 2-4=6 4-8=12 8-16=18 16-32=11 32-64=0 64-127=0
23:10:48.779 -> 📈 ESP smooth | UDP rawPkts=128/s datagrams=128/s subframes=128/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=127/s reportFails=0 staleDrops=1 lateMax=0.4ms
23:10:48.779 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=988/s
23:10:48.779 ->   HID interval ms <2=27 2-4=51 4-8=32 8-16=1 >=16=16
23:10:48.779 ->   emit delta:    0=0 1=0 2-4=0 4-8=29 8-16=70 16-32=28 32-64=0 64-127=0
23:10:49.759 -> 📈 ESP smooth | UDP rawPkts=83/s datagrams=83/s subframes=83/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=83/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:49.791 ->   net: wifi=connected ip=192.168.18.125 rssi=-40 mounted=yes | udpRx iters=991/s
23:10:49.791 ->   HID interval ms <2=15 2-4=38 4-8=14 8-16=4 >=16=12
23:10:49.791 ->   emit delta:    0=0 1=0 2-4=0 4-8=23 8-16=42 16-32=18 32-64=0 64-127=0
23:10:50.777 -> 📈 ESP smooth | UDP rawPkts=78/s datagrams=78/s subframes=78/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=77/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:50.777 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=984/s
23:10:50.777 ->   HID interval ms <2=12 2-4=41 4-8=8 8-16=3 >=16=13
23:10:50.777 ->   emit delta:    0=0 1=0 2-4=0 4-8=12 8-16=64 16-32=1 32-64=0 64-127=0
23:10:51.794 -> 📈 ESP smooth | UDP rawPkts=83/s datagrams=83/s subframes=83/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=83/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:51.794 ->   net: wifi=connected ip=192.168.18.125 rssi=-45 mounted=yes | udpRx iters=991/s
23:10:51.794 ->   HID interval ms <2=11 2-4=31 4-8=25 8-16=3 >=16=13
23:10:51.794 ->   emit delta:    0=0 1=0 2-4=8 4-8=8 8-16=30 16-32=34 32-64=3 64-127=0
23:10:52.778 -> 📈 ESP smooth | UDP rawPkts=121/s datagrams=121/s subframes=121/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=121/s reportFails=0 staleDrops=0 lateMax=0.1ms
23:10:52.778 ->   net: wifi=connected ip=192.168.18.125 rssi=-45 mounted=yes | udpRx iters=987/s
23:10:52.778 ->   HID interval ms <2=27 2-4=48 4-8=24 8-16=3 >=16=19
23:10:52.778 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=28 16-32=75 32-64=18 64-127=0
23:10:53.793 -> 📈 ESP smooth | UDP rawPkts=69/s datagrams=69/s subframes=69/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=69/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:53.793 ->   net: wifi=connected ip=192.168.18.125 rssi=-43 mounted=yes | udpRx iters=997/s
23:10:53.793 ->   HID interval ms <2=12 2-4=18 4-8=29 8-16=2 >=16=8
23:10:53.793 ->   emit delta:    0=0 1=0 2-4=0 4-8=1 8-16=24 16-32=44 32-64=0 64-127=0
23:10:54.775 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:54.775 ->   net: wifi=connected ip=192.168.18.125 rssi=-47 mounted=yes | udpRx iters=1001/s
23:10:54.775 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
23:10:54.775 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
23:10:55.795 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
23:10:55.795 ->   net: wifi=connected ip=192.168.18.125 rssi=-43 mounted=yes | udpRx iters=1001/s
23:10:55.795 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
23:10:55.795 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

log 5
📈 Movement diagnostics
  experiment: udpMode=boundedFifo250Hz pointerDt=clamped90Hz
  touch: callbacks=24 coalescedSamples=214 motionEvents=207
  touch dt: 0-4ms=0 4-8ms=192 8-12ms=12 12-20ms=1 20-33ms=0 33-50ms=2 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=195 8-12ms=13 12-20ms=2 20-33ms=0 33-50ms=2 >=50ms=0 max=45.8ms
  pointer: events=207 emitted=207
  speed: 0-50=57 50-150=54 150-300=37 300-600=53 600-1000=6 1000-1600=0 1600-2400=0 >=2400=0 max=618.8
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=104 2.5-3=40 3-3.5=23 >=3.5=40 max=4.1
  emit delta: 0-1=2 1-2=0 2-4=0 4-8=82 8-16=56 16-32=29 32-64=34 64-127=42 >=127=65 max=247.6
  probe raw: delta: 0-0.2=2 0.2-0.5=57 0.5-1=33 1-2=27 2-4=34 4-8=54 8-16=0 16-32=0 >=32=0 max=7.7 | turn: 0-2=153 2-5=23 5-10=10 10-20=7 20-35=4 35-60=2 60-90=1 >=90=3 max=90.0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=9 33-50ms=28 50-100ms=152 >=100ms=17 max=110.7ms
  probe pointer: dtMinClamp=204 dtMaxClamp=2 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=204 12-17ms=1 17-25ms=0 25-34ms=2 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=153 2-5=23 5-10=10 10-20=7 20-35=4 35-60=2 60-90=1 >=90=3 max=90.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=15 34-50ms=0 >=50ms=22 max=110.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=103 subframes=103 capped=0 staleDrops=98 maxBatch=6 maxPending=1350
  UDP sender: ticks=500 emitted=103 emptyWhileActive=44
  UDP timer dt: 0-4ms=241 4-8ms=259 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=85 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=32.0ms
  probe UDP: queueAge: 0-4ms=20 4-8ms=16 8-12ms=18 12-20ms=33 20-33ms=16 33-50ms=0 >=50ms=0 max=23.9ms | delta: 0-1=0 1-2=0 2-4=0 4-8=29 8-16=20 16-32=6 32-64=10 64-127=17 >=127=21 max=199.3 | turn: 0-2=68 2-5=8 5-10=4 10-20=2 20-35=0 35-60=2 60-90=0 >=90=2 max=90
  dropped movement: events=98 absDx=6303 absDy=399
📈 Movement diagnostics
  experiment: udpMode=boundedFifo250Hz pointerDt=clamped90Hz
  touch: callbacks=26 coalescedSamples=196 motionEvents=190
  touch dt: 0-4ms=0 4-8ms=178 8-12ms=5 12-20ms=2 20-33ms=2 33-50ms=2 >=50ms=1 max=66.7ms
  coalesced dt: 0-4ms=0 4-8ms=179 8-12ms=6 12-20ms=3 20-33ms=2 33-50ms=2 >=50ms=1 max=66.7ms
  pointer: events=190 emitted=190
  speed: 0-50=28 50-150=11 150-300=72 300-600=79 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=576.6
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=36 2.5-3=54 3-3.5=59 >=3.5=41 max=3.9
  emit delta: 0-1=2 1-2=0 2-4=0 4-8=43 8-16=13 16-32=14 32-64=46 64-127=106 >=127=66 max=210
  probe raw: delta: 0-0.2=2 0.2-0.5=24 0.5-1=8 1-2=14 2-4=81 4-8=61 8-16=0 16-32=0 >=32=0 max=6.7 | turn: 0-2=119 2-5=26 5-10=29 10-20=6 20-35=3 35-60=0 60-90=0 >=90=1 max=180.0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=9 20-33ms=13 33-50ms=33 50-100ms=128 >=100ms=7 max=108.2ms
  probe pointer: dtMinClamp=183 dtMaxClamp=3 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=183 12-17ms=2 17-25ms=1 25-34ms=4 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=119 2-5=26 5-10=29 10-20=6 20-35=3 35-60=0 60-90=0 >=90=2 max=180.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=20 34-50ms=0 >=50ms=21 max=113.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=100 subframes=100 capped=0 staleDrops=80 maxBatch=6 maxPending=1193
  UDP sender: ticks=501 emitted=100 emptyWhileActive=44
  UDP timer dt: 0-4ms=256 4-8ms=245 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=81 8-12ms=1 12-17ms=1 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.0ms
  probe UDP: queueAge: 0-4ms=19 4-8ms=19 8-12ms=17 12-20ms=32 20-33ms=13 33-50ms=0 >=50ms=0 max=23.6ms | delta: 0-1=0 1-2=0 2-4=0 4-8=19 8-16=5 16-32=6 32-64=17 64-127=31 >=127=22 max=210 | turn: 0-2=57 2-5=8 5-10=10 10-20=5 20-35=1 35-60=1 60-90=0 >=90=1 max=180
  dropped movement: events=80 absDx=6556 absDy=2336
📈 Movement diagnostics
  experiment: udpMode=boundedFifo250Hz pointerDt=clamped90Hz
  touch: callbacks=33 coalescedSamples=480 motionEvents=480
  touch dt: 0-4ms=0 4-8ms=480 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=480 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=480 emitted=480
  speed: 0-50=0 50-150=11 150-300=218 300-600=251 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=403.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=5 2.5-3=118 3-3.5=357 >=3.5=0 max=3.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=16 32-64=123 64-127=537 >=127=8 max=133.7
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=3 1-2=17 2-4=368 4-8=92 8-16=0 16-32=0 >=32=0 max=5.0 | turn: 0-2=210 2-5=112 5-10=118 10-20=38 20-35=2 35-60=0 60-90=0 >=90=0 max=25.6 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=50 50-100ms=392 >=100ms=38 max=110.4ms
  probe pointer: dtMinClamp=480 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=480 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=11.1ms | turn: 0-2=210 2-5=112 5-10=118 10-20=38 20-35=2 35-60=0 60-90=0 >=90=0 max=25.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=33 max=60.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=204 subframes=204 capped=0 staleDrops=278 maxBatch=6 maxPending=719
  UDP sender: ticks=500 emitted=204 emptyWhileActive=68
  UDP timer dt: 0-4ms=249 4-8ms=251 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=171 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  probe UDP: queueAge: 0-4ms=35 4-8ms=34 8-12ms=35 12-20ms=68 20-33ms=32 33-50ms=0 >=50ms=0 max=23.9ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=4 32-64=36 64-127=162 >=127=2 max=133.0 | turn: 0-2=79 2-5=45 5-10=32 10-20=15 20-35=0 35-60=0 60-90=0 >=90=0 max=19.4
  dropped movement: events=278 absDx=12591 absDy=14218
📈 Movement diagnostics
  experiment: udpMode=boundedFifo250Hz pointerDt=clamped90Hz
  touch: callbacks=28 coalescedSamples=360 motionEvents=359
  touch dt: 0-4ms=1 4-8ms=356 8-12ms=1 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=0 max=14.0ms
  coalesced dt: 0-4ms=1 4-8ms=356 8-12ms=1 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=0 max=14.0ms
  pointer: events=359 emitted=359
  speed: 0-50=6 50-150=9 150-300=132 300-600=212 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=529.9
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=15 2.5-3=38 3-3.5=232 >=3.5=74 max=3.8
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=8 8-16=8 16-32=6 32-64=26 64-127=319 >=127=140 max=188.3
  probe raw: delta: 0-0.2=0 0.2-0.5=9 0.5-1=5 1-2=0 2-4=198 4-8=147 8-16=0 16-32=0 >=32=0 max=6.2 | turn: 0-2=154 2-5=98 5-10=73 10-20=26 20-35=3 35-60=1 60-90=1 >=90=2 max=90.0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=32 50-100ms=299 >=100ms=28 max=110.8ms
  probe pointer: dtMinClamp=358 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=358 12-17ms=1 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=14.0ms | turn: 0-2=154 2-5=98 5-10=73 10-20=26 20-35=3 35-60=1 60-90=1 >=90=2 max=90.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=9 34-50ms=0 >=50ms=28 max=110.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=148 subframes=148 capped=0 staleDrops=206 maxBatch=6 maxPending=1031
  UDP sender: ticks=500 emitted=148 emptyWhileActive=55
  UDP timer dt: 0-4ms=235 4-8ms=265 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=123 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=4.9ms
  probe UDP: queueAge: 0-4ms=25 4-8ms=26 8-12ms=25 12-20ms=49 20-33ms=23 33-50ms=0 >=50ms=0 max=24.0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=3 8-16=3 16-32=2 32-64=7 64-127=92 >=127=41 max=186.0 | turn: 0-2=45 2-5=33 5-10=32 10-20=8 20-35=2 35-60=1 60-90=0 >=90=2 max=90
  dropped movement: events=206 absDx=11360 absDy=15225
📈 Movement diagnostics
  experiment: udpMode=boundedFifo250Hz pointerDt=clamped90Hz
  touch: callbacks=30 coalescedSamples=389 motionEvents=388
  touch dt: 0-4ms=0 4-8ms=387 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=29.1ms
  coalesced dt: 0-4ms=0 4-8ms=387 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=29.1ms
  pointer: events=388 emitted=388
  speed: 0-50=0 50-150=15 150-300=52 300-600=141 600-1000=180 1000-1600=0 1600-2400=0 >=2400=0 max=946.1
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=8 2.5-3=45 3-3.5=39 >=3.5=296 max=5.0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=1 16-32=16 32-64=34 64-127=87 >=127=417 max=437.1
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=3 1-2=14 2-4=53 4-8=214 8-16=104 16-32=0 >=32=0 max=11.0 | turn: 0-2=99 2-5=96 5-10=132 10-20=49 20-35=9 35-60=1 60-90=1 >=90=0 max=63.4 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=3 20-33ms=6 33-50ms=44 50-100ms=301 >=100ms=34 max=111.6ms
  probe pointer: dtMinClamp=387 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=387 12-17ms=0 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=29.1ms | turn: 0-2=99 2-5=96 5-10=132 10-20=49 20-35=9 35-60=1 60-90=1 >=90=0 max=63.4
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=5 34-50ms=0 >=50ms=28 max=109.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=167 subframes=167 capped=0 staleDrops=221 maxBatch=6 maxPending=2393
  UDP sender: ticks=501 emitted=167 emptyWhileActive=57
  UDP timer dt: 0-4ms=239 4-8ms=262 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=140 8-12ms=1 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.0ms
  probe UDP: queueAge: 0-4ms=28 4-8ms=28 8-12ms=28 12-20ms=57 20-33ms=26 33-50ms=0 >=50ms=0 max=23.9ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=5 32-64=11 64-127=31 >=127=120 max=437.1 | turn: 0-2=37 2-5=27 5-10=53 10-20=17 20-35=6 35-60=0 60-90=1 >=90=0 max=63.2
  dropped movement: events=221 absDx=24941 absDy=34484
📈 Movement diagnostics
  experiment: udpMode=boundedFifo250Hz pointerDt=clamped90Hz
  touch: callbacks=30 coalescedSamples=381 motionEvents=363
  touch dt: 0-4ms=2 4-8ms=361 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=5.8ms
  coalesced dt: 0-4ms=2 4-8ms=361 8-12ms=0 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=0 max=12.5ms
  pointer: events=363 emitted=363
  speed: 0-50=0 50-150=4 150-300=7 300-600=212 600-1000=140 1000-1600=0 1600-2400=0 >=2400=0 max=911.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=1 2.5-3=9 3-3.5=82 >=3.5=271 max=4.9
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=1 8-16=2 16-32=1 32-64=4 64-127=106 >=127=403 max=427.0
  probe raw: delta: 0-0.2=0 0.2-0.5=1 0.5-1=2 1-2=2 2-4=39 4-8=261 8-16=58 16-32=0 >=32=0 max=11.0 | turn: 0-2=94 2-5=107 5-10=115 10-20=40 20-35=4 35-60=1 60-90=0 >=90=1 max=90 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=5 33-50ms=42 50-100ms=288 >=100ms=27 max=109.6ms
  probe pointer: dtMinClamp=363 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=363 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=11.1ms | turn: 0-2=94 2-5=107 5-10=115 10-20=40 20-35=4 35-60=1 60-90=0 >=90=1 max=90
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=12 34-50ms=0 >=50ms=26 max=110.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=154 subframes=154 capped=0 staleDrops=204 maxBatch=6 maxPending=2358
  UDP sender: ticks=500 emitted=154 emptyWhileActive=55
  UDP timer dt: 0-4ms=254 4-8ms=246 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=129 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=7.8ms
  probe UDP: queueAge: 0-4ms=28 4-8ms=26 8-12ms=25 12-20ms=50 20-33ms=25 33-50ms=0 >=50ms=0 max=23.9ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=1 64-127=33 >=127=120 max=426.2 | turn: 0-2=35 2-5=36 5-10=39 10-20=18 20-35=0 35-60=0 60-90=1 >=90=0 max=62.6
  dropped movement: events=204 absDx=22288 absDy=28071
📈 Movement diagnostics
  experiment: udpMode=boundedFifo250Hz pointerDt=clamped90Hz
  touch: callbacks=25 coalescedSamples=349 motionEvents=365
  touch dt: 0-4ms=0 4-8ms=365 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=365 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=365 emitted=365
  speed: 0-50=0 50-150=0 150-300=8 300-600=140 600-1000=196 1000-1600=21 1600-2400=0 >=2400=0 max=1116.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=7 3-3.5=43 >=3.5=315 max=5.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=8 64-127=54 >=127=457 max=563.3
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=1 2-4=26 4-8=170 8-16=168 16-32=0 >=32=0 max=13.4 | turn: 0-2=110 2-5=108 5-10=99 10-20=43 20-35=5 35-60=0 60-90=0 >=90=0 max=24.3 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=31 50-100ms=299 >=100ms=35 max=111.9ms
  probe pointer: dtMinClamp=365 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=365 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=11.1ms | turn: 0-2=110 2-5=108 5-10=99 10-20=43 20-35=5 35-60=0 60-90=0 >=90=0 max=24.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=12 34-50ms=0 >=50ms=27 max=109.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=154 subframes=154 capped=0 staleDrops=211 maxBatch=6 maxPending=3169
  UDP sender: ticks=501 emitted=154 emptyWhileActive=50
  UDP timer dt: 0-4ms=247 4-8ms=254 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=129 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=4.9ms
  probe UDP: queueAge: 0-4ms=29 4-8ms=24 8-12ms=27 12-20ms=52 20-33ms=22 33-50ms=0 >=50ms=0 max=23.8ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=1 64-127=14 >=127=139 max=563.2 | turn: 0-2=37 2-5=39 5-10=32 10-20=14 20-35=4 35-60=1 60-90=1 >=90=1 max=91.2
  dropped movement: events=211 absDx=24940 absDy=44521
📈 Movement diagnostics
  experiment: udpMode=boundedFifo250Hz pointerDt=clamped90Hz
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 >=32=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 50-100ms=0 >=100ms=0 max=0ms
  probe pointer: dtMinClamp=0 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=5 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=58 34-50ms=0 >=50ms=5 max=56.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=250 4-8ms=250 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  experiment: udpMode=boundedFifo250Hz pointerDt=clamped90Hz
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 >=32=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 50-100ms=0 >=100ms=0 max=0ms
  probe pointer: dtMinClamp=0 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=9 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=51 34-50ms=0 >=50ms=9 max=56.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=501 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=270 4-8ms=231 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  experiment: udpMode=boundedFifo250Hz pointerDt=clamped90Hz
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 >=32=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 50-100ms=0 >=100ms=0 max=0ms
  probe pointer: dtMinClamp=0 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=8 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=50 34-50ms=1 >=50ms=8 max=61.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=501 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=267 4-8ms=234 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=0 absDx=0 absDy=0

22:54:48.270 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
22:54:48.270 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=1001/s
22:54:48.270 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:54:48.270 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:54:49.253 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:54:49.253 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=1001/s
22:54:49.253 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:54:49.253 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:54:50.272 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
22:54:50.272 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=1001/s
22:54:50.272 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:54:50.272 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:54:51.257 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
22:54:51.257 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=1001/s
22:54:51.257 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:54:51.257 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:54:52.276 -> 📈 ESP smooth | UDP rawPkts=5/s datagrams=5/s subframes=5/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=5/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:54:52.276 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=1001/s
22:54:52.276 ->   HID interval ms <2=0 2-4=2 4-8=0 8-16=0 >=16=3
22:54:52.276 ->   emit delta:    0=0 1=1 2-4=1 4-8=1 8-16=1 16-32=1 32-64=0 64-127=0
22:54:53.261 -> 📈 ESP smooth | UDP rawPkts=30/s datagrams=30/s subframes=30/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=28/s reportFails=0 staleDrops=0 lateMax=0.5ms
22:54:53.261 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=997/s
22:54:53.261 ->   HID interval ms <2=5 2-4=13 4-8=4 8-16=0 >=16=6
22:54:53.261 ->   emit delta:    0=0 1=8 2-4=4 4-8=7 8-16=7 16-32=2 32-64=0 64-127=0
22:54:54.280 -> 📈 ESP smooth | UDP rawPkts=21/s datagrams=21/s subframes=21/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=21/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:54:54.280 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=997/s
22:54:54.280 ->   HID interval ms <2=5 2-4=10 4-8=2 8-16=0 >=16=4
22:54:54.280 ->   emit delta:    0=0 1=1 2-4=0 4-8=4 8-16=6 16-32=10 32-64=0 64-127=0
22:54:55.269 -> 📈 ESP smooth | UDP rawPkts=48/s datagrams=48/s subframes=48/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=46/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:54:55.269 ->   net: wifi=connected ip=192.168.18.125 rssi=-37 mounted=yes | udpRx iters=993/s
22:54:55.269 ->   HID interval ms <2=6 2-4=25 4-8=3 8-16=2 >=16=10
22:54:55.269 ->   emit delta:    0=0 1=15 2-4=8 4-8=9 8-16=12 16-32=2 32-64=0 64-127=0
22:54:56.285 -> 📈 ESP smooth | UDP rawPkts=42/s datagrams=42/s subframes=42/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=36/s reportFails=0 staleDrops=1 lateMax=0.5ms
22:54:56.285 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=998/s
22:54:56.285 ->   HID interval ms <2=6 2-4=9 4-8=6 8-16=3 >=16=12
22:54:56.285 ->   emit delta:    0=0 1=11 2-4=2 4-8=5 8-16=8 16-32=10 32-64=0 64-127=0
22:54:57.265 -> 📈 ESP smooth | UDP rawPkts=38/s datagrams=38/s subframes=38/s malformed=0 queueMax=4 overflow=0 | HID ticks=500/s reports=35/s reportFails=0 staleDrops=0 lateMax=0.5ms
22:54:57.298 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=999/s
22:54:57.298 ->   HID interval ms <2=3 2-4=13 4-8=11 8-16=0 >=16=8
22:54:57.298 ->   emit delta:    0=0 1=7 2-4=4 4-8=6 8-16=7 16-32=11 32-64=0 64-127=0
22:54:58.288 -> 📈 ESP smooth | UDP rawPkts=44/s datagrams=44/s subframes=44/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=41/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:54:58.288 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=993/s
22:54:58.288 ->   HID interval ms <2=8 2-4=17 4-8=5 8-16=2 >=16=9
22:54:58.288 ->   emit delta:    0=0 1=8 2-4=4 4-8=7 8-16=10 16-32=12 32-64=0 64-127=0
22:54:59.270 -> 📈 ESP smooth | UDP rawPkts=99/s datagrams=99/s subframes=99/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=99/s reportFails=0 staleDrops=0 lateMax=0.5ms
22:54:59.304 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=991/s
22:54:59.304 ->   HID interval ms <2=16 2-4=42 4-8=20 8-16=1 >=16=20
22:54:59.304 ->   emit delta:    0=0 1=0 2-4=0 4-8=21 8-16=75 16-32=3 32-64=0 64-127=0
22:55:00.290 -> 📈 ESP smooth | UDP rawPkts=103/s datagrams=103/s subframes=103/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=103/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:55:00.290 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=991/s
22:55:00.290 ->   HID interval ms <2=14 2-4=39 4-8=27 8-16=7 >=16=16
22:55:00.290 ->   emit delta:    0=0 1=0 2-4=0 4-8=25 8-16=78 16-32=0 32-64=0 64-127=0
22:55:01.306 -> 📈 ESP smooth | UDP rawPkts=37/s datagrams=37/s subframes=37/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=37/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:55:01.306 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=996/s
22:55:01.306 ->   HID interval ms <2=7 2-4=13 4-8=10 8-16=1 >=16=6
22:55:01.306 ->   emit delta:    0=0 1=6 2-4=6 4-8=2 8-16=20 16-32=3 32-64=0 64-127=0
22:55:02.294 -> 📈 ESP smooth | UDP rawPkts=99/s datagrams=99/s subframes=99/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=99/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:55:02.294 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=985/s
22:55:02.294 ->   HID interval ms <2=19 2-4=45 4-8=16 8-16=2 >=16=17
22:55:02.294 ->   emit delta:    0=0 1=0 2-4=0 4-8=12 8-16=60 16-32=27 32-64=0 64-127=0
22:55:03.310 -> 📈 ESP smooth | UDP rawPkts=66/s datagrams=66/s subframes=66/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=66/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:55:03.310 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=999/s
22:55:03.310 ->   HID interval ms <2=4 2-4=15 4-8=33 8-16=3 >=16=11
22:55:03.310 ->   emit delta:    0=0 1=1 2-4=5 4-8=11 8-16=23 16-32=26 32-64=0 64-127=0
22:55:04.296 -> 📈 ESP smooth | UDP rawPkts=95/s datagrams=95/s subframes=95/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=95/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:55:04.296 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=991/s
22:55:04.296 ->   HID interval ms <2=20 2-4=34 4-8=20 8-16=2 >=16=19
22:55:04.296 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=9 16-32=53 32-64=33 64-127=0
22:55:05.313 -> 📈 ESP smooth | UDP rawPkts=72/s datagrams=72/s subframes=72/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=72/s reportFails=0 staleDrops=0 lateMax=0.1ms
22:55:05.313 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=994/s
22:55:05.313 ->   HID interval ms <2=8 2-4=21 4-8=30 8-16=0 >=16=13
22:55:05.313 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=8 16-32=50 32-64=14 64-127=0
22:55:06.300 -> 📈 ESP smooth | UDP rawPkts=67/s datagrams=67/s subframes=67/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=67/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:55:06.300 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=993/s
22:55:06.300 ->   HID interval ms <2=18 2-4=25 4-8=11 8-16=0 >=16=13
22:55:06.300 ->   emit delta:    0=0 1=0 2-4=0 4-8=1 8-16=23 16-32=34 32-64=9 64-127=0
22:55:07.317 -> 📈 ESP smooth | UDP rawPkts=94/s datagrams=94/s subframes=94/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=94/s reportFails=0 staleDrops=0 lateMax=0.5ms
22:55:07.317 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=993/s
22:55:07.317 ->   HID interval ms <2=12 2-4=26 4-8=39 8-16=4 >=16=13
22:55:07.317 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=14 16-32=38 32-64=36 64-127=6
22:55:08.298 -> 📈 ESP smooth | UDP rawPkts=56/s datagrams=56/s subframes=56/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=56/s reportFails=0 staleDrops=0 lateMax=0.5ms
22:55:08.298 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=993/s
22:55:08.298 ->   HID interval ms <2=13 2-4=26 4-8=7 8-16=1 >=16=9
22:55:08.298 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=5 16-32=35 32-64=16 64-127=0
22:55:09.317 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
22:55:09.317 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=1001/s
22:55:09.317 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:55:09.317 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

log 4
📈 Movement diagnostics
  experiment: udpMode=latestWins250Hz pointerDt=clamped90Hz
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 >=32=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 50-100ms=0 >=100ms=0 max=0ms
  probe pointer: dtMinClamp=0 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=1 17-25ms=0 25-34ms=6 34-50ms=2 >=50ms=1 max=601.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=177 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=84 4-8ms=87 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=444.2ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  experiment: udpMode=latestWins250Hz pointerDt=clamped90Hz
  touch: callbacks=9 coalescedSamples=87 motionEvents=86
  touch dt: 0-4ms=0 4-8ms=84 8-12ms=0 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=0 max=43.5ms
  coalesced dt: 0-4ms=0 4-8ms=84 8-12ms=0 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=0 max=43.5ms
  pointer: events=86 emitted=86
  speed: 0-50=2 50-150=14 150-300=47 300-600=23 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=402.4
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=7 2.5-3=53 3-3.5=26 >=3.5=0 max=3.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=1 8-16=1 16-32=6 32-64=43 64-127=34 >=127=9 max=1035.7
  probe raw: delta: 0-0.2=0 0.2-0.5=1 0.5-1=1 1-2=14 2-4=55 4-8=15 8-16=0 16-32=0 >=32=0 max=4.7 | turn: 0-2=65 2-5=5 5-10=14 10-20=0 20-35=0 35-60=0 60-90=0 >=90=1 max=90 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=4 33-50ms=16 50-100ms=64 >=100ms=2 max=103.7ms
  probe pointer: dtMinClamp=84 dtMaxClamp=1 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=84 12-17ms=1 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=65 2-5=5 5-10=14 10-20=0 20-35=0 35-60=0 60-90=0 >=90=1 max=90
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=7 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=40 34-50ms=0 >=50ms=14 max=64.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=8 subframes=8 capped=1 staleDrops=0 maxBatch=1 maxPending=1516
  UDP sender: ticks=500 emitted=8 emptyWhileActive=41
  UDP timer dt: 0-4ms=256 4-8ms=244 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=27.7ms
  probe UDP: queueAge: 0-4ms=8 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=3.9ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=8 max=1035.7 | turn: 0-2=0 2-5=0 5-10=2 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=8.7
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  experiment: udpMode=latestWins250Hz pointerDt=clamped90Hz
  touch: callbacks=16 coalescedSamples=126 motionEvents=124
  touch dt: 0-4ms=0 4-8ms=113 8-12ms=4 12-20ms=3 20-33ms=0 33-50ms=3 >=50ms=1 max=195.8ms
  coalesced dt: 0-4ms=0 4-8ms=113 8-12ms=4 12-20ms=3 20-33ms=0 33-50ms=3 >=50ms=1 max=195.8ms
  pointer: events=124 emitted=124
  speed: 0-50=13 50-150=26 150-300=65 300-600=20 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=591.2
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=30 2.5-3=68 3-3.5=14 >=3.5=12 max=4.0
  emit delta: 0-1=2 1-2=0 2-4=0 4-8=14 8-16=5 16-32=18 32-64=52 64-127=21 >=127=23 max=1026.5
  probe raw: delta: 0-0.2=2 0.2-0.5=13 0.5-1=5 1-2=31 2-4=57 4-8=13 8-16=3 16-32=0 >=32=0 max=13.3 | turn: 0-2=72 2-5=15 5-10=15 10-20=14 20-35=0 35-60=0 60-90=0 >=90=3 max=90 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=3 20-33ms=3 33-50ms=14 50-100ms=95 >=100ms=9 max=109.5ms
  probe pointer: dtMinClamp=117 dtMaxClamp=3 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=117 12-17ms=3 17-25ms=0 25-34ms=4 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=72 2-5=15 5-10=15 10-20=14 20-35=0 35-60=0 60-90=0 >=90=4 max=180
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=32 34-50ms=0 >=50ms=16 max=109.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=11 subframes=11 capped=2 staleDrops=2 maxBatch=1 maxPending=2288
  UDP sender: ticks=500 emitted=11 emptyWhileActive=84
  UDP timer dt: 0-4ms=266 4-8ms=234 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=11 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=3.7ms | delta: 0-1=0 1-2=0 2-4=0 4-8=1 8-16=0 16-32=0 32-64=0 64-127=1 >=127=9 max=1026.5 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=2 absDx=6 absDy=6
📈 Movement diagnostics
  experiment: udpMode=latestWins250Hz pointerDt=clamped90Hz
  touch: callbacks=26 coalescedSamples=242 motionEvents=238
  touch dt: 0-4ms=0 4-8ms=222 8-12ms=12 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=3 max=68.8ms
  coalesced dt: 0-4ms=0 4-8ms=223 8-12ms=12 12-20ms=2 20-33ms=0 33-50ms=0 >=50ms=3 max=68.8ms
  pointer: events=238 emitted=238
  speed: 0-50=50 50-150=61 150-300=107 300-600=20 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=369.4
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=90 2.5-3=111 3-3.5=37 >=3.5=0 max=3.3
  emit delta: 0-1=1 1-2=0 2-4=0 4-8=43 8-16=17 16-32=46 32-64=90 64-127=46 >=127=19 max=1029.3
  probe raw: delta: 0-0.2=1 0.2-0.5=49 0.5-1=11 1-2=76 2-4=91 4-8=10 8-16=0 16-32=0 >=32=0 max=6.1 | turn: 0-2=145 2-5=8 5-10=27 10-20=30 20-35=5 35-60=10 60-90=1 >=90=8 max=101.3 | age: 0-4ms=0 4-8ms=0 8-12ms=1 12-20ms=3 20-33ms=9 33-50ms=29 50-100ms=175 >=100ms=21 max=124.2ms
  probe pointer: dtMinClamp=234 dtMaxClamp=3 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=234 12-17ms=1 17-25ms=0 25-34ms=3 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=146 2-5=8 5-10=27 10-20=30 20-35=5 35-60=10 60-90=1 >=90=8 max=101.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=19 34-50ms=0 >=50ms=19 max=119.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=24 subframes=24 capped=2 staleDrops=2 maxBatch=1 maxPending=1210
  UDP sender: ticks=501 emitted=24 emptyWhileActive=153
  UDP timer dt: 0-4ms=267 4-8ms=234 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=2 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=2 34-50ms=0 >=50ms=0 max=32.1ms
  probe UDP: queueAge: 0-4ms=23 4-8ms=1 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=5.0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=1 32-64=1 64-127=4 >=127=18 max=1029.3 | turn: 0-2=2 2-5=0 5-10=1 10-20=0 20-35=0 35-60=1 60-90=0 >=90=0 max=40.5
  dropped movement: events=2 absDx=41 absDy=12
📈 Movement diagnostics
  experiment: udpMode=latestWins250Hz pointerDt=clamped90Hz
  touch: callbacks=22 coalescedSamples=222 motionEvents=214
  touch dt: 0-4ms=0 4-8ms=198 8-12ms=12 12-20ms=2 20-33ms=0 33-50ms=1 >=50ms=1 max=67.7ms
  coalesced dt: 0-4ms=0 4-8ms=199 8-12ms=12 12-20ms=3 20-33ms=0 33-50ms=1 >=50ms=1 max=67.7ms
  pointer: events=214 emitted=214
  speed: 0-50=63 50-150=56 150-300=71 300-600=24 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=374.2
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=95 2.5-3=86 3-3.5=33 >=3.5=0 max=3.3
  emit delta: 0-1=1 1-2=0 2-4=0 4-8=41 8-16=43 16-32=24 32-64=68 64-127=42 >=127=12 max=1036.7
  probe raw: delta: 0-0.2=1 0.2-0.5=66 0.5-1=19 1-2=51 2-4=63 4-8=14 8-16=0 16-32=0 >=32=0 max=4.7 | turn: 0-2=94 2-5=18 5-10=31 10-20=30 20-35=9 35-60=16 60-90=4 >=90=9 max=90 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=1 33-50ms=20 50-100ms=176 >=100ms=16 max=108.9ms
  probe pointer: dtMinClamp=210 dtMaxClamp=2 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=210 12-17ms=2 17-25ms=0 25-34ms=2 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=94 2-5=18 5-10=31 10-20=30 20-35=9 35-60=16 60-90=4 >=90=9 max=90
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=20 34-50ms=0 >=50ms=22 max=109.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=17 subframes=17 capped=2 staleDrops=2 maxBatch=1 maxPending=1456
  UDP sender: ticks=501 emitted=17 emptyWhileActive=119
  UDP timer dt: 0-4ms=256 4-8ms=245 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=16 4-8ms=1 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=2 64-127=3 >=127=12 max=1036.7 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=2 absDx=24 absDy=58
📈 Movement diagnostics
  experiment: udpMode=latestWins250Hz pointerDt=clamped90Hz
  touch: callbacks=28 coalescedSamples=394 motionEvents=398
  touch dt: 0-4ms=0 4-8ms=392 8-12ms=6 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=8.4ms
  coalesced dt: 0-4ms=0 4-8ms=392 8-12ms=6 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=8.4ms
  pointer: events=398 emitted=398
  speed: 0-50=19 50-150=53 150-300=308 300-600=18 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=395.8
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=41 2.5-3=322 3-3.5=35 >=3.5=0 max=3.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=17 8-16=10 16-32=37 32-64=271 64-127=62 >=127=29 max=1112.2
  probe raw: delta: 0-0.2=0 0.2-0.5=21 0.5-1=8 1-2=100 2-4=257 4-8=12 8-16=0 16-32=0 >=32=0 max=5.0 | turn: 0-2=159 2-5=66 5-10=96 10-20=61 20-35=12 35-60=3 60-90=1 >=90=0 max=71.6 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=32 50-100ms=332 >=100ms=34 max=109.8ms
  probe pointer: dtMinClamp=398 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=398 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=11.1ms | turn: 0-2=159 2-5=66 5-10=96 10-20=61 20-35=12 35-60=3 60-90=1 >=90=0 max=71.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=6 34-50ms=0 >=50ms=30 max=108.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=28 subframes=28 capped=2 staleDrops=1 maxBatch=1 maxPending=1324
  UDP sender: ticks=500 emitted=28 emptyWhileActive=196
  UDP timer dt: 0-4ms=258 4-8ms=242 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=28 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=3.3ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=1 64-127=0 >=127=27 max=1112.2 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=1 absDx=0 absDy=0
📈 Movement diagnostics
  experiment: udpMode=latestWins250Hz pointerDt=clamped90Hz
  touch: callbacks=30 coalescedSamples=367 motionEvents=364
  touch dt: 0-4ms=0 4-8ms=356 8-12ms=3 12-20ms=2 20-33ms=1 33-50ms=2 >=50ms=0 max=37.5ms
  coalesced dt: 0-4ms=0 4-8ms=356 8-12ms=4 12-20ms=3 20-33ms=1 33-50ms=2 >=50ms=0 max=37.5ms
  pointer: events=364 emitted=364
  speed: 0-50=24 50-150=107 150-300=233 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=272.3
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=89 2.5-3=273 3-3.5=2 >=3.5=0 max=3.0
  emit delta: 0-1=1 1-2=0 2-4=0 4-8=20 8-16=32 16-32=64 32-64=227 64-127=27 >=127=22 max=958.1
  probe raw: delta: 0-0.2=1 0.2-0.5=25 0.5-1=33 1-2=133 2-4=172 4-8=0 8-16=0 16-32=0 >=32=0 max=3.7 | turn: 0-2=131 2-5=36 5-10=90 10-20=69 20-35=19 35-60=7 60-90=1 >=90=9 max=180 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=36 50-100ms=303 >=100ms=25 max=109.8ms
  probe pointer: dtMinClamp=359 dtMaxClamp=2 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=359 12-17ms=2 17-25ms=1 25-34ms=2 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=131 2-5=36 5-10=90 10-20=69 20-35=19 35-60=7 60-90=1 >=90=9 max=180
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=8 34-50ms=0 >=50ms=29 max=108.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=29 subframes=29 capped=0 staleDrops=1 maxBatch=1 maxPending=813
  UDP sender: ticks=501 emitted=29 emptyWhileActive=189
  UDP timer dt: 0-4ms=261 4-8ms=240 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=2 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=4.1ms
  probe UDP: queueAge: 0-4ms=26 4-8ms=3 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.1ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=1 16-32=0 32-64=2 64-127=4 >=127=22 max=958.1 | turn: 0-2=0 2-5=0 5-10=1 10-20=1 20-35=0 35-60=0 60-90=0 >=90=0 max=13.2
  dropped movement: events=1 absDx=6 absDy=18
left clicked and sent
📈 Movement diagnostics
  experiment: udpMode=latestWins250Hz pointerDt=clamped90Hz
  touch: callbacks=28 coalescedSamples=327 motionEvents=325
  touch dt: 0-4ms=0 4-8ms=322 8-12ms=0 12-20ms=2 20-33ms=1 33-50ms=0 >=50ms=0 max=20.8ms
  coalesced dt: 0-4ms=0 4-8ms=322 8-12ms=0 12-20ms=2 20-33ms=1 33-50ms=0 >=50ms=0 max=20.8ms
  pointer: events=325 emitted=325
  speed: 0-50=1 50-150=5 150-300=73 300-600=240 600-1000=6 1000-1600=0 1600-2400=0 >=2400=0 max=659.2
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=2 2.5-3=50 3-3.5=215 >=3.5=58 max=4.2
  emit delta: 0-1=1 1-2=0 2-4=0 4-8=0 8-16=1 16-32=5 32-64=32 64-127=203 >=127=113 max=1448.2
  probe raw: delta: 0-0.2=1 0.2-0.5=0 0.5-1=1 1-2=15 2-4=141 4-8=167 8-16=0 16-32=0 >=32=0 max=7.8 | turn: 0-2=84 2-5=77 5-10=82 10-20=67 20-35=12 35-60=0 60-90=0 >=90=0 max=33.7 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=2 20-33ms=8 33-50ms=45 50-100ms=252 >=100ms=18 max=109.4ms
  probe pointer: dtMinClamp=322 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=322 12-17ms=2 17-25ms=1 25-34ms=0 34-50ms=0 >=50ms=0 max=20.8ms | turn: 0-2=84 2-5=77 5-10=82 10-20=67 20-35=12 35-60=0 60-90=0 >=90=0 max=33.7
  BLE: attempts=8 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=2 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=10 34-50ms=0 >=50ms=25 max=114.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=30 subframes=30 capped=16 staleDrops=0 maxBatch=1 maxPending=1874
  UDP sender: ticks=500 emitted=30 emptyWhileActive=175
  UDP timer dt: 0-4ms=263 4-8ms=237 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=5 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=3 34-50ms=0 >=50ms=0 max=32.1ms
  probe UDP: queueAge: 0-4ms=28 4-8ms=2 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.1ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=30 max=1448.2 | turn: 0-2=0 2-5=0 5-10=0 10-20=1 20-35=4 35-60=3 60-90=0 >=90=0 max=57.0
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  experiment: udpMode=latestWins250Hz pointerDt=clamped90Hz
  touch: callbacks=34 coalescedSamples=480 motionEvents=480
  touch dt: 0-4ms=0 4-8ms=480 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=480 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=480 emitted=480
  speed: 0-50=0 50-150=2 150-300=57 300-600=371 600-1000=50 1000-1600=0 1600-2400=0 >=2400=0 max=697.1
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=27 3-3.5=226 >=3.5=227 max=4.3
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=5 32-64=15 64-127=212 >=127=289 max=1448.2
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=1 1-2=10 2-4=142 4-8=325 8-16=2 16-32=0 >=32=0 max=8.6 | turn: 0-2=148 2-5=133 5-10=121 10-20=62 20-35=13 35-60=3 60-90=0 >=90=0 max=45 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=47 50-100ms=396 >=100ms=37 max=110.3ms
  probe pointer: dtMinClamp=480 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=480 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=11.1ms | turn: 0-2=148 2-5=133 5-10=121 10-20=62 20-35=13 35-60=3 60-90=0 >=90=0 max=45
  BLE: attempts=34 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=34 max=60.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=41 subframes=41 capped=27 staleDrops=0 maxBatch=1 maxPending=3315
  UDP sender: ticks=500 emitted=41 emptyWhileActive=235
  UDP timer dt: 0-4ms=251 4-8ms=249 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=7 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=4.2ms
  probe UDP: queueAge: 0-4ms=36 4-8ms=5 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.4ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=41 max=1448.2 | turn: 0-2=0 2-5=0 5-10=0 10-20=2 20-35=4 35-60=0 60-90=1 >=90=0 max=60.7
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  experiment: udpMode=latestWins250Hz pointerDt=clamped90Hz
  touch: callbacks=18 coalescedSamples=252 motionEvents=252
  touch dt: 0-4ms=0 4-8ms=248 8-12ms=4 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=8.3ms
  coalesced dt: 0-4ms=0 4-8ms=248 8-12ms=4 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=8.3ms
  pointer: events=252 emitted=252
  speed: 0-50=3 50-150=21 150-300=65 300-600=149 600-1000=14 1000-1600=0 1600-2400=0 >=2400=0 max=726.2
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=17 2.5-3=59 3-3.5=79 >=3.5=97 max=4.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=7 8-16=7 16-32=10 32-64=43 64-127=79 >=127=123 max=1448.2
  probe raw: delta: 0-0.2=0 0.2-0.5=8 0.5-1=7 1-2=23 2-4=71 4-8=138 8-16=5 16-32=0 >=32=0 max=9.0 | turn: 0-2=80 2-5=60 5-10=57 10-20=38 20-35=7 35-60=5 60-90=3 >=90=2 max=135.0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=23 50-100ms=209 >=100ms=20 max=110.4ms
  probe pointer: dtMinClamp=252 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=252 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=11.1ms | turn: 0-2=80 2-5=60 5-10=57 10-20=38 20-35=7 35-60=5 60-90=3 >=90=2 max=135.0
  BLE: attempts=47 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=3 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=22 34-50ms=0 >=50ms=22 max=109.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=17 subframes=17 capped=12 staleDrops=1 maxBatch=1 maxPending=2568
  UDP sender: ticks=501 emitted=17 emptyWhileActive=123
  UDP timer dt: 0-4ms=270 4-8ms=231 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=17 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=3.6ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=17 max=1448.2 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=1 absDx=846 absDy=13

22:43:57.031 -> 📈 ESP smooth | UDP rawPkts=12/s datagrams=12/s subframes=12/s malformed=0 queueMax=6 overflow=0 | HID ticks=1650/s reports=12/s reportFails=0 staleDrops=0 lateMax=0.5ms
22:43:57.031 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=999/s
22:43:57.031 ->   HID interval ms <2=3 2-4=4 4-8=0 8-16=0 >=16=4
22:43:57.031 ->   emit delta:    0=0 1=1 2-4=0 4-8=0 8-16=0 16-32=3 32-64=1 64-127=7
22:43:58.048 -> 📈 ESP smooth | UDP rawPkts=10/s datagrams=10/s subframes=10/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=10/s reportFails=0 staleDrops=0 lateMax=0.2ms
22:43:58.048 ->   net: wifi=connected ip=192.168.18.125 rssi=-39 mounted=yes | udpRx iters=1001/s
22:43:58.048 ->   HID interval ms <2=1 2-4=2 4-8=0 8-16=0 >=16=7
22:43:58.048 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=1 16-32=1 32-64=4 64-127=4
22:43:59.036 -> 📈 ESP smooth | UDP rawPkts=11/s datagrams=11/s subframes=11/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=12/s reportFails=0 staleDrops=0 lateMax=0.2ms
22:43:59.036 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=999/s
22:43:59.036 ->   HID interval ms <2=1 2-4=2 4-8=0 8-16=0 >=16=9
22:43:59.036 ->   emit delta:    0=0 1=1 2-4=1 4-8=0 8-16=2 16-32=3 32-64=3 64-127=2
22:44:00.054 -> 📈 ESP smooth | UDP rawPkts=12/s datagrams=12/s subframes=12/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=13/s reportFails=0 staleDrops=0 lateMax=0.2ms
22:44:00.054 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1001/s
22:44:00.054 ->   HID interval ms <2=2 2-4=0 4-8=0 8-16=0 >=16=11
22:44:00.054 ->   emit delta:    0=0 1=1 2-4=0 4-8=3 8-16=1 16-32=2 32-64=1 64-127=5
22:44:01.042 -> 📈 ESP smooth | UDP rawPkts=8/s datagrams=8/s subframes=8/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=8/s reportFails=0 staleDrops=1 lateMax=0.2ms
22:44:01.042 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1001/s
22:44:01.042 ->   HID interval ms <2=1 2-4=1 4-8=0 8-16=0 >=16=6
22:44:01.042 ->   emit delta:    0=0 1=1 2-4=0 4-8=0 8-16=3 16-32=1 32-64=1 64-127=2
22:44:02.060 -> 📈 ESP smooth | UDP rawPkts=9/s datagrams=9/s subframes=9/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=9/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:44:02.060 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1000/s
22:44:02.060 ->   HID interval ms <2=0 2-4=1 4-8=0 8-16=0 >=16=8
22:44:02.060 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=1 16-32=0 32-64=1 64-127=7
22:44:03.044 -> 📈 ESP smooth | UDP rawPkts=17/s datagrams=17/s subframes=17/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=19/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:44:03.044 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1001/s
22:44:03.044 ->   HID interval ms <2=3 2-4=0 4-8=0 8-16=1 >=16=15
22:44:03.044 ->   emit delta:    0=0 1=2 2-4=0 4-8=0 8-16=0 16-32=0 32-64=2 64-127=15
22:44:04.060 -> 📈 ESP smooth | UDP rawPkts=9/s datagrams=9/s subframes=9/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=9/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:44:04.060 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1001/s
22:44:04.060 ->   HID interval ms <2=1 2-4=0 4-8=0 8-16=0 >=16=8
22:44:04.060 ->   emit delta:    0=0 1=0 2-4=0 4-8=2 8-16=0 16-32=1 32-64=5 64-127=1
22:44:05.039 -> 📈 ESP smooth | UDP rawPkts=17/s datagrams=17/s subframes=17/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=17/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:44:05.039 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=1001/s
22:44:05.039 ->   HID interval ms <2=0 2-4=1 4-8=1 8-16=0 >=16=15
22:44:05.039 ->   emit delta:    0=0 1=0 2-4=0 4-8=1 8-16=1 16-32=0 32-64=3 64-127=12
22:44:06.056 -> 📈 ESP smooth | UDP rawPkts=10/s datagrams=10/s subframes=10/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=11/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:44:06.056 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=1001/s
22:44:06.056 ->   HID interval ms <2=1 2-4=2 4-8=2 8-16=0 >=16=6
22:44:06.056 ->   emit delta:    0=0 1=1 2-4=1 4-8=0 8-16=3 16-32=0 32-64=3 64-127=3
22:44:07.042 -> 📈 ESP smooth | UDP rawPkts=22/s datagrams=22/s subframes=22/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=31/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:44:07.074 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1001/s
22:44:07.074 ->   HID interval ms <2=7 2-4=8 4-8=0 8-16=1 >=16=15
22:44:07.074 ->   emit delta:    0=0 1=9 2-4=0 4-8=0 8-16=0 16-32=1 32-64=3 64-127=18
22:44:08.063 -> 📈 ESP smooth | UDP rawPkts=12/s datagrams=12/s subframes=12/s malformed=0 queueMax=1 overflow=0 | HID ticks=500/s reports=18/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:44:08.063 ->   net: wifi=connected ip=192.168.18.125 rssi=-36 mounted=yes | udpRx iters=1001/s
22:44:08.063 ->   HID interval ms <2=2 2-4=4 4-8=0 8-16=0 >=16=12
22:44:08.063 ->   emit delta:    0=0 1=6 2-4=0 4-8=0 8-16=0 16-32=0 32-64=1 64-127=11
22:44:09.048 -> 📈 ESP smooth | UDP rawPkts=23/s datagrams=23/s subframes=23/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=31/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:44:09.048 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=999/s
22:44:09.048 ->   HID interval ms <2=5 2-4=9 4-8=1 8-16=0 >=16=16
22:44:09.048 ->   emit delta:    0=0 1=8 2-4=0 4-8=0 8-16=0 16-32=1 32-64=4 64-127=18
22:44:10.061 -> 📈 ESP smooth | UDP rawPkts=18/s datagrams=18/s subframes=18/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=28/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:44:10.061 ->   net: wifi=connected ip=192.168.18.125 rssi=-35 mounted=yes | udpRx iters=1001/s
22:44:10.061 ->   HID interval ms <2=6 2-4=5 4-8=0 8-16=0 >=16=17
22:44:10.061 ->   emit delta:    0=0 1=10 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=18
22:44:11.076 -> 📈 ESP smooth | UDP rawPkts=9/s datagrams=9/s subframes=9/s malformed=0 queueMax=5 overflow=0 | HID ticks=500/s reports=12/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:44:11.076 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=999/s
22:44:11.076 ->   HID interval ms <2=3 2-4=6 4-8=0 8-16=0 >=16=3
22:44:11.076 ->   emit delta:    0=0 1=3 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=9
22:44:12.059 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:44:12.059 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
22:44:12.059 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:44:12.059 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:44:13.080 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:44:13.080 ->   net: wifi=connected ip=192.168.18.125 rssi=-41 mounted=yes | udpRx iters=1001/s
22:44:13.080 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:44:13.080 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:44:14.067 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:44:14.067 ->   net: wifi=connected ip=192.168.18.125 rssi=-39 mounted=yes | udpRx iters=1001/s
22:44:14.067 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:44:14.067 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

log 3
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 >=32=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 50-100ms=0 >=100ms=0 max=0ms
  probe pointer: dtMinClamp=0 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=97 17-25ms=23 25-34ms=0 34-50ms=0 >=50ms=0 max=17.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=259 4-8ms=241 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 >=32=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 50-100ms=0 >=100ms=0 max=0ms
  probe pointer: dtMinClamp=0 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=94 17-25ms=26 25-34ms=0 34-50ms=0 >=50ms=0 max=17.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=501 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=254 4-8ms=247 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=32 coalescedSamples=162 motionEvents=161
  touch dt: 0-4ms=0 4-8ms=156 8-12ms=3 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=1 max=93.8ms
  coalesced dt: 0-4ms=0 4-8ms=156 8-12ms=3 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=1 max=93.8ms
  pointer: events=161 emitted=161
  speed: 0-50=12 50-150=134 150-300=15 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=217.5
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=53 2.5-3=108 3-3.5=0 >=3.5=0 max=2.8
  emit delta: 0-1=1 1-2=0 2-4=0 4-8=20 8-16=18 16-32=171 32-64=105 64-127=2 >=127=2 max=137.2
  probe raw: delta: 0-0.2=1 0.2-0.5=10 0.5-1=11 1-2=132 2-4=5 4-8=2 8-16=0 16-32=0 >=32=0 max=6.0 | turn: 0-2=64 2-5=6 5-10=2 10-20=57 20-35=22 35-60=7 60-90=0 >=90=1 max=106.3 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=38 33-50ms=103 50-100ms=19 >=100ms=0 max=63.6ms
  probe pointer: dtMinClamp=159 dtMaxClamp=1 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=159 12-17ms=1 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=64 2-5=6 5-10=2 10-20=57 20-35=22 35-60=7 60-90=0 >=90=1 max=106.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=52 17-25ms=14 25-34ms=14 34-50ms=12 >=50ms=0 max=43.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=158 subframes=158 capped=0 staleDrops=3 maxBatch=9 maxPending=338
  UDP sender: ticks=500 emitted=158 emptyWhileActive=25
  UDP timer dt: 0-4ms=249 4-8ms=251 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=151 8-12ms=2 12-17ms=3 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=28.0ms
  probe UDP: queueAge: 0-4ms=17 4-8ms=24 8-12ms=26 12-20ms=49 20-33ms=42 33-50ms=0 >=50ms=0 max=31.6ms | delta: 0-1=0 1-2=0 2-4=0 4-8=10 8-16=9 16-32=85 32-64=52 64-127=1 >=127=1 max=136.8 | turn: 0-2=62 2-5=6 5-10=2 10-20=55 20-35=25 35-60=6 60-90=0 >=90=1 max=106.6
  dropped movement: events=3 absDx=70 absDy=7
📈 Movement diagnostics
  touch: callbacks=33 coalescedSamples=170 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 >=32=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 50-100ms=0 >=100ms=0 max=0ms
  probe pointer: dtMinClamp=0 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  BLE: attempts=1 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=53 17-25ms=13 25-34ms=15 34-50ms=10 >=50ms=1 max=54.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=501 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=242 4-8ms=259 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=26 coalescedSamples=145 motionEvents=144
  touch dt: 0-4ms=0 4-8ms=143 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  coalesced dt: 0-4ms=0 4-8ms=143 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  pointer: events=144 emitted=144
  speed: 0-50=1 50-150=49 150-300=94 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=288.1
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=6 2.5-3=124 3-3.5=14 >=3.5=0 max=3.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=1 8-16=2 16-32=54 32-64=164 64-127=53 >=127=2 max=171.5
  probe raw: delta: 0-0.2=0 0.2-0.5=1 0.5-1=4 1-2=59 2-4=78 4-8=2 8-16=0 16-32=0 >=32=0 max=7.2 | turn: 0-2=76 2-5=15 5-10=33 10-20=16 20-35=1 35-60=2 60-90=0 >=90=0 max=59.0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=28 33-50ms=85 50-100ms=31 >=100ms=0 max=76.2ms
  probe pointer: dtMinClamp=143 dtMaxClamp=1 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=143 12-17ms=0 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=76 2-5=15 5-10=33 10-20=16 20-35=1 35-60=2 60-90=0 >=90=0 max=59.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=58 17-25ms=18 25-34ms=10 34-50ms=7 >=50ms=2 max=70.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=132 subframes=132 capped=0 staleDrops=5 maxBatch=10 maxPending=605
  UDP sender: ticks=500 emitted=132 emptyWhileActive=14
  UDP timer dt: 0-4ms=249 4-8ms=251 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=125 8-12ms=2 12-17ms=2 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.0ms
  probe UDP: queueAge: 0-4ms=15 4-8ms=17 8-12ms=18 12-20ms=40 20-33ms=42 33-50ms=0 >=50ms=0 max=31.5ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=25 32-64=80 64-127=26 >=127=1 max=171.5 | turn: 0-2=69 2-5=13 5-10=26 10-20=19 20-35=0 35-60=1 60-90=1 >=90=0 max=61.2
  dropped movement: events=5 absDx=363 absDy=29
📈 Movement diagnostics
  touch: callbacks=48 coalescedSamples=269 motionEvents=264
  touch dt: 0-4ms=0 4-8ms=255 8-12ms=5 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=3 max=62.6ms
  coalesced dt: 0-4ms=0 4-8ms=257 8-12ms=5 12-20ms=2 20-33ms=0 33-50ms=0 >=50ms=3 max=62.6ms
  pointer: events=264 emitted=264
  speed: 0-50=35 50-150=94 150-300=134 300-600=1 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=304.5
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=83 2.5-3=163 3-3.5=18 >=3.5=0 max=3.1
  emit delta: 0-1=2 1-2=0 2-4=0 4-8=65 8-16=32 16-32=117 32-64=230 64-127=65 >=127=2 max=227.5
  probe raw: delta: 0-0.2=2 0.2-0.5=37 0.5-1=13 1-2=92 2-4=117 4-8=2 8-16=1 16-32=0 >=32=0 max=11.3 | turn: 0-2=141 2-5=19 5-10=53 10-20=34 20-35=4 35-60=7 60-90=0 >=90=1 max=90 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=2 20-33ms=65 33-50ms=157 50-100ms=40 >=100ms=0 max=64.4ms
  probe pointer: dtMinClamp=260 dtMaxClamp=3 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=260 12-17ms=1 17-25ms=0 25-34ms=3 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=141 2-5=19 5-10=53 10-20=34 20-35=4 35-60=7 60-90=0 >=90=2 max=180
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=28 17-25ms=9 25-34ms=23 34-50ms=11 >=50ms=4 max=69.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=249 subframes=249 capped=0 staleDrops=15 maxBatch=12 maxPending=693
  UDP sender: ticks=500 emitted=249 emptyWhileActive=49
  UDP timer dt: 0-4ms=237 4-8ms=263 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=233 8-12ms=4 12-17ms=4 17-25ms=5 25-34ms=0 34-50ms=0 >=50ms=0 max=24.5ms
  probe UDP: queueAge: 0-4ms=25 4-8ms=35 8-12ms=38 12-20ms=74 20-33ms=77 33-50ms=0 >=50ms=0 max=31.7ms | delta: 0-1=0 1-2=0 2-4=0 4-8=33 8-16=15 16-32=57 32-64=111 64-127=32 >=127=1 max=227 | turn: 0-2=134 2-5=24 5-10=46 10-20=28 20-35=6 35-60=7 60-90=0 >=90=1 max=90
  dropped movement: events=15 absDx=558 absDy=64
📈 Movement diagnostics
  touch: callbacks=39 coalescedSamples=219 motionEvents=218
  touch dt: 0-4ms=0 4-8ms=215 8-12ms=2 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=70.8ms
  coalesced dt: 0-4ms=0 4-8ms=215 8-12ms=2 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=70.8ms
  pointer: events=218 emitted=218
  speed: 0-50=9 50-150=75 150-300=134 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=293.4
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=74 2.5-3=122 3-3.5=22 >=3.5=0 max=3.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=18 8-16=34 16-32=108 32-64=198 64-127=72 >=127=2 max=185
  probe raw: delta: 0-0.2=0 0.2-0.5=9 0.5-1=20 1-2=60 2-4=127 4-8=2 8-16=0 16-32=0 >=32=0 max=7.7 | turn: 0-2=107 2-5=13 5-10=44 10-20=41 20-35=8 35-60=0 60-90=1 >=90=3 max=162.9 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=52 33-50ms=133 50-100ms=32 >=100ms=0 max=60.4ms
  probe pointer: dtMinClamp=217 dtMaxClamp=1 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=217 12-17ms=0 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=107 2-5=13 5-10=44 10-20=41 20-35=8 35-60=0 60-90=1 >=90=3 max=162.9
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=47 17-25ms=11 25-34ms=20 34-50ms=11 >=50ms=0 max=44.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=214 subframes=214 capped=0 staleDrops=5 maxBatch=9 maxPending=618
  UDP sender: ticks=501 emitted=214 emptyWhileActive=24
  UDP timer dt: 0-4ms=243 4-8ms=257 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=205 8-12ms=3 12-17ms=4 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=28.2ms
  probe UDP: queueAge: 0-4ms=17 4-8ms=33 8-12ms=36 12-20ms=65 20-33ms=63 33-50ms=0 >=50ms=0 max=31.9ms | delta: 0-1=0 1-2=0 2-4=0 4-8=9 8-16=17 16-32=53 32-64=98 64-127=36 >=127=1 max=185 | turn: 0-2=104 2-5=15 5-10=46 10-20=24 20-35=20 35-60=0 60-90=0 >=90=4 max=161.6
  dropped movement: events=5 absDx=6 absDy=171
📈 Movement diagnostics
  touch: callbacks=34 coalescedSamples=190 motionEvents=189
  touch dt: 0-4ms=0 4-8ms=183 8-12ms=5 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=54.2ms
  coalesced dt: 0-4ms=0 4-8ms=183 8-12ms=5 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=54.2ms
  pointer: events=189 emitted=189
  speed: 0-50=15 50-150=42 150-300=132 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=266.9
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=51 2.5-3=138 3-3.5=0 >=3.5=0 max=3.0
  emit delta: 0-1=1 1-2=0 2-4=0 4-8=30 8-16=42 16-32=44 32-64=226 64-127=26 >=127=2 max=155.9
  probe raw: delta: 0-0.2=1 0.2-0.5=16 0.5-1=22 1-2=21 2-4=128 4-8=1 8-16=0 16-32=0 >=32=0 max=6.7 | turn: 0-2=81 2-5=12 5-10=53 10-20=22 20-35=17 35-60=2 60-90=0 >=90=0 max=54.5 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=37 33-50ms=114 50-100ms=37 >=100ms=0 max=65.3ms
  probe pointer: dtMinClamp=188 dtMaxClamp=1 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=188 12-17ms=0 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=81 2-5=12 5-10=53 10-20=22 20-35=17 35-60=2 60-90=0 >=90=0 max=54.5
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=54 17-25ms=9 25-34ms=16 34-50ms=6 >=50ms=3 max=73.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=182 subframes=182 capped=0 staleDrops=7 maxBatch=10 maxPending=548
  UDP sender: ticks=500 emitted=182 emptyWhileActive=30
  UDP timer dt: 0-4ms=242 4-8ms=259 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=175 8-12ms=1 12-17ms=3 17-25ms=1 25-34ms=1 34-50ms=0 >=50ms=0 max=31.8ms
  probe UDP: queueAge: 0-4ms=22 4-8ms=26 8-12ms=29 12-20ms=52 20-33ms=53 33-50ms=0 >=50ms=0 max=31.9ms | delta: 0-1=0 1-2=0 2-4=0 4-8=15 8-16=21 16-32=22 32-64=110 64-127=13 >=127=1 max=155.6 | turn: 0-2=80 2-5=11 5-10=49 10-20=19 20-35=20 35-60=2 60-90=0 >=90=0 max=54.9
  dropped movement: events=7 absDx=30 absDy=323
📈 Movement diagnostics
  touch: callbacks=45 coalescedSamples=210 motionEvents=207
  touch dt: 0-4ms=0 4-8ms=195 8-12ms=7 12-20ms=2 20-33ms=1 33-50ms=1 >=50ms=1 max=66.7ms
  coalesced dt: 0-4ms=0 4-8ms=195 8-12ms=7 12-20ms=3 20-33ms=1 33-50ms=1 >=50ms=1 max=66.7ms
  pointer: events=207 emitted=207
  speed: 0-50=32 50-150=29 150-300=124 300-600=22 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=360.1
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=52 2.5-3=121 3-3.5=34 >=3.5=0 max=3.3
  emit delta: 0-1=2 1-2=0 2-4=0 4-8=51 8-16=34 16-32=27 32-64=198 64-127=89 >=127=4 max=195.3
  probe raw: delta: 0-0.2=2 0.2-0.5=27 0.5-1=18 1-2=25 2-4=126 4-8=8 8-16=1 16-32=0 >=32=0 max=8 | turn: 0-2=147 2-5=10 5-10=29 10-20=11 20-35=2 35-60=0 60-90=0 >=90=3 max=90 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=1 20-33ms=58 33-50ms=126 50-100ms=22 >=100ms=0 max=57.6ms
  probe pointer: dtMinClamp=202 dtMaxClamp=2 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=202 12-17ms=2 17-25ms=1 25-34ms=2 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=147 2-5=10 5-10=29 10-20=11 20-35=2 35-60=0 60-90=0 >=90=4 max=180
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=48 17-25ms=9 25-34ms=18 34-50ms=9 >=50ms=3 max=55.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=198 subframes=198 capped=0 staleDrops=3 maxBatch=8 maxPending=800
  UDP sender: ticks=500 emitted=198 emptyWhileActive=47
  UDP timer dt: 0-4ms=239 4-8ms=261 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=184 8-12ms=5 12-17ms=1 17-25ms=3 25-34ms=2 34-50ms=0 >=50ms=0 max=28.0ms
  probe UDP: queueAge: 0-4ms=22 4-8ms=38 8-12ms=35 12-20ms=58 20-33ms=45 33-50ms=0 >=50ms=0 max=31.4ms | delta: 0-1=0 1-2=0 2-4=0 4-8=24 8-16=16 16-32=13 32-64=99 64-127=44 >=127=2 max=195 | turn: 0-2=140 2-5=8 5-10=30 10-20=12 20-35=2 35-60=0 60-90=0 >=90=3 max=90
  dropped movement: events=3 absDx=133 absDy=41
📈 Movement diagnostics
  touch: callbacks=64 coalescedSamples=376 motionEvents=375
  touch dt: 0-4ms=0 4-8ms=374 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  coalesced dt: 0-4ms=0 4-8ms=374 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  pointer: events=375 emitted=375
  speed: 0-50=0 50-150=12 150-300=342 300-600=21 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=472.9
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=1 2.5-3=321 3-3.5=51 >=3.5=2 max=3.6
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=2 16-32=12 32-64=518 64-127=203 >=127=4 max=387.5
  probe raw: delta: 0-0.2=0 0.2-0.5=1 0.5-1=0 1-2=57 2-4=312 4-8=4 8-16=1 16-32=0 >=32=0 max=13.3 | turn: 0-2=125 2-5=68 5-10=129 10-20=47 20-35=3 35-60=0 60-90=0 >=90=2 max=94.4 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=93 33-50ms=232 50-100ms=50 >=100ms=0 max=60.2ms
  probe pointer: dtMinClamp=374 dtMaxClamp=1 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=374 12-17ms=0 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=125 2-5=68 5-10=129 10-20=47 20-35=3 35-60=0 60-90=0 >=90=2 max=94.4
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=20 17-25ms=7 25-34ms=31 34-50ms=15 >=50ms=0 max=43.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=364 subframes=364 capped=0 staleDrops=5 maxBatch=9 maxPending=695
  UDP sender: ticks=500 emitted=364 emptyWhileActive=27
  UDP timer dt: 0-4ms=249 4-8ms=251 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=350 8-12ms=5 12-17ms=7 17-25ms=1 25-34ms=0 34-50ms=0 >=50ms=0 max=19.2ms
  probe UDP: queueAge: 0-4ms=33 4-8ms=55 8-12ms=60 12-20ms=113 20-33ms=103 33-50ms=0 >=50ms=0 max=31.9ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=1 16-32=6 32-64=253 64-127=102 >=127=2 max=387.5 | turn: 0-2=120 2-5=66 5-10=122 10-20=50 20-35=3 35-60=0 60-90=0 >=90=2 max=94.2
  dropped movement: events=5 absDx=156 absDy=150
📈 Movement diagnostics
  touch: callbacks=75 coalescedSamples=459 motionEvents=458
  touch dt: 0-4ms=0 4-8ms=456 8-12ms=1 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=66.7ms
  coalesced dt: 0-4ms=0 4-8ms=456 8-12ms=2 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=66.7ms
  pointer: events=458 emitted=458
  speed: 0-50=13 50-150=97 150-300=348 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=281.8
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=25 2.5-3=425 3-3.5=8 >=3.5=0 max=3.0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=22 8-16=18 16-32=114 32-64=686 64-127=72 >=127=0 max=81.2
  probe raw: delta: 0-0.2=0 0.2-0.5=14 0.5-1=7 1-2=203 2-4=234 4-8=0 8-16=0 16-32=0 >=32=0 max=3.3 | turn: 0-2=157 2-5=77 5-10=117 10-20=90 20-35=6 35-60=6 60-90=0 >=90=4 max=135.0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=3 20-33ms=108 33-50ms=268 50-100ms=79 >=100ms=0 max=62.9ms
  probe pointer: dtMinClamp=457 dtMaxClamp=1 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=457 12-17ms=0 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=157 2-5=77 5-10=117 10-20=90 20-35=6 35-60=7 60-90=0 >=90=4 max=135.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=2 17-25ms=0 25-34ms=39 34-50ms=18 >=50ms=0 max=45.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=454 subframes=454 capped=0 staleDrops=10 maxBatch=10 maxPending=570
  UDP sender: ticks=501 emitted=454 emptyWhileActive=36
  UDP timer dt: 0-4ms=253 4-8ms=248 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=439 8-12ms=5 12-17ms=8 17-25ms=1 25-34ms=0 34-50ms=0 >=50ms=0 max=24.2ms
  probe UDP: queueAge: 0-4ms=42 4-8ms=65 8-12ms=70 12-20ms=139 20-33ms=138 33-50ms=0 >=50ms=0 max=31.9ms | delta: 0-1=0 1-2=0 2-4=0 4-8=11 8-16=9 16-32=56 32-64=341 64-127=37 >=127=0 max=81 | turn: 0-2=154 2-5=69 5-10=122 10-20=92 20-35=6 35-60=6 60-90=0 >=90=4 max=135
  dropped movement: events=10 absDx=272 absDy=263
📈 Movement diagnostics
  touch: callbacks=42 coalescedSamples=249 motionEvents=248
  touch dt: 0-4ms=0 4-8ms=240 8-12ms=5 12-20ms=2 20-33ms=0 33-50ms=1 >=50ms=0 max=35.4ms
  coalesced dt: 0-4ms=0 4-8ms=240 8-12ms=5 12-20ms=2 20-33ms=0 33-50ms=1 >=50ms=0 max=35.4ms
  pointer: events=248 emitted=248
  speed: 0-50=31 50-150=2 150-300=43 300-600=165 600-1000=7 1000-1600=0 1600-2400=0 >=2400=0 max=647.6
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=33 2.5-3=25 3-3.5=100 >=3.5=90 max=4.1
  emit delta: 0-1=2 1-2=0 2-4=0 4-8=43 8-16=16 16-32=2 32-64=30 64-127=190 >=127=194 max=253.5
  probe raw: delta: 0-0.2=2 0.2-0.5=22 0.5-1=8 1-2=3 2-4=88 4-8=124 8-16=1 16-32=0 >=32=0 max=10.7 | turn: 0-2=105 2-5=59 5-10=61 10-20=20 20-35=0 35-60=0 60-90=0 >=90=0 max=19.7 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=51 33-50ms=140 50-100ms=57 >=100ms=0 max=64.6ms
  probe pointer: dtMinClamp=245 dtMaxClamp=1 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=245 12-17ms=2 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=33.3ms | turn: 0-2=105 2-5=59 5-10=61 10-20=20 20-35=0 35-60=0 60-90=0 >=90=0 max=19.7
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=39 17-25ms=12 25-34ms=18 34-50ms=7 >=50ms=5 max=72.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=230 subframes=229 capped=0 staleDrops=12 maxBatch=10 maxPending=1949
  UDP sender: ticks=501 emitted=230 emptyWhileActive=43
  UDP timer dt: 0-4ms=249 4-8ms=251 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=217 8-12ms=2 12-17ms=6 17-25ms=3 25-34ms=1 34-50ms=0 >=50ms=0 max=28.0ms
  probe UDP: queueAge: 0-4ms=23 4-8ms=34 8-12ms=30 12-20ms=64 20-33ms=78 33-50ms=0 >=50ms=0 max=31.8ms | delta: 0-1=0 1-2=0 2-4=0 4-8=21 8-16=8 16-32=1 32-64=15 64-127=92 >=127=92 max=252.7 | turn: 0-2=103 2-5=53 5-10=52 10-20=20 20-35=0 35-60=0 60-90=0 >=90=0 max=20.0
  dropped movement: events=12 absDx=483 absDy=999
📈 Movement diagnostics
  touch: callbacks=78 coalescedSamples=480 motionEvents=480
  touch dt: 0-4ms=0 4-8ms=480 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=480 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=480 emitted=480
  speed: 0-50=0 50-150=0 150-300=0 300-600=385 600-1000=95 1000-1600=0 1600-2400=0 >=2400=0 max=750.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=1 >=3.5=479 max=4.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=2 >=127=944 max=314.5
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=0 4-8=463 8-16=17 16-32=0 >=32=0 max=8.9 | turn: 0-2=116 2-5=151 5-10=153 10-20=60 20-35=0 35-60=0 60-90=0 >=90=0 max=19.8 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=126 33-50ms=281 50-100ms=73 >=100ms=0 max=62.6ms
  probe pointer: dtMinClamp=480 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=480 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=11.1ms | turn: 0-2=116 2-5=151 5-10=153 10-20=60 20-35=0 35-60=0 60-90=0 >=90=0 max=19.8
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=38 34-50ms=20 >=50ms=0 max=44.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=465 subframes=466 capped=0 staleDrops=15 maxBatch=10 maxPending=1972
  UDP sender: ticks=500 emitted=465 emptyWhileActive=35
  UDP timer dt: 0-4ms=246 4-8ms=255 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=452 8-12ms=5 12-17ms=8 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.1ms
  probe UDP: queueAge: 0-4ms=39 4-8ms=69 8-12ms=69 12-20ms=140 20-33ms=149 33-50ms=0 >=50ms=0 max=31.9ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=1 >=127=465 max=314.5 | turn: 0-2=110 2-5=141 5-10=151 10-20=63 20-35=1 35-60=0 60-90=0 >=90=0 max=20.0
  dropped movement: events=15 absDx=1832 absDy=1877
📈 Movement diagnostics
  touch: callbacks=55 coalescedSamples=330 motionEvents=330
  touch dt: 0-4ms=0 4-8ms=330 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=330 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=330 emitted=330
  speed: 0-50=0 50-150=0 150-300=3 300-600=234 600-1000=93 1000-1600=0 1600-2400=0 >=2400=0 max=774.3
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=35 >=3.5=295 max=4.5
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=2 64-127=62 >=127=592 max=322.9
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=14 4-8=294 8-16=22 16-32=0 >=32=0 max=9.0 | turn: 0-2=90 2-5=103 5-10=93 10-20=41 20-35=3 35-60=0 60-90=0 >=90=0 max=26.6 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=78 33-50ms=204 50-100ms=48 >=100ms=0 max=65.1ms
  probe pointer: dtMinClamp=330 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=330 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=11.1ms | turn: 0-2=90 2-5=103 5-10=93 10-20=41 20-35=3 35-60=0 60-90=0 >=90=0 max=26.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=26 17-25ms=2 25-34ms=23 34-50ms=18 >=50ms=1 max=57.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=326 subframes=326 capped=0 staleDrops=4 maxBatch=10 maxPending=1918
  UDP sender: ticks=500 emitted=326 emptyWhileActive=16
  UDP timer dt: 0-4ms=240 4-8ms=260 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=320 8-12ms=5 12-17ms=0 17-25ms=1 25-34ms=0 34-50ms=0 >=50ms=0 max=20.3ms
  probe UDP: queueAge: 0-4ms=29 4-8ms=48 8-12ms=51 12-20ms=104 20-33ms=94 33-50ms=0 >=50ms=0 max=31.9ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=29 >=127=297 max=322.9 | turn: 0-2=93 2-5=98 5-10=91 10-20=41 20-35=3 35-60=0 60-90=0 >=90=0 max=26.6
  dropped movement: events=4 absDx=433 absDy=721
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 >=32=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 50-100ms=0 >=100ms=0 max=0ms
  probe pointer: dtMinClamp=0 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=98 17-25ms=22 25-34ms=0 34-50ms=0 >=50ms=0 max=17.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=249 4-8ms=251 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 >=32=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 50-100ms=0 >=100ms=0 max=0ms
  probe pointer: dtMinClamp=0 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=105 17-25ms=15 25-34ms=0 34-50ms=0 >=50ms=0 max=19.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=501 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=253 4-8ms=248 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 >=32=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 50-100ms=0 >=100ms=0 max=0ms
  probe pointer: dtMinClamp=0 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=100 17-25ms=18 25-34ms=0 34-50ms=1 >=50ms=0 max=34.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=501 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=238 4-8ms=263 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  probe raw: delta: 0-0.2=0 0.2-0.5=0 0.5-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 >=32=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0 | age: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 50-100ms=0 >=100ms=0 max=0ms
  probe pointer: dtMinClamp=0 dtMaxClamp=0 | safeDt: 0-4ms=0 4-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=99 17-25ms=17 25-34ms=2 34-50ms=0 >=50ms=0 max=31.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=239 4-8ms=261 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  probe UDP: queueAge: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms | delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0 | turn: 0-2=0 2-5=0 5-10=0 10-20=0 20-35=0 35-60=0 60-90=0 >=90=0 max=0
  dropped movement: events=0 absDx=0 absDy=0

22:22:30.366 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:30.366 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=1001/s
22:22:30.366 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:22:30.366 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:22:31.363 -> 📈 ESP smooth | UDP rawPkts=42/s datagrams=42/s subframes=42/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=42/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:31.363 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=992/s
22:22:31.363 ->   HID interval ms <2=11 2-4=18 4-8=7 8-16=2 >=16=4
22:22:31.363 ->   emit delta:    0=0 1=0 2-4=14 4-8=26 8-16=1 16-32=1 32-64=0 64-127=0
22:22:32.348 -> 📈 ESP smooth | UDP rawPkts=76/s datagrams=76/s subframes=76/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=74/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:32.348 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=990/s
22:22:32.348 ->   HID interval ms <2=21 2-4=34 4-8=11 8-16=1 >=16=7
22:22:32.348 ->   emit delta:    0=0 1=11 2-4=42 4-8=21 8-16=0 16-32=0 32-64=0 64-127=0
22:22:33.368 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.2ms
22:22:33.368 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=1001/s
22:22:33.368 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:22:33.368 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:22:34.381 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.2ms
22:22:34.381 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=1001/s
22:22:34.381 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:22:34.381 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:22:35.368 -> 📈 ESP smooth | UDP rawPkts=100/s datagrams=100/s subframes=100/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=100/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:35.368 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=983/s
22:22:35.368 ->   HID interval ms <2=28 2-4=46 4-8=14 8-16=1 >=16=11
22:22:35.368 ->   emit delta:    0=0 1=1 2-4=11 4-8=58 8-16=29 16-32=1 32-64=0 64-127=0
22:22:36.384 -> 📈 ESP smooth | UDP rawPkts=16/s datagrams=16/s subframes=16/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=12/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:22:36.384 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=995/s
22:22:36.384 ->   HID interval ms <2=5 2-4=3 4-8=0 8-16=1 >=16=3
22:22:36.384 ->   emit delta:    0=0 1=0 2-4=1 4-8=10 8-16=1 16-32=0 32-64=0 64-127=0
22:22:37.370 -> 📈 ESP smooth | UDP rawPkts=71/s datagrams=71/s subframes=71/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=68/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:37.370 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=989/s
22:22:37.370 ->   HID interval ms <2=17 2-4=25 4-8=16 8-16=4 >=16=6
22:22:37.370 ->   emit delta:    0=0 1=19 2-4=17 4-8=25 8-16=7 16-32=0 32-64=0 64-127=0
22:22:38.390 -> 📈 ESP smooth | UDP rawPkts=102/s datagrams=102/s subframes=102/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=99/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:38.390 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 mounted=yes | udpRx iters=989/s
22:22:38.390 ->   HID interval ms <2=21 2-4=38 4-8=26 8-16=4 >=16=10
22:22:38.390 ->   emit delta:    0=0 1=10 2-4=31 4-8=35 8-16=22 16-32=1 32-64=0 64-127=0
22:22:39.378 -> 📈 ESP smooth | UDP rawPkts=90/s datagrams=90/s subframes=90/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=90/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:39.379 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 mounted=yes | udpRx iters=988/s
22:22:39.379 ->   HID interval ms <2=25 2-4=36 4-8=17 8-16=3 >=16=9
22:22:39.379 ->   emit delta:    0=0 1=1 2-4=6 4-8=27 8-16=55 16-32=1 32-64=0 64-127=0
22:22:40.391 -> 📈 ESP smooth | UDP rawPkts=76/s datagrams=76/s subframes=76/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=74/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:22:40.391 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=987/s
22:22:40.391 ->   HID interval ms <2=18 2-4=36 4-8=13 8-16=1 >=16=6
22:22:40.391 ->   emit delta:    0=0 1=7 2-4=35 4-8=25 8-16=7 16-32=0 32-64=0 64-127=0
22:22:41.377 -> 📈 ESP smooth | UDP rawPkts=141/s datagrams=141/s subframes=141/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=138/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:41.377 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=981/s
22:22:41.377 ->   HID interval ms <2=34 2-4=51 4-8=37 8-16=5 >=16=11
22:22:41.377 ->   emit delta:    0=0 1=22 2-4=25 4-8=56 8-16=34 16-32=1 32-64=0 64-127=0
22:22:42.395 -> 📈 ESP smooth | UDP rawPkts=32/s datagrams=32/s subframes=32/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=28/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:42.395 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=998/s
22:22:42.395 ->   HID interval ms <2=9 2-4=8 4-8=6 8-16=0 >=16=5
22:22:42.395 ->   emit delta:    0=0 1=1 2-4=0 4-8=17 8-16=9 16-32=1 32-64=0 64-127=0
22:22:43.381 -> 📈 ESP smooth | UDP rawPkts=84/s datagrams=84/s subframes=84/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=84/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:22:43.381 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=990/s
22:22:43.381 ->   HID interval ms <2=23 2-4=32 4-8=17 8-16=2 >=16=10
22:22:43.381 ->   emit delta:    0=0 1=9 2-4=7 4-8=51 8-16=16 16-32=1 32-64=0 64-127=0
22:22:44.394 -> 📈 ESP smooth | UDP rawPkts=66/s datagrams=66/s subframes=66/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=62/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:22:44.394 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=993/s
22:22:44.394 ->   HID interval ms <2=14 2-4=26 4-8=13 8-16=2 >=16=7
22:22:44.394 ->   emit delta:    0=0 1=11 2-4=9 4-8=10 8-16=32 16-32=0 32-64=0 64-127=0
22:22:45.377 -> 📈 ESP smooth | UDP rawPkts=160/s datagrams=160/s subframes=160/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=159/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:45.377 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 mounted=yes | udpRx iters=983/s
22:22:45.377 ->   HID interval ms <2=40 2-4=57 4-8=46 8-16=6 >=16=10
22:22:45.377 ->   emit delta:    0=0 1=0 2-4=2 4-8=101 8-16=54 16-32=1 32-64=1 64-127=0
22:22:46.396 -> 📈 ESP smooth | UDP rawPkts=195/s datagrams=195/s subframes=195/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=193/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:22:46.396 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=976/s
22:22:46.396 ->   HID interval ms <2=54 2-4=78 4-8=41 8-16=5 >=16=15
22:22:46.396 ->   emit delta:    0=0 1=0 2-4=14 4-8=137 8-16=42 16-32=0 32-64=0 64-127=0
22:22:47.378 -> 📈 ESP smooth | UDP rawPkts=196/s datagrams=195/s subframes=195/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=196/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:22:47.378 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=976/s
22:22:47.378 ->   HID interval ms <2=56 2-4=67 4-8=58 8-16=5 >=16=10
22:22:47.378 ->   emit delta:    0=0 1=0 2-4=12 4-8=162 8-16=22 16-32=0 32-64=0 64-127=0
22:22:48.395 -> 📈 ESP smooth | UDP rawPkts=140/s datagrams=140/s subframes=140/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=133/s reportFails=0 staleDrops=0 lateMax=0.2ms
22:22:48.395 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=982/s
22:22:48.395 ->   HID interval ms <2=36 2-4=54 4-8=27 8-16=5 >=16=11
22:22:48.395 ->   emit delta:    0=0 1=30 2-4=21 4-8=79 8-16=3 16-32=0 32-64=0 64-127=0
22:22:49.381 -> 📈 ESP smooth | UDP rawPkts=39/s datagrams=39/s subframes=39/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=36/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:49.381 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 mounted=yes | udpRx iters=997/s
22:22:49.381 ->   HID interval ms <2=12 2-4=14 4-8=5 8-16=0 >=16=5
22:22:49.381 ->   emit delta:    0=0 1=0 2-4=1 4-8=21 8-16=13 16-32=1 32-64=0 64-127=0
22:22:50.397 -> 📈 ESP smooth | UDP rawPkts=179/s datagrams=179/s subframes=179/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=182/s reportFails=0 staleDrops=0 lateMax=0.0ms
22:22:50.397 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=975/s
22:22:50.397 ->   HID interval ms <2=53 2-4=76 4-8=36 8-16=5 >=16=12
22:22:50.397 ->   emit delta:    0=0 1=0 2-4=0 4-8=2 8-16=78 16-32=102 32-64=0 64-127=0
22:22:51.417 -> 📈 ESP smooth | UDP rawPkts=200/s datagrams=200/s subframes=200/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=200/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:51.417 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=977/s
22:22:51.417 ->   HID interval ms <2=62 2-4=74 4-8=43 8-16=8 >=16=13
22:22:51.417 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=15 16-32=185 32-64=0 64-127=0
22:22:52.400 -> 📈 ESP smooth | UDP rawPkts=205/s datagrams=205/s subframes=205/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=206/s reportFails=0 staleDrops=0 lateMax=0.0ms
22:22:52.400 ->   net: wifi=connected ip=192.168.18.125 rssi=-34 mounted=yes | udpRx iters=972/s
22:22:52.400 ->   HID interval ms <2=58 2-4=81 4-8=50 8-16=4 >=16=13
22:22:52.400 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=5 16-32=196 32-64=5 64-127=0
22:22:53.418 -> 📈 ESP smooth | UDP rawPkts=181/s datagrams=181/s subframes=181/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=181/s reportFails=0 staleDrops=0 lateMax=0.4ms
22:22:53.418 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 mounted=yes | udpRx iters=978/s
22:22:53.418 ->   HID interval ms <2=50 2-4=68 4-8=44 8-16=8 >=16=11
22:22:53.418 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=32 16-32=148 32-64=1 64-127=0
22:22:54.404 -> 📈 ESP smooth | UDP rawPkts=18/s datagrams=18/s subframes=18/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=18/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:54.404 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=999/s
22:22:54.404 ->   HID interval ms <2=5 2-4=8 4-8=4 8-16=0 >=16=1
22:22:54.404 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=3 16-32=13 32-64=2 64-127=0
22:22:55.419 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:55.419 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=1001/s
22:22:55.419 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:22:55.419 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:22:56.404 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:56.404 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:56.404 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=1001/s
22:22:56.404 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:22:56.404 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:22:57.426 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:57.426 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 mounted=yes | udpRx iters=1001/s
22:22:57.426 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:22:57.426 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:22:58.416 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:58.416 ->   net: wifi=connected ip=192.168.18.125 rssi=-33 mounted=yes | udpRx iters=1001/s
22:22:58.416 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:22:58.416 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:22:59.432 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:22:59.432 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=1001/s
22:22:59.432 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:22:59.432 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

log 2
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=24 17-25ms=0 25-34ms=0 34-50ms=1 >=50ms=1 max=406.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=175 emitted=0 emptyWhileActive=0 underruns=0
  UDP timer dt: 0-4ms=87 4-8ms=82 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=439.8ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=5 coalescedSamples=19 motionEvents=18
  touch dt: 0-4ms=0 4-8ms=17 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=54.2ms
  coalesced dt: 0-4ms=0 4-8ms=17 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=54.2ms
  pointer: events=18 emitted=18
  speed: 0-50=1 50-150=6 150-300=8 300-600=3 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=376.6
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=18 2.5-3=0 3-3.5=0 >=3.5=0 max=2.2
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=2 16-32=6 32-64=6 64-127=5 >=127=0 max=97.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=113 17-25ms=1 25-34ms=3 34-50ms=0 >=50ms=0 max=27.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=1 subframes=1 capped=0 staleDrops=0 maxBatch=16 maxPending=658
  UDP sender: ticks=501 emitted=1 emptyWhileActive=22 underruns=22
  UDP timer dt: 0-4ms=217 4-8ms=284 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=1 24-32ms=0 32-50ms=0 >=50ms=0 max=20.0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=71 coalescedSamples=403 motionEvents=402
  touch dt: 0-4ms=0 4-8ms=401 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  coalesced dt: 0-4ms=0 4-8ms=401 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=37.5ms
  pointer: events=402 emitted=402
  speed: 0-50=1 50-150=0 150-300=45 300-600=321 600-1000=35 1000-1600=0 1600-2400=0 >=2400=0 max=851.7
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=402 2.5-3=0 3-3.5=0 >=3.5=0 max=2.2
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=61 64-127=326 >=127=17 max=1448.2
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=13 17-25ms=1 25-34ms=34 34-50ms=17 >=50ms=2 max=53.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=2 subframes=2 capped=1 staleDrops=0 maxBatch=34 maxPending=2700
  UDP sender: ticks=500 emitted=2 emptyWhileActive=420 underruns=420
  UDP timer dt: 0-4ms=248 4-8ms=252 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=2 >=50ms=0 max=49.6ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=38 coalescedSamples=179 motionEvents=175
  touch dt: 0-4ms=0 4-8ms=170 8-12ms=1 12-20ms=1 20-33ms=1 33-50ms=1 >=50ms=1 max=62.5ms
  coalesced dt: 0-4ms=0 4-8ms=170 8-12ms=2 12-20ms=1 20-33ms=1 33-50ms=1 >=50ms=1 max=62.5ms
  pointer: events=175 emitted=175
  speed: 0-50=2 50-150=23 150-300=32 300-600=110 600-1000=8 1000-1600=0 1600-2400=0 >=2400=0 max=672.8
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=175 2.5-3=0 3-3.5=0 >=3.5=0 max=2.2
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=2 8-16=6 16-32=16 32-64=41 64-127=109 >=127=7 max=1116.5
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=60 17-25ms=3 25-34ms=18 34-50ms=8 >=50ms=2 max=67.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=6 subframes=6 capped=1 staleDrops=0 maxBatch=33 maxPending=4695
  UDP sender: ticks=501 emitted=6 emptyWhileActive=194 underruns=194
  UDP timer dt: 0-4ms=231 4-8ms=270 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=4.9ms
  UDP send dt: 0-8ms=2 8-12ms=0 12-17ms=1 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=12.0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=4 24-32ms=0 32-50ms=1 >=50ms=1 max=50.4ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=52 coalescedSamples=250 motionEvents=245
  touch dt: 0-4ms=4 4-8ms=236 8-12ms=0 12-20ms=0 20-33ms=3 33-50ms=2 >=50ms=0 max=46.0ms
  coalesced dt: 0-4ms=4 4-8ms=236 8-12ms=0 12-20ms=0 20-33ms=3 33-50ms=2 >=50ms=0 max=46.0ms
  pointer: events=245 emitted=245
  speed: 0-50=2 50-150=12 150-300=67 300-600=116 600-1000=42 1000-1600=6 1600-2400=0 >=2400=0 max=1079.8
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=245 2.5-3=0 3-3.5=0 >=3.5=0 max=2.2
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=1 8-16=1 16-32=17 32-64=65 64-127=125 >=127=41 max=220.9
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=34 17-25ms=4 25-34ms=27 34-50ms=7 >=50ms=5 max=65.1ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=5 subframes=5 capped=0 staleDrops=0 maxBatch=33 maxPending=0
  UDP sender: ticks=501 emitted=5 emptyWhileActive=267 underruns=267
  UDP timer dt: 0-4ms=259 4-8ms=242 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=3 >=50ms=2 max=58.2ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=42 coalescedSamples=219 motionEvents=216
  touch dt: 0-4ms=0 4-8ms=213 8-12ms=0 12-20ms=0 20-33ms=2 33-50ms=1 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=213 8-12ms=0 12-20ms=0 20-33ms=2 33-50ms=1 >=50ms=0 max=45.8ms
  pointer: events=216 emitted=216
  speed: 0-50=3 50-150=14 150-300=25 300-600=112 600-1000=57 1000-1600=5 1600-2400=0 >=2400=0 max=1033.3
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=216 2.5-3=0 3-3.5=0 >=3.5=0 max=2.2
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=6 8-16=2 16-32=14 32-64=32 64-127=113 >=127=53 max=213.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=49 17-25ms=3 25-34ms=18 34-50ms=10 >=50ms=4 max=52.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=4 subframes=4 capped=0 staleDrops=0 maxBatch=34 maxPending=0
  UDP sender: ticks=500 emitted=4 emptyWhileActive=231 underruns=231
  UDP timer dt: 0-4ms=236 4-8ms=264 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=2 >=50ms=2 max=60.1ms
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
  UDP sender: ticks=501 emitted=0 emptyWhileActive=0 underruns=0
  UDP timer dt: 0-4ms=252 4-8ms=249 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0


22:00:11.865 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:00:11.865 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
22:00:11.865 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:00:11.865 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:00:12.848 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:00:12.848 ->   net: wifi=connected ip=192.168.18.125 rssi=-25 mounted=yes | udpRx iters=1001/s
22:00:12.848 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:00:12.848 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:00:13.866 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:00:13.866 ->   net: wifi=connected ip=192.168.18.125 rssi=-25 mounted=yes | udpRx iters=1001/s
22:00:13.866 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:00:13.866 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:00:14.852 -> 📈 ESP smooth | UDP rawPkts=2/s datagrams=2/s subframes=2/s malformed=0 queueMax=1 overflow=0 | HID ticks=500/s reports=3/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:00:14.886 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=1001/s
22:00:14.886 ->   HID interval ms <2=0 2-4=1 4-8=0 8-16=0 >=16=2
22:00:14.886 ->   emit delta:    0=0 1=2 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=1
22:00:15.865 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:00:15.865 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 mounted=yes | udpRx iters=1001/s
22:00:15.865 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
22:00:15.865 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
22:00:16.882 -> 📈 ESP smooth | UDP rawPkts=5/s datagrams=5/s subframes=5/s malformed=0 queueMax=2 overflow=0 | HID ticks=500/s reports=5/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:00:16.882 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 mounted=yes | udpRx iters=1001/s
22:00:16.882 ->   HID interval ms <2=1 2-4=0 4-8=1 8-16=1 >=16=2
22:00:16.882 ->   emit delta:    0=0 1=0 2-4=1 4-8=2 8-16=1 16-32=1 32-64=0 64-127=0
22:00:17.862 -> 📈 ESP smooth | UDP rawPkts=2/s datagrams=2/s subframes=2/s malformed=0 queueMax=1 overflow=0 | HID ticks=500/s reports=3/s reportFails=0 staleDrops=0 lateMax=0.2ms
22:00:17.862 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
22:00:17.862 ->   HID interval ms <2=1 2-4=0 4-8=0 8-16=0 >=16=2
22:00:17.862 ->   emit delta:    0=0 1=1 2-4=1 4-8=0 8-16=0 16-32=0 32-64=0 64-127=1
22:00:18.879 -> 📈 ESP smooth | UDP rawPkts=2/s datagrams=2/s subframes=2/s malformed=0 queueMax=1 overflow=0 | HID ticks=500/s reports=2/s reportFails=0 staleDrops=0 lateMax=0.2ms
22:00:18.879 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=1001/s
22:00:18.879 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=2
22:00:18.879 ->   emit delta:    0=0 1=0 2-4=0 4-8=1 8-16=1 16-32=0 32-64=0 64-127=0
22:00:19.863 -> 📈 ESP smooth | UDP rawPkts=2/s datagrams=2/s subframes=2/s malformed=0 queueMax=1 overflow=0 | HID ticks=500/s reports=2/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:00:19.863 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
22:00:19.863 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=2
22:00:19.895 ->   emit delta:    0=0 1=0 2-4=1 4-8=1 8-16=0 16-32=0 32-64=0 64-127=0
22:00:20.879 -> 📈 ESP smooth | UDP rawPkts=2/s datagrams=2/s subframes=2/s malformed=0 queueMax=1 overflow=0 | HID ticks=500/s reports=2/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:00:20.879 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=1001/s
22:00:20.879 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=2
22:00:20.879 ->   emit delta:    0=0 1=0 2-4=0 4-8=1 8-16=0 16-32=1 32-64=0 64-127=0
22:00:21.896 -> 📈 ESP smooth | UDP rawPkts=3/s datagrams=3/s subframes=3/s malformed=0 queueMax=1 overflow=0 | HID ticks=500/s reports=3/s reportFails=0 staleDrops=0 lateMax=0.3ms
22:00:21.896 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=1001/s
22:00:21.896 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=3
22:00:21.896 ->   emit delta:    0=0 1=0 2-4=2 4-8=1 8-16=0 16-32=0 32-64=0 64-127=0

log1
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=14 17-25ms=5 25-34ms=1 34-50ms=0 >=50ms=1 max=871.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=148 emitted=0 emptyWhileActive=0 underruns=0
  UDP timer dt: 0-4ms=70 4-8ms=72 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=6 max=537.5ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=0 >=50ms=0 max=0ms
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
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=88 17-25ms=32 25-34ms=0 34-50ms=0 >=50ms=0 max=17.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0 underruns=0
  UDP timer dt: 0-4ms=240 4-8ms=260 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=0 >=50ms=0 max=0ms
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
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=88 17-25ms=32 25-34ms=0 34-50ms=0 >=50ms=0 max=17.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0 underruns=0
  UDP timer dt: 0-4ms=251 4-8ms=249 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=64 coalescedSamples=369 motionEvents=368
  touch dt: 0-4ms=0 4-8ms=367 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=367 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=0 max=45.8ms
  pointer: events=368 emitted=368
  speed: 0-50=1 50-150=28 150-300=69 300-600=217 600-1000=53 1000-1600=0 1600-2400=0 >=2400=0 max=727.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=210 2-2.5=158 2.5-3=0 3-3.5=0 >=3.5=0 max=2.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=1 8-16=34 16-32=46 32-64=268 64-127=339 >=127=57 max=160.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=20 17-25ms=7 25-34ms=20 34-50ms=17 >=50ms=3 max=73.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=377 subframes=377 capped=0 staleDrops=0 maxBatch=39 maxPending=1480
  UDP sender: ticks=500 emitted=377 emptyWhileActive=13 underruns=13
  UDP timer dt: 0-4ms=258 4-8ms=242 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=374 8-12ms=2 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=11.7ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=5 32-50ms=372 >=50ms=0 max=49.0ms
  dropped movement: events=0 absDx=0 absDy=0
left clicked and sent
📈 Movement diagnostics
  touch: callbacks=76 coalescedSamples=434 motionEvents=432
  touch dt: 0-4ms=2 4-8ms=430 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=5.8ms
  coalesced dt: 0-4ms=2 4-8ms=430 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=5.8ms
  pointer: events=432 emitted=432
  speed: 0-50=0 50-150=3 150-300=27 300-600=242 600-1000=160 1000-1600=0 1600-2400=0 >=2400=0 max=940.1
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=138 2-2.5=282 2.5-3=12 3-3.5=0 >=3.5=0 max=2.7
  emit delta: 0-1=0 1-2=0 2-4=16 4-8=0 8-16=2 16-32=9 32-64=175 64-127=429 >=127=261 max=234.6
  BLE: attempts=42 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=4 17-25ms=1 25-34ms=32 34-50ms=19 >=50ms=2 max=70.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=460 subframes=460 capped=0 staleDrops=0 maxBatch=40 maxPending=2654
  UDP sender: ticks=500 emitted=460 emptyWhileActive=18 underruns=18
  UDP timer dt: 0-4ms=252 4-8ms=248 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=458 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=105 >=50ms=355 max=68.6ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=76 coalescedSamples=476 motionEvents=475
  touch dt: 0-4ms=0 4-8ms=472 8-12ms=2 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=20.8ms
  coalesced dt: 0-4ms=0 4-8ms=472 8-12ms=2 12-20ms=1 20-33ms=1 33-50ms=0 >=50ms=0 max=20.8ms
  pointer: events=475 emitted=475
  speed: 0-50=7 50-150=30 150-300=27 300-600=248 600-1000=163 1000-1600=0 1600-2400=0 >=2400=0 max=868.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=148 2-2.5=307 2.5-3=20 3-3.5=0 >=3.5=0 max=2.6
  emit delta: 0-1=0 1-2=5 2-4=3 4-8=13 8-16=22 16-32=75 32-64=94 64-127=523 >=127=236 max=207.7
  BLE: attempts=57 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=38 34-50ms=19 >=50ms=0 max=45.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=496 subframes=496 capped=0 staleDrops=0 maxBatch=39 maxPending=2452
  UDP sender: ticks=500 emitted=496 emptyWhileActive=4 underruns=4
  UDP timer dt: 0-4ms=256 4-8ms=244 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=495 8-12ms=1 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=8.2ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=0 >=50ms=501 max=68.6ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=51 coalescedSamples=301 motionEvents=298
  touch dt: 0-4ms=2 4-8ms=294 8-12ms=1 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=1 max=112.5ms
  coalesced dt: 0-4ms=2 4-8ms=294 8-12ms=1 12-20ms=1 20-33ms=0 33-50ms=0 >=50ms=1 max=112.5ms
  pointer: events=298 emitted=298
  speed: 0-50=4 50-150=7 150-300=16 300-600=192 600-1000=79 1000-1600=0 1600-2400=0 >=2400=0 max=837.1
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=87 2-2.5=207 2.5-3=4 3-3.5=0 >=3.5=0 max=2.5
  emit delta: 0-1=0 1-2=1 2-4=2 4-8=9 8-16=9 16-32=12 32-64=89 64-127=384 >=127=118 max=199.9
  BLE: attempts=69 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=22 17-25ms=8 25-34ms=25 34-50ms=11 >=50ms=3 max=71.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=326 subframes=326 capped=0 staleDrops=0 maxBatch=39 maxPending=2159
  UDP sender: ticks=501 emitted=326 emptyWhileActive=16 underruns=16
  UDP timer dt: 0-4ms=265 4-8ms=236 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=318 8-12ms=1 12-17ms=2 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.1ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=28 16-24ms=5 24-32ms=21 32-50ms=31 >=50ms=240 max=70.5ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=50 coalescedSamples=283 motionEvents=278
  touch dt: 0-4ms=0 4-8ms=270 8-12ms=4 12-20ms=0 20-33ms=2 33-50ms=2 >=50ms=0 max=50.0ms
  coalesced dt: 0-4ms=0 4-8ms=271 8-12ms=6 12-20ms=0 20-33ms=2 33-50ms=2 >=50ms=0 max=50.0ms
  pointer: events=278 emitted=278
  speed: 0-50=37 50-150=96 150-300=41 300-600=84 600-1000=20 1000-1600=0 1600-2400=0 >=2400=0 max=769.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=229 2-2.5=49 2.5-3=0 3-3.5=0 >=3.5=0 max=2.4
  emit delta: 0-1=0 1-2=9 2-4=10 4-8=84 8-16=155 16-32=56 32-64=78 64-127=161 >=127=24 max=173.4
  BLE: attempts=74 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=29 17-25ms=9 25-34ms=23 34-50ms=12 >=50ms=1 max=58.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=299 subframes=299 capped=0 staleDrops=0 maxBatch=38 maxPending=1655
  UDP sender: ticks=501 emitted=299 emptyWhileActive=46 underruns=46
  UDP timer dt: 0-4ms=259 4-8ms=242 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=283 8-12ms=4 12-17ms=9 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=24 32-50ms=68 >=50ms=226 max=65.5ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=36 coalescedSamples=198 motionEvents=194
  touch dt: 0-4ms=0 4-8ms=189 8-12ms=1 12-20ms=1 20-33ms=2 33-50ms=1 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=189 8-12ms=2 12-20ms=1 20-33ms=2 33-50ms=1 >=50ms=0 max=45.8ms
  pointer: events=194 emitted=194
  speed: 0-50=9 50-150=25 150-300=33 300-600=100 600-1000=27 1000-1600=0 1600-2400=0 >=2400=0 max=877.6
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=109 2-2.5=77 2.5-3=8 3-3.5=0 >=3.5=0 max=2.6
  emit delta: 0-1=0 1-2=6 2-4=4 4-8=24 8-16=28 16-32=40 32-64=81 64-127=173 >=127=45 max=208.0
  BLE: attempts=67 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=26 17-25ms=5 25-34ms=19 34-50ms=9 >=50ms=8 max=74.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=207 subframes=207 capped=0 staleDrops=0 maxBatch=44 maxPending=1621
  UDP sender: ticks=500 emitted=207 emptyWhileActive=30 underruns=30
  UDP timer dt: 0-4ms=262 4-8ms=238 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=196 8-12ms=4 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=11.7ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=76 32-50ms=132 >=50ms=0 max=47.9ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=50 coalescedSamples=261 motionEvents=253
  touch dt: 0-4ms=0 4-8ms=246 8-12ms=2 12-20ms=0 20-33ms=2 33-50ms=3 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=246 8-12ms=5 12-20ms=1 20-33ms=2 33-50ms=3 >=50ms=0 max=45.8ms
  pointer: events=253 emitted=253
  speed: 0-50=14 50-150=18 150-300=28 300-600=155 600-1000=38 1000-1600=0 1600-2400=0 >=2400=0 max=750.2
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=115 2-2.5=138 2.5-3=0 3-3.5=0 >=3.5=0 max=2.4
  emit delta: 0-1=0 1-2=6 2-4=10 4-8=31 8-16=18 16-32=20 32-64=84 64-127=304 >=127=39 max=167.2
  BLE: attempts=67 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=16 17-25ms=14 25-34ms=19 34-50ms=11 >=50ms=7 max=66.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=259 subframes=259 capped=0 staleDrops=0 maxBatch=42 maxPending=1325
  UDP sender: ticks=501 emitted=259 emptyWhileActive=50 underruns=50
  UDP timer dt: 0-4ms=246 4-8ms=255 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=244 8-12ms=6 12-17ms=2 17-25ms=1 25-34ms=0 34-50ms=0 >=50ms=0 max=24.0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=7 16-24ms=4 24-32ms=31 32-50ms=221 >=50ms=1 max=50.7ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=55 coalescedSamples=346 motionEvents=345
  touch dt: 0-4ms=0 4-8ms=344 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=20.7ms
  coalesced dt: 0-4ms=0 4-8ms=344 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=0 >=50ms=0 max=20.7ms
  pointer: events=345 emitted=345
  speed: 0-50=0 50-150=1 150-300=9 300-600=232 600-1000=103 1000-1600=0 1600-2400=0 >=2400=0 max=837.9
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=70 2-2.5=269 2.5-3=6 3-3.5=0 >=3.5=0 max=2.5
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=5 32-64=73 64-127=490 >=127=145 max=232.6
  BLE: attempts=62 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=20 17-25ms=4 25-34ms=17 34-50ms=12 >=50ms=9 max=79.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=368 subframes=368 capped=0 staleDrops=0 maxBatch=39 maxPending=1378
  UDP sender: ticks=501 emitted=368 emptyWhileActive=12 underruns=12
  UDP timer dt: 0-4ms=251 4-8ms=250 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=363 8-12ms=1 12-17ms=1 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=12.5ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=367 >=50ms=1 max=50.3ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=116 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=88 17-25ms=25 25-34ms=0 34-50ms=1 >=50ms=1 max=68.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=501 emitted=0 emptyWhileActive=0 underruns=0
  UDP timer dt: 0-4ms=252 4-8ms=249 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=118 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=96 17-25ms=21 25-34ms=0 34-50ms=1 >=50ms=0 max=34.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0 underruns=0
  UDP timer dt: 0-4ms=251 4-8ms=249 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP sample age: 0-8ms=0 8-12ms=0 12-16ms=0 16-24ms=0 24-32ms=0 32-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0

21:42:10.640 -> 
21:42:10.640 -> 🔧 Initializing TinyUSB HID Mouse...
21:42:11.429 -> .....
21:42:12.459 -> ✅ UDP motion listening on 192.168.18.125:4210
21:42:12.459 -> 🎯 ESP_Bridge_TinyUSB ready
21:42:12.459 -> 🚦 udp-rx task running on core 0
21:42:13.443 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=1399/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
21:42:13.443 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=1002/s
21:42:13.443 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
21:42:13.443 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
21:42:14.458 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
21:42:14.458 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=1001/s
21:42:14.458 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
21:42:14.458 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
21:42:15.446 -> 📈 ESP smooth | UDP rawPkts=148/s datagrams=148/s subframes=148/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=147/s reportFails=0 staleDrops=0 lateMax=0.5ms
21:42:15.446 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=974/s
21:42:15.446 ->   HID interval ms <2=34 2-4=76 4-8=21 8-16=3 >=16=12
21:42:15.446 ->   emit delta:    0=0 1=6 2-4=17 4-8=86 8-16=38 16-32=0 32-64=0 64-127=0
21:42:16.468 -> 📈 ESP smooth | UDP rawPkts=163/s datagrams=163/s subframes=163/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=163/s reportFails=0 staleDrops=0 lateMax=0.5ms
21:42:16.468 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=969/s
21:42:16.468 ->   HID interval ms <2=48 2-4=70 4-8=32 8-16=0 >=16=13
21:42:16.468 ->   emit delta:    0=0 1=0 2-4=0 4-8=48 8-16=97 16-32=18 32-64=0 64-127=0
21:42:17.456 -> 📈 ESP smooth | UDP rawPkts=163/s datagrams=163/s subframes=163/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=149/s reportFails=0 staleDrops=0 lateMax=0.0ms
21:42:17.456 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=973/s
21:42:17.456 ->   HID interval ms <2=42 2-4=70 4-8=19 8-16=6 >=16=12
21:42:17.456 ->   emit delta:    0=0 1=5 2-4=4 4-8=46 8-16=79 16-32=15 32-64=0 64-127=0
21:42:18.440 -> 📈 ESP smooth | UDP rawPkts=147/s datagrams=147/s subframes=147/s malformed=0 queueMax=9 overflow=0 | HID ticks=500/s reports=148/s reportFails=0 staleDrops=0 lateMax=0.4ms
21:42:18.440 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=972/s
21:42:18.440 ->   HID interval ms <2=40 2-4=69 4-8=27 8-16=2 >=16=10
21:42:18.440 ->   emit delta:    0=0 1=0 2-4=1 4-8=16 8-16=93 16-32=38 32-64=0 64-127=0
21:42:19.461 -> 📈 ESP smooth | UDP rawPkts=185/s datagrams=185/s subframes=185/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=175/s reportFails=0 staleDrops=0 lateMax=0.4ms
21:42:19.461 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=972/s
21:42:19.461 ->   HID interval ms <2=53 2-4=74 4-8=35 8-16=0 >=16=13
21:42:19.461 ->   emit delta:    0=0 1=8 2-4=24 4-8=26 8-16=112 16-32=5 32-64=0 64-127=0
21:42:20.455 -> 📈 ESP smooth | UDP rawPkts=184/s datagrams=184/s subframes=184/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=184/s reportFails=0 staleDrops=0 lateMax=0.4ms
21:42:20.455 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=966/s
21:42:20.455 ->   HID interval ms <2=59 2-4=82 4-8=27 8-16=2 >=16=14
21:42:20.455 ->   emit delta:    0=0 1=0 2-4=0 4-8=18 8-16=131 16-32=35 32-64=0 64-127=0
21:42:21.473 -> 📈 ESP smooth | UDP rawPkts=139/s datagrams=139/s subframes=139/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=139/s reportFails=0 staleDrops=0 lateMax=0.5ms
21:42:21.473 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 mounted=yes | udpRx iters=982/s
21:42:21.473 ->   HID interval ms <2=41 2-4=59 4-8=27 8-16=1 >=16=11
21:42:21.473 ->   emit delta:    0=0 1=1 2-4=0 4-8=20 8-16=108 16-32=10 32-64=0 64-127=0
21:42:22.460 -> 📈 ESP smooth | UDP rawPkts=67/s datagrams=67/s subframes=67/s malformed=0 queueMax=5 overflow=0 | HID ticks=500/s reports=65/s reportFails=0 staleDrops=0 lateMax=0.4ms
21:42:22.460 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 mounted=yes | udpRx iters=991/s
21:42:22.460 ->   HID interval ms <2=17 2-4=28 4-8=14 8-16=0 >=16=6
21:42:22.460 ->   emit delta:    0=0 1=3 2-4=7 4-8=20 8-16=34 16-32=1 32-64=0 64-127=0
21:42:23.479 -> 📈 ESP smooth | UDP rawPkts=166/s datagrams=167/s subframes=167/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=145/s reportFails=0 staleDrops=0 lateMax=0.1ms
21:42:23.479 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=975/s
21:42:23.479 ->   HID interval ms <2=38 2-4=60 4-8=28 8-16=4 >=16=15
21:42:23.479 ->   emit delta:    0=0 1=57 2-4=30 4-8=16 8-16=35 16-32=7 32-64=0 64-127=0
21:42:24.467 -> 📈 ESP smooth | UDP rawPkts=60/s datagrams=60/s subframes=60/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=56/s reportFails=0 staleDrops=0 lateMax=0.5ms
21:42:24.467 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=991/s
21:42:24.467 ->   HID interval ms <2=14 2-4=24 4-8=11 8-16=1 >=16=6
21:42:24.467 ->   emit delta:    0=0 1=8 2-4=10 4-8=9 8-16=29 16-32=0 32-64=0 64-127=0
21:42:25.486 -> 📈 ESP smooth | UDP rawPkts=107/s datagrams=107/s subframes=107/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=107/s reportFails=0 staleDrops=0 lateMax=0.5ms
21:42:25.486 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=982/s
21:42:25.486 ->   HID interval ms <2=27 2-4=51 4-8=14 8-16=4 >=16=11
21:42:25.486 ->   emit delta:    0=0 1=5 2-4=18 4-8=35 8-16=37 16-32=12 32-64=0 64-127=0
21:42:26.468 -> 📈 ESP smooth | UDP rawPkts=83/s datagrams=83/s subframes=83/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=81/s reportFails=0 staleDrops=0 lateMax=0.4ms
21:42:26.468 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=986/s
21:42:26.468 ->   HID interval ms <2=24 2-4=33 4-8=15 8-16=2 >=16=7
21:42:26.468 ->   emit delta:    0=0 1=2 2-4=11 4-8=16 8-16=49 16-32=3 32-64=0 64-127=0
21:42:27.487 -> 📈 ESP smooth | UDP rawPkts=88/s datagrams=89/s subframes=89/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=82/s reportFails=0 staleDrops=0 lateMax=0.1ms
21:42:27.487 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=987/s
21:42:27.487 ->   HID interval ms <2=19 2-4=36 4-8=17 8-16=1 >=16=9
21:42:27.487 ->   emit delta:    0=0 1=6 2-4=3 4-8=9 8-16=56 16-32=8 32-64=0 64-127=0
21:42:28.466 -> 📈 ESP smooth | UDP rawPkts=144/s datagrams=144/s subframes=144/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=135/s reportFails=0 staleDrops=0 lateMax=0.5ms
21:42:28.466 ->   net: wifi=connected ip=192.168.18.125 rssi=-29 mounted=yes | udpRx iters=981/s
21:42:28.466 ->   HID interval ms <2=41 2-4=56 4-8=24 8-16=4 >=16=10
21:42:28.466 ->   emit delta:    0=0 1=12 2-4=1 4-8=23 8-16=79 16-32=20 32-64=0 64-127=0
21:42:29.486 -> 📈 ESP smooth | UDP rawPkts=154/s datagrams=154/s subframes=154/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=154/s reportFails=0 staleDrops=0 lateMax=0.4ms
21:42:29.486 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 mounted=yes | udpRx iters=977/s
21:42:29.486 ->   HID interval ms <2=47 2-4=63 4-8=29 8-16=1 >=16=14
21:42:29.486 ->   emit delta:    0=0 1=0 2-4=4 4-8=31 8-16=118 16-32=1 32-64=0 64-127=0
21:42:30.476 -> 📈 ESP smooth | UDP rawPkts=36/s datagrams=36/s subframes=36/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=36/s reportFails=0 staleDrops=0 lateMax=0.5ms
21:42:30.476 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=989/s
21:42:30.476 ->   HID interval ms <2=8 2-4=22 4-8=2 8-16=0 >=16=4
21:42:30.476 ->   emit delta:    0=0 1=0 2-4=0 4-8=8 8-16=22 16-32=6 32-64=0 64-127=0
21:42:31.497 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.4ms
21:42:31.497 ->   net: wifi=connected ip=192.168.18.125 rssi=-30 mounted=yes | udpRx iters=1001/s
21:42:31.497 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
21:42:31.497 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
21:42:32.481 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.5ms
21:42:32.481 ->   net: wifi=connected ip=192.168.18.125 rssi=-31 mounted=yes | udpRx iters=1001/s
21:42:32.481 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
21:42:32.481 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

---

Logs for production code

log 1

📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=94 17-25ms=26 25-34ms=0 34-50ms=0 >=50ms=0 max=18.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=248 4-8ms=252 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=47 coalescedSamples=276 motionEvents=274
  touch dt: 0-4ms=0 4-8ms=270 8-12ms=1 12-20ms=0 20-33ms=1 33-50ms=1 >=50ms=1 max=145.8ms
  coalesced dt: 0-4ms=0 4-8ms=270 8-12ms=1 12-20ms=0 20-33ms=1 33-50ms=1 >=50ms=1 max=145.8ms
  pointer: events=274 emitted=274
  speed: 0-50=7 50-150=44 150-300=138 300-600=85 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=410.6
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=26 2.5-3=139 3-3.5=109 >=3.5=0 max=3.4
  emit delta: 0-1=1 1-2=0 2-4=0 4-8=8 8-16=12 16-32=53 32-64=211 64-127=237 >=127=8 max=137.3
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=31 17-25ms=11 25-34ms=20 34-50ms=8 >=50ms=4 max=80.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=256 subframes=256 capped=0 staleDrops=11 maxBatch=10 maxPending=985
  UDP sender: ticks=501 emitted=256 emptyWhileActive=40
  UDP timer dt: 0-4ms=252 4-8ms=249 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=242 8-12ms=3 12-17ms=2 17-25ms=6 25-34ms=0 34-50ms=0 >=50ms=0 max=20.6ms
  dropped movement: events=11 absDx=533 absDy=515
📈 Movement diagnostics
  touch: callbacks=70 coalescedSamples=480 motionEvents=480
  touch dt: 0-4ms=0 4-8ms=480 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  coalesced dt: 0-4ms=0 4-8ms=480 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=4.2ms
  pointer: events=480 emitted=480
  speed: 0-50=1 50-150=14 150-300=134 300-600=331 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=529.4
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=11 2.5-3=75 3-3.5=326 >=3.5=68 max=3.8
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=6 8-16=10 16-32=8 32-64=94 64-127=673 >=127=160 max=182.5
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=31 34-50ms=21 >=50ms=1 max=50.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=471 subframes=471 capped=0 staleDrops=8 maxBatch=11 maxPending=1313
  UDP sender: ticks=501 emitted=471 emptyWhileActive=26
  UDP timer dt: 0-4ms=242 4-8ms=259 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=455 8-12ms=5 12-17ms=7 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.0ms
  dropped movement: events=8 absDx=422 absDy=588
📈 Movement diagnostics
  touch: callbacks=65 coalescedSamples=419 motionEvents=417
  touch dt: 0-4ms=1 4-8ms=414 8-12ms=0 12-20ms=2 20-33ms=0 33-50ms=0 >=50ms=0 max=13.6ms
  coalesced dt: 0-4ms=1 4-8ms=414 8-12ms=0 12-20ms=2 20-33ms=0 33-50ms=0 >=50ms=0 max=13.6ms
  pointer: events=417 emitted=417
  speed: 0-50=0 50-150=4 150-300=117 300-600=296 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=536.8
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=89 3-3.5=259 >=3.5=69 max=3.8
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=6 32-64=113 64-127=517 >=127=186 max=212.9
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=1 17-25ms=1 25-34ms=29 34-50ms=18 >=50ms=4 max=60.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=405 subframes=405 capped=0 staleDrops=8 maxBatch=10 maxPending=1424
  UDP sender: ticks=500 emitted=405 emptyWhileActive=21
  UDP timer dt: 0-4ms=261 4-8ms=239 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=388 8-12ms=6 12-17ms=1 17-25ms=0 25-34ms=1 34-50ms=0 >=50ms=0 max=28.2ms
  dropped movement: events=8 absDx=668 absDy=1092
📈 Movement diagnostics
  touch: callbacks=41 coalescedSamples=187 motionEvents=184
  touch dt: 0-4ms=0 4-8ms=176 8-12ms=2 12-20ms=1 20-33ms=0 33-50ms=3 >=50ms=2 max=62.5ms
  coalesced dt: 0-4ms=0 4-8ms=176 8-12ms=2 12-20ms=1 20-33ms=0 33-50ms=3 >=50ms=2 max=62.5ms
  pointer: events=184 emitted=184
  speed: 0-50=14 50-150=23 150-300=40 300-600=107 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=530.1
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=30 2.5-3=41 3-3.5=53 >=3.5=60 max=3.8
  emit delta: 0-1=2 1-2=0 2-4=0 4-8=20 8-16=21 16-32=23 32-64=43 64-127=105 >=127=136 max=187
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=33 17-25ms=6 25-34ms=16 34-50ms=9 >=50ms=7 max=64.5ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=166 subframes=166 capped=0 staleDrops=10 maxBatch=11 maxPending=1396
  UDP sender: ticks=500 emitted=166 emptyWhileActive=60
  UDP timer dt: 0-4ms=256 4-8ms=244 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=150 8-12ms=1 12-17ms=4 17-25ms=6 25-34ms=1 34-50ms=0 >=50ms=0 max=32.2ms
  dropped movement: events=10 absDx=405 absDy=375
📈 Movement diagnostics
  touch: callbacks=41 coalescedSamples=193 motionEvents=189
  touch dt: 0-4ms=0 4-8ms=183 8-12ms=3 12-20ms=0 20-33ms=0 33-50ms=3 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=184 8-12ms=3 12-20ms=0 20-33ms=0 33-50ms=3 >=50ms=0 max=45.8ms
  pointer: events=189 emitted=189
  speed: 0-50=17 50-150=24 150-300=39 300-600=99 600-1000=10 1000-1600=0 1600-2400=0 >=2400=0 max=620.5
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=35 2.5-3=37 3-3.5=50 >=3.5=67 max=4.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=20 8-16=24 16-32=32 32-64=52 64-127=94 >=127=149 max=333.5
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=33 17-25ms=13 25-34ms=14 34-50ms=9 >=50ms=5 max=90.9ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=182 subframes=182 capped=0 staleDrops=5 maxBatch=9 maxPending=1683
  UDP sender: ticks=501 emitted=182 emptyWhileActive=38
  UDP timer dt: 0-4ms=256 4-8ms=245 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=169 8-12ms=2 12-17ms=1 17-25ms=5 25-34ms=1 34-50ms=0 >=50ms=0 max=31.8ms
  dropped movement: events=5 absDx=152 absDy=128
📈 Movement diagnostics
  touch: callbacks=48 coalescedSamples=246 motionEvents=241
  touch dt: 0-4ms=0 4-8ms=236 8-12ms=0 12-20ms=1 20-33ms=1 33-50ms=3 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=236 8-12ms=1 12-20ms=2 20-33ms=1 33-50ms=3 >=50ms=0 max=45.8ms
  pointer: events=241 emitted=241
  speed: 0-50=14 50-150=31 150-300=45 300-600=130 600-1000=21 1000-1600=0 1600-2400=0 >=2400=0 max=686.3
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=41 2.5-3=39 3-3.5=55 >=3.5=106 max=4.2
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=23 8-16=31 16-32=32 32-64=40 64-127=125 >=127=218 max=271.1
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=23 17-25ms=10 25-34ms=24 34-50ms=11 >=50ms=3 max=73.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=228 subframes=228 capped=0 staleDrops=2 maxBatch=8 maxPending=2031
  UDP sender: ticks=500 emitted=228 emptyWhileActive=47
  UDP timer dt: 0-4ms=230 4-8ms=270 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=212 8-12ms=3 12-17ms=3 17-25ms=5 25-34ms=1 34-50ms=0 >=50ms=0 max=27.9ms
  dropped movement: events=2 absDx=7 absDy=47
📈 Movement diagnostics
  touch: callbacks=42 coalescedSamples=210 motionEvents=206
  touch dt: 0-4ms=0 4-8ms=194 8-12ms=6 12-20ms=1 20-33ms=3 33-50ms=2 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=194 8-12ms=7 12-20ms=1 20-33ms=3 33-50ms=2 >=50ms=0 max=45.8ms
  pointer: events=206 emitted=206
  speed: 0-50=23 50-150=24 150-300=46 300-600=108 600-1000=5 1000-1600=0 1600-2400=0 >=2400=0 max=613.2
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=40 2.5-3=40 3-3.5=54 >=3.5=72 max=4.0
  emit delta: 0-1=5 1-2=0 2-4=0 4-8=31 8-16=16 16-32=28 32-64=41 64-127=120 >=127=149 max=224.6
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=22 17-25ms=8 25-34ms=24 34-50ms=10 >=50ms=5 max=64.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=184 subframes=184 capped=0 staleDrops=10 maxBatch=10 maxPending=1669
  UDP sender: ticks=501 emitted=184 emptyWhileActive=63
  UDP timer dt: 0-4ms=251 4-8ms=250 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=168 8-12ms=1 12-17ms=2 17-25ms=5 25-34ms=4 34-50ms=0 >=50ms=0 max=32.2ms
  dropped movement: events=10 absDx=818 absDy=894
📈 Movement diagnostics
  touch: callbacks=30 coalescedSamples=136 motionEvents=133
  touch dt: 0-4ms=0 4-8ms=130 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=2 >=50ms=1 max=54.2ms
  coalesced dt: 0-4ms=0 4-8ms=130 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=2 >=50ms=1 max=54.2ms
  pointer: events=133 emitted=133
  speed: 0-50=2 50-150=11 150-300=21 300-600=99 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=562.1
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=7 2.5-3=21 3-3.5=48 >=3.5=57 max=3.9
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=1 8-16=4 16-32=5 32-64=28 64-127=85 >=127=130 max=419.8
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=47 17-25ms=10 25-34ms=16 34-50ms=9 >=50ms=2 max=62.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=120 subframes=120 capped=0 staleDrops=3 maxBatch=9 maxPending=1336
  UDP sender: ticks=501 emitted=120 emptyWhileActive=25
  UDP timer dt: 0-4ms=239 4-8ms=262 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=110 8-12ms=1 12-17ms=1 17-25ms=3 25-34ms=1 34-50ms=0 >=50ms=0 max=32.1ms
  dropped movement: events=3 absDx=217 absDy=305
📈 Movement diagnostics
  touch: callbacks=28 coalescedSamples=143 motionEvents=140
  touch dt: 0-4ms=0 4-8ms=135 8-12ms=2 12-20ms=0 20-33ms=1 33-50ms=2 >=50ms=0 max=37.5ms
  coalesced dt: 0-4ms=0 4-8ms=135 8-12ms=2 12-20ms=1 20-33ms=1 33-50ms=2 >=50ms=0 max=37.5ms
  pointer: events=140 emitted=140
  speed: 0-50=4 50-150=20 150-300=30 300-600=86 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=575.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=19 2.5-3=30 3-3.5=57 >=3.5=34 max=3.9
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=10 8-16=12 16-32=19 32-64=33 64-127=116 >=127=80 max=210
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=43 17-25ms=13 25-34ms=18 34-50ms=9 >=50ms=2 max=59.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=130 subframes=130 capped=0 staleDrops=5 maxBatch=9 maxPending=1722
  UDP sender: ticks=500 emitted=130 emptyWhileActive=25
  UDP timer dt: 0-4ms=241 4-8ms=258 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=122 8-12ms=2 12-17ms=2 17-25ms=1 25-34ms=1 34-50ms=0 >=50ms=0 max=31.3ms
  dropped movement: events=5 absDx=33 absDy=275
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=99 17-25ms=21 25-34ms=0 34-50ms=0 >=50ms=0 max=18.0ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=239 4-8ms=261 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.2ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0


12:25:06.517 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:06.517 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
12:25:06.517 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:06.517 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:25:07.535 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:07.535 ->   net: wifi=connected ip=192.168.18.125 rssi=-25 mounted=yes | udpRx iters=1001/s
12:25:07.535 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:07.535 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:25:08.520 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:08.520 ->   net: wifi=connected ip=192.168.18.125 rssi=-25 mounted=yes | udpRx iters=1001/s
12:25:08.520 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:08.520 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:25:09.535 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:09.535 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
12:25:09.535 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:09.535 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:25:10.553 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:10.553 ->   net: wifi=connected ip=192.168.18.125 rssi=-25 mounted=yes | udpRx iters=1001/s
12:25:10.553 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:10.553 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:25:11.544 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:11.544 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=1001/s
12:25:11.544 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:11.544 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:25:12.528 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:12.528 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=1001/s
12:25:12.528 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:12.528 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:25:13.544 -> 📈 ESP smooth | UDP rawPkts=66/s datagrams=66/s subframes=66/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=66/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:13.544 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=989/s
12:25:13.544 ->   HID interval ms <2=21 2-4=33 4-8=3 8-16=3 >=16=6
12:25:13.544 ->   emit delta:    0=0 1=1 2-4=7 4-8=30 8-16=28 16-32=0 32-64=0 64-127=0
12:25:14.530 -> 📈 ESP smooth | UDP rawPkts=162/s datagrams=162/s subframes=162/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=156/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:14.530 ->   net: wifi=connected ip=192.168.18.125 rssi=-25 mounted=yes | udpRx iters=970/s
12:25:14.530 ->   HID interval ms <2=46 2-4=68 4-8=24 8-16=4 >=16=14
12:25:14.530 ->   emit delta:    0=0 1=5 2-4=10 4-8=49 8-16=89 16-32=3 32-64=0 64-127=0
12:25:15.554 -> 📈 ESP smooth | UDP rawPkts=174/s datagrams=174/s subframes=174/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=173/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:15.554 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=968/s
12:25:15.554 ->   HID interval ms <2=51 2-4=79 4-8=29 8-16=0 >=16=14
12:25:15.554 ->   emit delta:    0=0 1=0 2-4=0 4-8=3 8-16=135 16-32=35 32-64=0 64-127=0
12:25:16.542 -> 📈 ESP smooth | UDP rawPkts=169/s datagrams=169/s subframes=169/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=172/s reportFails=0 staleDrops=0 lateMax=0.4ms
12:25:16.542 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=975/s
12:25:16.542 ->   HID interval ms <2=52 2-4=74 4-8=29 8-16=4 >=16=13
12:25:16.542 ->   emit delta:    0=0 1=0 2-4=0 4-8=35 8-16=129 16-32=8 32-64=0 64-127=0
12:25:17.563 -> 📈 ESP smooth | UDP rawPkts=172/s datagrams=172/s subframes=172/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=169/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:17.563 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=974/s
12:25:17.563 ->   HID interval ms <2=54 2-4=65 4-8=31 8-16=3 >=16=16
12:25:17.563 ->   emit delta:    0=0 1=0 2-4=0 4-8=3 8-16=123 16-32=43 32-64=0 64-127=0
12:25:18.552 -> 📈 ESP smooth | UDP rawPkts=55/s datagrams=55/s subframes=55/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=56/s reportFails=0 staleDrops=0 lateMax=0.4ms
12:25:18.552 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=991/s
12:25:18.552 ->   HID interval ms <2=16 2-4=23 4-8=10 8-16=2 >=16=5
12:25:18.552 ->   emit delta:    0=0 1=4 2-4=6 4-8=16 8-16=9 16-32=21 32-64=0 64-127=0
12:25:19.570 -> 📈 ESP smooth | UDP rawPkts=97/s datagrams=97/s subframes=97/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=95/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:19.570 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=989/s
12:25:19.570 ->   HID interval ms <2=13 2-4=39 4-8=31 8-16=1 >=16=11
12:25:19.570 ->   emit delta:    0=0 1=5 2-4=6 4-8=11 8-16=37 16-32=36 32-64=0 64-127=0
12:25:20.555 -> 📈 ESP smooth | UDP rawPkts=57/s datagrams=57/s subframes=57/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=57/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:20.555 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=995/s
12:25:20.555 ->   HID interval ms <2=5 2-4=25 4-8=20 8-16=3 >=16=4
12:25:20.555 ->   emit delta:    0=0 1=7 2-4=9 4-8=9 8-16=12 16-32=20 32-64=0 64-127=0
12:25:21.574 -> 📈 ESP smooth | UDP rawPkts=92/s datagrams=92/s subframes=92/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=92/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:21.574 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=989/s
12:25:21.574 ->   HID interval ms <2=17 2-4=33 4-8=33 8-16=2 >=16=7
12:25:21.574 ->   emit delta:    0=0 1=0 2-4=2 4-8=14 8-16=36 16-32=39 32-64=1 64-127=0
12:25:22.557 -> 📈 ESP smooth | UDP rawPkts=81/s datagrams=81/s subframes=81/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=81/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:22.557 ->   net: wifi=connected ip=192.168.18.125 rssi=-25 mounted=yes | udpRx iters=990/s
12:25:22.557 ->   HID interval ms <2=14 2-4=32 4-8=25 8-16=4 >=16=6
12:25:22.557 ->   emit delta:    0=0 1=12 2-4=3 4-8=16 8-16=30 16-32=20 32-64=0 64-127=0
12:25:23.575 -> 📈 ESP smooth | UDP rawPkts=115/s datagrams=115/s subframes=115/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=112/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:23.575 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=987/s
12:25:23.575 ->   HID interval ms <2=23 2-4=41 4-8=32 8-16=2 >=16=14
12:25:23.575 ->   emit delta:    0=0 1=8 2-4=11 4-8=10 8-16=32 16-32=51 32-64=0 64-127=0
12:25:24.558 -> 📈 ESP smooth | UDP rawPkts=80/s datagrams=80/s subframes=80/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=81/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:24.558 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=991/s
12:25:24.558 ->   HID interval ms <2=23 2-4=32 4-8=14 8-16=2 >=16=10
12:25:24.558 ->   emit delta:    0=0 1=3 2-4=6 4-8=14 8-16=25 16-32=30 32-64=3 64-127=0
12:25:25.575 -> 📈 ESP smooth | UDP rawPkts=88/s datagrams=88/s subframes=88/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=85/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:25.575 ->   net: wifi=connected ip=192.168.18.125 rssi=-25 mounted=yes | udpRx iters=985/s
12:25:25.575 ->   HID interval ms <2=17 2-4=36 4-8=15 8-16=1 >=16=16
12:25:25.575 ->   emit delta:    0=0 1=8 2-4=0 4-8=7 8-16=29 16-32=41 32-64=0 64-127=0
12:25:26.556 -> 📈 ESP smooth | UDP rawPkts=60/s datagrams=60/s subframes=60/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s reports=58/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:26.556 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=989/s
12:25:26.556 ->   HID interval ms <2=15 2-4=32 4-8=3 8-16=2 >=16=6
12:25:26.556 ->   emit delta:    0=0 1=0 2-4=1 4-8=6 8-16=21 16-32=30 32-64=0 64-127=0
12:25:27.573 -> 📈 ESP smooth | UDP rawPkts=16/s datagrams=16/s subframes=16/s malformed=0 queueMax=3 overflow=0 | HID ticks=500/s reports=15/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:27.573 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=1001/s
12:25:27.573 ->   HID interval ms <2=2 2-4=2 4-8=9 8-16=0 >=16=2
12:25:27.573 ->   emit delta:    0=0 1=0 2-4=0 4-8=5 8-16=8 16-32=2 32-64=0 64-127=0
12:25:28.590 -> 📈 ESP smooth | UDP rawPkts=96/s datagrams=96/s subframes=96/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=97/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:28.590 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=990/s
12:25:28.590 ->   HID interval ms <2=21 2-4=41 4-8=23 8-16=6 >=16=6
12:25:28.590 ->   emit delta:    0=0 1=1 2-4=4 4-8=10 8-16=53 16-32=29 32-64=0 64-127=0
12:25:29.575 -> 📈 ESP smooth | UDP rawPkts=24/s datagrams=24/s subframes=24/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s reports=24/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:29.575 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=995/s
12:25:29.575 ->   HID interval ms <2=4 2-4=12 4-8=3 8-16=0 >=16=5
12:25:29.575 ->   emit delta:    0=0 1=0 2-4=0 4-8=3 8-16=5 16-32=16 32-64=0 64-127=0
12:25:30.591 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:30.591 ->   net: wifi=connected ip=192.168.18.125 rssi=-28 mounted=yes | udpRx iters=1001/s
12:25:30.591 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:30.591 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:25:31.574 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:31.574 ->   net: wifi=connected ip=192.168.18.125 rssi=-25 mounted=yes | udpRx iters=1001/s
12:25:31.574 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:31.574 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:25:32.589 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:32.589 ->   net: wifi=connected ip=192.168.18.125 rssi=-24 mounted=yes | udpRx iters=1001/s
12:25:32.589 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:32.589 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:25:33.600 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:33.600 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1001/s
12:25:33.600 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:33.600 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:25:34.585 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:34.585 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=1001/s
12:25:34.585 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:34.585 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:25:35.603 -> 📈 ESP smooth | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s reports=0/s reportFails=0 staleDrops=0 lateMax=0.3ms
12:25:35.603 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=1001/s
12:25:35.603 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:25:35.603 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

log 2

📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=1 8-12ms=0 12-17ms=111 17-25ms=0 25-34ms=0 34-50ms=1 >=50ms=2 max=1053.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=236 4-8ms=264 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
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
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=120 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=501 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=249 4-8ms=252 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
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
  UDP timer dt: 0-4ms=243 4-8ms=257 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0
📈 Movement diagnostics
  touch: callbacks=42 coalescedSamples=218 motionEvents=211
  touch dt: 0-4ms=0 4-8ms=205 8-12ms=0 12-20ms=2 20-33ms=2 33-50ms=2 >=50ms=0 max=43.9ms
  coalesced dt: 0-4ms=0 4-8ms=206 8-12ms=0 12-20ms=2 20-33ms=2 33-50ms=2 >=50ms=0 max=43.9ms
  pointer: events=211 emitted=211
  speed: 0-50=3 50-150=53 150-300=66 300-600=85 600-1000=4 1000-1600=0 1600-2400=0 >=2400=0 max=632.2
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=44 2.5-3=59 3-3.5=57 >=3.5=51 max=4.1
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=42 16-32=66 32-64=70 64-127=123 >=127=109 max=356.4
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=4 8-12ms=0 12-17ms=43 17-25ms=4 25-34ms=20 34-50ms=10 >=50ms=3 max=68.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=199 subframes=199 capped=0 staleDrops=10 maxBatch=11 maxPending=1517
  UDP sender: ticks=500 emitted=199 emptyWhileActive=40
  UDP timer dt: 0-4ms=246 4-8ms=253 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=187 8-12ms=2 12-17ms=1 17-25ms=1 25-34ms=1 34-50ms=0 >=50ms=0 max=27.6ms
  dropped movement: events=10 absDx=441 absDy=392
📈 Movement diagnostics
  touch: callbacks=53 coalescedSamples=293 motionEvents=292
  touch dt: 0-4ms=0 4-8ms=289 8-12ms=0 12-20ms=0 20-33ms=2 33-50ms=1 >=50ms=0 max=35.3ms
  coalesced dt: 0-4ms=0 4-8ms=289 8-12ms=0 12-20ms=0 20-33ms=2 33-50ms=1 >=50ms=0 max=35.3ms
  pointer: events=292 emitted=292
  speed: 0-50=4 50-150=26 150-300=61 300-600=137 600-1000=64 1000-1600=0 1600-2400=0 >=2400=0 max=841.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=22 2.5-3=56 3-3.5=92 >=3.5=122 max=4.7
  emit delta: 0-1=1 1-2=0 2-4=0 4-8=7 8-16=16 16-32=34 32-64=68 64-127=171 >=127=275 max=366.9
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=26 17-25ms=3 25-34ms=26 34-50ms=13 >=50ms=3 max=66.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=280 subframes=280 capped=0 staleDrops=5 maxBatch=9 maxPending=2574
  UDP sender: ticks=500 emitted=280 emptyWhileActive=21
  UDP timer dt: 0-4ms=260 4-8ms=241 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=269 8-12ms=7 12-17ms=1 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=12.3ms
  dropped movement: events=5 absDx=238 absDy=373
📈 Movement diagnostics
  touch: callbacks=51 coalescedSamples=284 motionEvents=281
  touch dt: 0-4ms=0 4-8ms=278 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=2 >=50ms=1 max=60.1ms
  coalesced dt: 0-4ms=0 4-8ms=278 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=2 >=50ms=1 max=60.1ms
  pointer: events=281 emitted=281
  speed: 0-50=7 50-150=27 150-300=87 300-600=123 600-1000=37 1000-1600=0 1600-2400=0 >=2400=0 max=927.0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=27 2.5-3=83 3-3.5=90 >=3.5=81 max=4.9
  emit delta: 0-1=1 1-2=0 2-4=0 4-8=9 8-16=22 16-32=30 32-64=138 64-127=177 >=127=172 max=445.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=4 8-12ms=0 12-17ms=24 17-25ms=3 25-34ms=23 34-50ms=16 >=50ms=3 max=55.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=268 subframes=268 capped=0 staleDrops=10 maxBatch=10 maxPending=2875
  UDP sender: ticks=500 emitted=268 emptyWhileActive=34
  UDP timer dt: 0-4ms=262 4-8ms=238 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=254 8-12ms=4 12-17ms=5 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=16.1ms
  dropped movement: events=10 absDx=688 absDy=188
📈 Movement diagnostics
  touch: callbacks=56 coalescedSamples=298 motionEvents=294
  touch dt: 0-4ms=0 4-8ms=281 8-12ms=7 12-20ms=3 20-33ms=2 33-50ms=1 >=50ms=0 max=37.5ms
  coalesced dt: 0-4ms=0 4-8ms=281 8-12ms=8 12-20ms=3 20-33ms=2 33-50ms=1 >=50ms=0 max=37.5ms
  pointer: events=294 emitted=294
  speed: 0-50=18 50-150=84 150-300=76 300-600=80 600-1000=32 1000-1600=4 1600-2400=0 >=2400=0 max=1049.7
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=90 2.5-3=65 3-3.5=67 >=3.5=72 max=5.3
  emit delta: 0-1=3 1-2=0 2-4=0 4-8=40 8-16=74 16-32=81 32-64=90 64-127=136 >=127=151 max=546.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=4 8-12ms=0 12-17ms=17 17-25ms=3 25-34ms=25 34-50ms=16 >=50ms=4 max=68.4ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=281 subframes=281 capped=0 staleDrops=14 maxBatch=10 maxPending=3084
  UDP sender: ticks=501 emitted=281 emptyWhileActive=58
  UDP timer dt: 0-4ms=239 4-8ms=262 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=265 8-12ms=2 12-17ms=4 17-25ms=3 25-34ms=0 34-50ms=0 >=50ms=0 max=20.1ms
  dropped movement: events=14 absDx=466 absDy=650
📈 Movement diagnostics
  touch: callbacks=66 coalescedSamples=363 motionEvents=360
  touch dt: 0-4ms=0 4-8ms=339 8-12ms=17 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=2 max=70.8ms
  coalesced dt: 0-4ms=0 4-8ms=340 8-12ms=17 12-20ms=1 20-33ms=0 33-50ms=1 >=50ms=2 max=70.8ms
  pointer: events=360 emitted=360
  speed: 0-50=55 50-150=213 150-300=58 300-600=27 600-1000=7 1000-1600=0 1600-2400=0 >=2400=0 max=909.2
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=218 2.5-3=100 3-3.5=33 >=3.5=9 max=4.9
  emit delta: 0-1=3 1-2=0 2-4=0 4-8=78 8-16=179 16-32=242 32-64=117 64-127=68 >=127=18 max=496.0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=18 17-25ms=2 25-34ms=35 34-50ms=13 >=50ms=1 max=56.3ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=345 subframes=345 capped=0 staleDrops=6 maxBatch=9 maxPending=1089
  UDP sender: ticks=501 emitted=345 emptyWhileActive=67
  UDP timer dt: 0-4ms=250 4-8ms=251 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=323 8-12ms=4 12-17ms=10 17-25ms=3 25-34ms=2 34-50ms=0 >=50ms=0 max=32.2ms
  dropped movement: events=6 absDx=108 absDy=144
📈 Movement diagnostics
  touch: callbacks=65 coalescedSamples=353 motionEvents=347
  touch dt: 0-4ms=0 4-8ms=332 8-12ms=11 12-20ms=2 20-33ms=1 33-50ms=0 >=50ms=1 max=54.2ms
  coalesced dt: 0-4ms=0 4-8ms=333 8-12ms=12 12-20ms=4 20-33ms=1 33-50ms=0 >=50ms=1 max=54.2ms
  pointer: events=347 emitted=347
  speed: 0-50=58 50-150=176 150-300=55 300-600=58 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=512.1
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=206 2.5-3=66 3-3.5=59 >=3.5=16 max=3.7
  emit delta: 0-1=3 1-2=0 2-4=0 4-8=96 8-16=155 16-32=198 32-64=70 64-127=118 >=127=46 max=252.7
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=11 17-25ms=2 25-34ms=27 34-50ms=20 >=50ms=2 max=56.2ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=339 subframes=339 capped=0 staleDrops=8 maxBatch=10 maxPending=911
  UDP sender: ticks=500 emitted=339 emptyWhileActive=56
  UDP timer dt: 0-4ms=242 4-8ms=258 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=319 8-12ms=4 12-17ms=10 17-25ms=4 25-34ms=0 34-50ms=0 >=50ms=0 max=24.0ms
  dropped movement: events=8 absDx=157 absDy=70
📈 Movement diagnostics
  touch: callbacks=42 coalescedSamples=217 motionEvents=212
  touch dt: 0-4ms=1 4-8ms=197 8-12ms=8 12-20ms=2 20-33ms=2 33-50ms=1 >=50ms=1 max=87.5ms
  coalesced dt: 0-4ms=1 4-8ms=197 8-12ms=9 12-20ms=3 20-33ms=2 33-50ms=1 >=50ms=1 max=87.5ms
  pointer: events=212 emitted=212
  speed: 0-50=27 50-150=45 150-300=50 300-600=64 600-1000=26 1000-1600=0 1600-2400=0 >=2400=0 max=863.8
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=60 2.5-3=54 3-3.5=39 >=3.5=59 max=4.7
  emit delta: 0-1=4 1-2=0 2-4=0 4-8=45 8-16=25 16-32=56 32-64=73 64-127=75 >=127=131 max=385.9
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=30 17-25ms=6 25-34ms=19 34-50ms=13 >=50ms=5 max=67.8ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=197 subframes=197 capped=0 staleDrops=6 maxBatch=9 maxPending=2029
  UDP sender: ticks=500 emitted=197 emptyWhileActive=53
  UDP timer dt: 0-4ms=239 4-8ms=261 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=181 8-12ms=4 12-17ms=5 17-25ms=2 25-34ms=1 34-50ms=0 >=50ms=0 max=31.8ms
  dropped movement: events=6 absDx=486 absDy=779
📈 Movement diagnostics
  touch: callbacks=62 coalescedSamples=365 motionEvents=363
  touch dt: 0-4ms=0 4-8ms=358 8-12ms=3 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=1 max=54.2ms
  coalesced dt: 0-4ms=0 4-8ms=358 8-12ms=3 12-20ms=0 20-33ms=0 33-50ms=1 >=50ms=1 max=54.2ms
  pointer: events=363 emitted=363
  speed: 0-50=3 50-150=18 150-300=91 300-600=163 600-1000=84 1000-1600=4 1600-2400=0 >=2400=0 max=1065.4
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=17 2.5-3=75 3-3.5=102 >=3.5=169 max=5.3
  emit delta: 0-1=1 1-2=0 2-4=0 4-8=7 8-16=7 16-32=23 32-64=121 64-127=203 >=127=341 max=568.2
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=14 17-25ms=5 25-34ms=23 34-50ms=9 >=50ms=9 max=73.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=340 subframes=340 capped=0 staleDrops=17 maxBatch=10 maxPending=3662
  UDP sender: ticks=501 emitted=340 emptyWhileActive=48
  UDP timer dt: 0-4ms=239 4-8ms=262 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=323 8-12ms=3 12-17ms=8 17-25ms=3 25-34ms=1 34-50ms=0 >=50ms=0 max=28.5ms
  dropped movement: events=17 absDx=1617 absDy=1954
📈 Movement diagnostics
  touch: callbacks=20 coalescedSamples=104 motionEvents=102
  touch dt: 0-4ms=0 4-8ms=100 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=1 >=50ms=0 max=45.8ms
  coalesced dt: 0-4ms=0 4-8ms=100 8-12ms=0 12-20ms=0 20-33ms=1 33-50ms=1 >=50ms=0 max=45.8ms
  pointer: events=102 emitted=102
  speed: 0-50=1 50-150=17 150-300=32 300-600=24 600-1000=23 1000-1600=5 1600-2400=0 >=2400=0 max=1084.5
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=8 2.5-3=37 3-3.5=18 >=3.5=39 max=5.4
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=2 8-16=5 16-32=17 32-64=46 64-127=39 >=127=82 max=542.7
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=72 17-25ms=15 25-34ms=13 34-50ms=1 >=50ms=2 max=71.7ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=89 subframes=89 capped=0 staleDrops=4 maxBatch=10 maxPending=2484
  UDP sender: ticks=501 emitted=89 emptyWhileActive=27
  UDP timer dt: 0-4ms=251 4-8ms=250 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.0ms
  UDP send dt: 0-8ms=81 8-12ms=0 12-17ms=1 17-25ms=4 25-34ms=1 34-50ms=0 >=50ms=0 max=28.0ms
  dropped movement: events=4 absDx=277 absDy=165
📈 Movement diagnostics
  touch: callbacks=0 coalescedSamples=0 motionEvents=0
  touch dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  coalesced dt: 0-4ms=0 4-8ms=0 8-12ms=0 12-20ms=0 20-33ms=0 33-50ms=0 >=50ms=0 max=0ms
  pointer: events=0 emitted=0
  speed: 0-50=0 50-150=0 150-300=0 300-600=0 600-1000=0 1000-1600=0 1600-2400=0 >=2400=0 max=0
  gain: 0-1.1=0 1.1-1.5=0 1.5-2=0 2-2.5=0 2.5-3=0 3-3.5=0 >=3.5=0 max=0
  emit delta: 0-1=0 1-2=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0 >=127=0 max=0
  BLE: attempts=0 sent=0 blocked=0 readyCb=0 longestBlock=0.0ms
  BLE tick dt: 0-8ms=0 8-12ms=0 12-17ms=103 17-25ms=17 25-34ms=0 34-50ms=0 >=50ms=0 max=17.6ms
  BLE send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  UDP: datagrams=0 subframes=0 capped=0 staleDrops=0 maxBatch=0 maxPending=0
  UDP sender: ticks=500 emitted=0 emptyWhileActive=0
  UDP timer dt: 0-4ms=257 4-8ms=243 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=5.1ms
  UDP send dt: 0-8ms=0 8-12ms=0 12-17ms=0 17-25ms=0 25-34ms=0 34-50ms=0 >=50ms=0 max=0ms
  dropped movement: events=0 absDx=0 absDy=0


12:02:35.924 -> .
12:02:35.924 -> ✅ UDP motion listening on 192.168.18.125:4210
12:02:35.924 -> 🎯 ESP_Bridge_Production ready
12:02:35.924 -> 🚦 udp-rx task running on core 0
12:02:36.941 -> 📈 ESP production | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=1652/s mouseReports=0/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:36.941 ->   net: wifi=connected ip=192.168.18.125 rssi=-27 mounted=yes | udpRx iters=1002/s
12:02:36.941 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:02:36.941 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:02:37.928 -> 📈 ESP production | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s mouseReports=0/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.4ms
12:02:37.928 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=1001/s
12:02:37.928 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:02:37.928 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0
12:02:38.948 -> 📈 ESP production | UDP rawPkts=61/s datagrams=61/s subframes=61/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s mouseReports=61/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.4ms
12:02:38.948 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=987/s
12:02:38.948 ->   HID interval ms <2=8 2-4=40 4-8=7 8-16=0 >=16=5
12:02:38.948 ->   emit delta:    0=0 1=6 2-4=20 4-8=28 8-16=6 16-32=1 32-64=0 64-127=0
12:02:39.932 -> 📈 ESP production | UDP rawPkts=54/s datagrams=54/s subframes=54/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s mouseReports=54/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.4ms
12:02:39.932 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=990/s
12:02:39.932 ->   HID interval ms <2=6 2-4=31 4-8=7 8-16=3 >=16=7
12:02:39.932 ->   emit delta:    0=0 1=1 2-4=13 4-8=7 8-16=14 16-32=18 32-64=1 64-127=0
12:02:40.950 -> 📈 ESP production | UDP rawPkts=72/s datagrams=72/s subframes=72/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s mouseReports=72/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:40.950 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=990/s
12:02:40.950 ->   HID interval ms <2=4 2-4=45 4-8=12 8-16=1 >=16=10
12:02:40.950 ->   emit delta:    0=0 1=0 2-4=2 4-8=7 8-16=26 16-32=29 32-64=8 64-127=0
12:02:41.938 -> 📈 ESP production | UDP rawPkts=120/s datagrams=120/s subframes=120/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s mouseReports=120/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:41.938 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=985/s
12:02:41.938 ->   HID interval ms <2=15 2-4=70 4-8=22 8-16=3 >=16=10
12:02:41.938 ->   emit delta:    0=0 1=1 2-4=5 4-8=15 8-16=39 16-32=44 32-64=16 64-127=0
12:02:42.925 -> 📈 ESP production | UDP rawPkts=189/s datagrams=189/s subframes=189/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s mouseReports=189/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:42.957 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=969/s
12:02:42.957 ->   HID interval ms <2=19 2-4=123 4-8=27 8-16=6 >=16=14
12:02:42.957 ->   emit delta:    0=0 1=0 2-4=4 4-8=59 8-16=89 16-32=34 32-64=3 64-127=0
12:02:43.945 -> 📈 ESP production | UDP rawPkts=73/s datagrams=73/s subframes=73/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s mouseReports=73/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:43.945 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=991/s
12:02:43.945 ->   HID interval ms <2=6 2-4=44 4-8=11 8-16=2 >=16=10
12:02:43.945 ->   emit delta:    0=0 1=7 2-4=5 4-8=5 8-16=23 16-32=17 32-64=16 64-127=0
12:02:44.929 -> 📈 ESP production | UDP rawPkts=88/s datagrams=88/s subframes=88/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s mouseReports=87/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:44.929 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=983/s
12:02:44.929 ->   HID interval ms <2=7 2-4=54 4-8=13 8-16=2 >=16=11
12:02:44.929 ->   emit delta:    0=0 1=12 2-4=14 4-8=16 8-16=19 16-32=25 32-64=1 64-127=0
12:02:45.947 -> 📈 ESP production | UDP rawPkts=108/s datagrams=108/s subframes=108/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s mouseReports=108/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:45.947 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=989/s
12:02:45.947 ->   HID interval ms <2=14 2-4=65 4-8=13 8-16=2 >=16=14
12:02:45.947 ->   emit delta:    0=0 1=4 2-4=14 4-8=25 8-16=39 16-32=11 32-64=15 64-127=0
12:02:46.934 -> 📈 ESP production | UDP rawPkts=137/s datagrams=137/s subframes=137/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s mouseReports=131/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:46.967 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=983/s
12:02:46.967 ->   HID interval ms <2=12 2-4=79 4-8=22 8-16=4 >=16=14
12:02:46.967 ->   emit delta:    0=0 1=19 2-4=37 4-8=47 8-16=20 16-32=3 32-64=5 64-127=0
12:02:47.957 -> 📈 ESP production | UDP rawPkts=146/s datagrams=146/s subframes=146/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s mouseReports=139/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.4ms
12:02:47.957 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=980/s
12:02:47.957 ->   HID interval ms <2=11 2-4=82 4-8=27 8-16=5 >=16=14
12:02:47.957 ->   emit delta:    0=0 1=41 2-4=58 4-8=24 8-16=15 16-32=1 32-64=0 64-127=0
12:02:48.943 -> 📈 ESP production | UDP rawPkts=121/s datagrams=121/s subframes=121/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s mouseReports=107/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:48.943 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=983/s
12:02:48.943 ->   HID interval ms <2=15 2-4=53 4-8=25 8-16=4 >=16=10
12:02:48.943 ->   emit delta:    0=0 1=47 2-4=31 4-8=1 8-16=14 16-32=14 32-64=0 64-127=0
12:02:49.964 -> 📈 ESP production | UDP rawPkts=150/s datagrams=150/s subframes=150/s malformed=0 queueMax=7 overflow=0 | HID ticks=500/s mouseReports=148/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:49.964 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=976/s
12:02:49.964 ->   HID interval ms <2=19 2-4=90 4-8=24 8-16=3 >=16=12
12:02:49.964 ->   emit delta:    0=0 1=17 2-4=63 4-8=34 8-16=31 16-32=3 32-64=0 64-127=0
12:02:50.953 -> 📈 ESP production | UDP rawPkts=120/s datagrams=120/s subframes=120/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s mouseReports=113/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.4ms
12:02:50.953 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=985/s
12:02:50.953 ->   HID interval ms <2=16 2-4=56 4-8=25 8-16=4 >=16=12
12:02:50.953 ->   emit delta:    0=0 1=20 2-4=23 4-8=30 8-16=23 16-32=17 32-64=0 64-127=0
12:02:51.974 -> 📈 ESP production | UDP rawPkts=72/s datagrams=72/s subframes=72/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s mouseReports=69/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.4ms
12:02:51.974 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=992/s
12:02:51.974 ->   HID interval ms <2=10 2-4=34 4-8=12 8-16=3 >=16=10
12:02:51.974 ->   emit delta:    0=0 1=1 2-4=11 4-8=11 8-16=19 16-32=23 32-64=4 64-127=0
12:02:52.955 -> 📈 ESP production | UDP rawPkts=80/s datagrams=80/s subframes=80/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s mouseReports=82/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:52.955 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=988/s
12:02:52.955 ->   HID interval ms <2=18 2-4=39 4-8=16 8-16=0 >=16=9
12:02:52.955 ->   emit delta:    0=0 1=3 2-4=5 4-8=11 8-16=21 16-32=22 32-64=19 64-127=1
12:02:53.949 -> 📈 ESP production | UDP rawPkts=176/s datagrams=176/s subframes=176/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s mouseReports=176/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:53.949 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=979/s
12:02:53.949 ->   HID interval ms <2=33 2-4=91 4-8=36 8-16=2 >=16=14
12:02:53.949 ->   emit delta:    0=0 1=0 2-4=1 4-8=20 8-16=61 16-32=78 32-64=16 64-127=0
12:02:54.971 -> 📈 ESP production | UDP rawPkts=111/s datagrams=111/s subframes=111/s malformed=0 queueMax=6 overflow=0 | HID ticks=500/s mouseReports=110/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:54.971 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=987/s
12:02:54.971 ->   HID interval ms <2=20 2-4=59 4-8=13 8-16=3 >=16=15
12:02:54.971 ->   emit delta:    0=0 1=0 2-4=5 4-8=39 8-16=24 16-32=22 32-64=20 64-127=0
12:02:55.956 -> 📈 ESP production | UDP rawPkts=0/s datagrams=0/s subframes=0/s malformed=0 queueMax=0 overflow=0 | HID ticks=500/s mouseReports=0/s keyboardReports=0/s reportFails=0 staleDrops=0 releaseAll=0 lateMax=0.5ms
12:02:55.956 ->   net: wifi=connected ip=192.168.18.125 rssi=-26 mounted=yes | udpRx iters=1001/s
12:02:55.956 ->   HID interval ms <2=0 2-4=0 4-8=0 8-16=0 >=16=0
12:02:55.956 ->   emit delta:    0=0 1=0 2-4=0 4-8=0 8-16=0 16-32=0 32-64=0 64-127=0

---

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
