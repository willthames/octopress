---
layout: post
title: "Training Log Data"
date: 2012-10-30 21:18
comments: true
categories: tech
---
I've really wanted to be able to take more control of my data for years.
In recent months this has become more concrete and I've focussed all the
time I have to dedicate to coding to just working on the visualisation of
my training data. 

I've strived to favour shipping over perfection - various choices that I've 
made have been short-term so that I can get *something* out there. At 
present I have to manually run a script that takes binary formatted data from
my watch and turns it into JSON. <a href="http://octopress.org">Octopress</a>
can do the rest, with the help of a plugin I wrote to generate the three
types of 'pages' that power the training log: the training log entry itself,
the data behind that training log entry, and the index of all training logs. 

I have made incredibly heavy use of other people's work. For dynamic 
visualisation, <a href="https://github.com/mbostock/d3">d3</a> is pretty 
much the best thing out there - it does all kinds of graphs, tables, maps and
much more. For mapping, I used <a href="http://leafletjs.com/">Leaflet</a>, 
backed by the tiles of <a href="http://cloudmade.com">CloudMade</a>, which
rely on the data of <a href="http://openstreetmap.org">OpenStreetMap</a>. 

To be honest, the results aren't much different to what I currently get from
<a href="http://connect.garmin.com">Garmin Connect</a>, but this is just the
first step. 

There are bugs. If the training data doesn't show first time, just refresh. 
I think that's a fairly normal Javascript script loading ordering problem, 
that I haven't fixed over shipping (and writing this page). The time x-axis
is currently in seconds (I'd rather have 1:00 than 3600 but I haven't yet
worked that one out). 

Other things on my list include publishing the script I use to convert 
Garmin FIT data to JSON, based on the 
<a href="https://github.com/dtcooper/python-fitparse">fitparse library</a>,
plotting lap markers, having lap popups. It's quite exciting, the 
possibilities are endless. Oh, and the <a href="/training">training log</a>
index needs some styling applied. But at least it has some entries. The most
recent <a href="/training/2012/10/29/bridge-and-back/">training entry</a>
seems to have a duration of 4.5 hours. I know why it thinks that (it's
rendering the data I present it correctly, and the start time is correct
so what I think is the end time might be something else). Hopefully that'll 
be fixed soon. 
