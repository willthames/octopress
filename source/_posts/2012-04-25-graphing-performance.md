---
layout: post
title: !binary |-
  R3JhcGhpbmcgcGVyZm9ybWFuY2U=
created: 1335343785
---
I've been getting into data analysis and training performance is a perfect target for such analysis. 

Using <a href="http://pandas.pydata.org">pandas</a>, along with <a href="http://matplotlib.sourceforge.net">matplotlib</a>, NumPy and SciPy, I can graph the number of hours run 

<img src="/images/training2.png">

The python I used for this is
<script src="https://gist.github.com/2488202.js?file=training.py"></script>

(Note that I had to use ImageMagick's convert -trim +repage to remove unnecessary white space for display here - I'm sure I could have fiddled more withpyplot for a while to achieve similar results)

The data comes from my <a href="/trainingsummary">training summary</a>, a drupal view I created to produce a CSV of my training log for such purposes (importing it into excel and playing it with it there was my original analysis method)
