---
layout: post
title: "Strava Analysis"
date: 2017-05-16 11:31
comments: true
categories: 
---
It's always interesting to look at Strava and work out what you've done when. The Training Log
and Training Calendar are good, but if you want to see how much vert you've done in the last month
or what you've done in the last 12 months, it's a bit more difficult to see.

I've had some scripts that download my data from Strava, and then perform some rudimentary summaries,
such as see distance, duration and elevation for every month, or last year. I've finally put it online,
along with some details on calculating your [Eddington Number](https://en.wikipedia.org/wiki/Arthur_Eddington#Eddington_number_for_cycling).

It does rely on setting up an API key in Strava, and having a working python implementation - neither
of those are insurmountable for the averagely technical person with their own computer.

Source code and instructions are at [https://github.com/willthames/strava_activities](https://github.com/willthames/strava_activities)

My Eddington run numbers are currently:

```
$ python eddington.py data type=run
km: 33
mi: 24
```

That should increase to 34 and 25 after the weekend.
