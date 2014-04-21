---
layout: post
title: "Ninth time&rsquo;s a charm &mdash; a marathon on Camp Mountain"
date: 2014-04-20 10:00
comments: true
uses_d3: true
categories: 
---
It was around Monday that I first considered doing the Camp Mountain marathon 
on Easter Saturday. We had already planned a family gathering for Saturday lunch
time, but I just needed to make pudding, turn up, eat and drink &mdash; and I could
make the pudding on Good Friday. 

I put the word out on Facebook to see if anyone was interested in coming along
or doing a more interesting run - the reason for choosing to do 8 circuits of
Camp Mountain was that it's quite a safe trial run - you're never really more than
2.5kms away from the car, there are people on it (although not as many as I 
thought - I saw one walker, one group of three mountain bikers and one solo
mountain biker!). No-one was up for it but my public statement also makes it 
harder not to do it!

One of the objects of doing the run was a backpack trial - this was the first
time I've used my backpack with the full mandatory North Face race kit. I was
pleased to find that excluding water, the kit only weighs 2kg, with water, that
can go up to 5kg - but I don't plan to carry more than 2 litres of water at any
time.

{% fancybox backpack /images/elska_tnf_kit.jpg "Elska examines mandatory kit" %}
{% fancybox backpack /images/backpack.jpg "The packed backpack" %}

After a quick breakfast and coffee, I drove over to Camp Mountain
and got ready to go, setting off on my run at about 5:55am, with the sun
not yet visible behind the hills. 

I knew that the day was going to be quite warm - up to 28&deg;C at the hottest
point of the day, and I didn't want to blow up, and so my aim was to start
gently and ease into it. Each part of the lap, if I thought I might need
to walk it in 7 laps time, I walked on the first lap. Which meant I pretty
much walked the first 1.2km. At the top I took a photo on my phone with Brisbane 
behind (unfortunately my proper camera was out of battery - I hadn't charged 
it for a while
but it was working the day before - I still lugged it round as practice weight
for the rest of the run), used the facilities and then headed onwards on my
downward journey to the car, where I changed into sunglasses and hat.

The next seven laps were really quite similar - I only took a photo break at 
the top of laps 5 and 9 (at the top of 5 I texted Peta with my estimated 
time of completion - I actually finished quicker than that as the second
half was slightly quicker than the first). I was able to run pretty much
exactly what I expected to run from the first lap. The hill was surprisingly
variable - laps 5 and 6 for example were nearly a minute quicker than lap 2,
and I have no explanation for it! By laps 7 and 8 the temperature was probably
having an effect, but only on the uphill - the downhill section remained
comfortable. Occasionally I had to stop to get rid of the odd stone or twig
from my shoes. 

{% fancybox mountaintop /images/lap1.jpg "At the top of the first climb" %}
{% fancybox mountaintop /images/lap5.jpg "Fifth time up" %}
{% fancybox mountaintop /images/lap9.jpg "The final summit!" %}

However, as the graph below shows (with a row for each of the 8 laps plus the
last out and back), the laps were relatively consistent - around 12 minutes 
for the first km, 8 minutes (unless I stopped at the top) for the second,
six and a bit for the third and fourth km (except laps 6 and 8 where I did
sub six for both). The fifth km is really variable, as it includes the time
taken during any stops at the car to top up my bottles. I was very happy
with this consistency, and indeed that my 8th lap was faster than my 2nd. 

One of my concerns about the run was that I would not feel motivated to 
continue, but I never felt like stopping at all. By the time I completed
each loop, the long downhill had given me enough recovery time to be 
ready to start again.

The club record for this (by the only other person to have attempted it) is
pretty much bang on six hours and I did 6:15. I don't know whether I could
go 15 minutes quicker with less weight, or whether I'll ever want
to find out! 

<div id="lapstackgraph"></div>
Graph of time taken per lap, split by km. The last lap is to the top of the hill
and back only.


<script src="/assets/activity/lapsstack.js"></script>
<script>
// array of nth km per lap
var data = [[{ x: 1, y: "12:12.5" }, { x: 2, y: "12:40.1" }, { x: 3, y: "12:28.2" }, { x: 4, y: "12:08.4" }, { x: 5, y: "11:48.7" }, { x: 6, y: "11:37.2" }, { x: 7, y: "12:16.6" }, { x: 8, y: "12:20.2" }, { x: 9, y: "13:03.4" }],
    [{ x: 1, y: "12:41.9" }, { x: 2, y: "8:06.7" }, { x: 3, y: "8:01.9" }, { x: 4, y: "7:59.3" }, { x: 5, y: "11:43.7" }, { x: 6, y: "7:40.8" }, { x: 7, y: "7:51.8" }, { x: 8, y: "8:00.6" }, { x: 9, y: "9:42.4" }],
    [{ x: 1, y: "6:25.8" }, { x: 2, y: "6:24.7" }, { x: 3, y: "6:17.9" }, { x: 4, y: "6:14.5" }, { x: 5, y: "6:01.5" }, { x: 6, y: "5:53.0" }, { x: 7, y: "6:32.9" }, { x: 8, y: "5:58.5" }, { x: 9, y: "3:07.7" }],
    [{ x: 1, y: "6:02.6" }, { x: 2, y: "6:30.4" }, { x: 3, y: "6:22.8" }, { x: 4, y: "6:01.3" }, { x: 5, y: "6:16.5" }, { x: 6, y: "5:41.1" }, { x: 7, y: "6:24.0" }, { x: 8, y: "5:47.3" }, { x: 9, y: "0:0.0"}],
    [{ x: 1, y: "10:33.3" }, { x: 2, y: "8:00.7" }, { x: 3, y: "13:03.0" }, { x: 4, y: "7:46.7" }, { x: 5, y: "12:58.5" }, { x: 6, y: "7:59.2" }, { x: 7, y: "10:18.9" }, { x: 8, y: "9:07.8" }, { x: 9, y: "0:0.0"}]];

drawLapsStack(data, "#lapstackgraph");
</script>

