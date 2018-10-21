# Path Determiner

## Introduction
This project determines path and estimates time for each location between two coordinates

## Installation
In order to run the application you need to install [ruby-2.4.1](https://www.ruby-lang.org/en/documentation/installation/).
After installing ruby, go to root directory of project and run command
```
  bundle install
``` 
it will install third party dependencies.


## How to run the application
To start the application go to root path of project and run command.
```
  ruby main.rb [<SourceLat>,<SourceLng>] [<DestLat>,<DestLng>] MIN_DISTANCE, GOOGLE_KEY  
```
  MIN_DISTANCE is min distance between each plots. It is optional with default value 50
  GOOGLE_KEY is key for fetching info from google directions api

###Example:
```
  ruby main.rb  "28.619803,77.203831" "24.801855,73.765804"
```
will give output
```
[28.61954],[77.20397] ==>  0
[28.61954],[77.20397] ==>  4
[28.61954],[77.20397] ==>  8
[28.620260000000002],[77.20572] ==>  12
[28.620980000000003],[77.20747] ==>  16
[28.620260000000002],[77.20572] ==>  20
[28.620340000000002],[77.20591] ==>  24
[28.62034],[77.20591] ==>  29
[28.62034],[77.20591] ==>  31
[28.620369999999998],[77.20588000000001] ==>  33
[28.620379999999997],[77.20588000000001] ==>  36
[28.620409999999996],[77.20587] ==>  38
[28.620419999999996],[77.20586] ==>  41

........................................
........................................
........................................
........................................

[24.800109999999997],[73.76836999999999] ==>  36346
[24.800099999999997],[73.76803] ==>  36349
[24.800109999999997],[73.76791999999999] ==>  36353
[24.800159999999998],[73.76774999999999] ==>  36356
[24.80021],[73.76760999999999] ==>  36359
[24.80014],[73.76736999999999] ==>  36363
[24.79995],[73.76701999999999] ==>  36366
```

This is plot between New Delhi and Udaipur

