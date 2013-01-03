---
layout: post
title: "Tech behind the blog"
date: 2012-09-18 18:57
comments: true
categories: tech
---
I've moved the blog from [willthames.org.uk](http://willthames.org.uk)
to reflect my new location and just for an opportunity for a refresh.

I was relatively happy with [Drupal](http://drupal.org)'s flexibility
but just didn't need that much
power. Also, something a lot simpler means that I can customise it that much
more easily.

In the end I went with [Octopress](http://octopress.org) using the 
[Drupal migration](https://github.com/mojombo/jekyll/wiki/blog-migrations) 
for [Jekyll](https://github.com/mojombo/jekyll). 
Currently it's only migrated my posts - not my race
reports or training log. I'll worry about that later. Using octopress allows
me to store my blog posts in git and then upload them to 
[Heroku](http://heroku.com/) - so free blog posting in quite a simple fashion. 
The only thing I don't like about the
combination is that I have to keep the generated pages under version control,
but the opportunity to use and learn a bit more about Heroku was more
compelling than just using github pages. 

For theming, I really wanted to keep the left hand bar, and I just couldn't
easily work out how to do it using octopress's default theme. The 
[bootstrap theme](https://github.com/barmstrong/octopress-bootstrap) for
octopress was a lot easier to customise, mostly because
[Bootstrap](http://twitter.github.com/bootstrap) is so simple to use.
I've made a few of my own tweaks 
(most of which I've submitted as a pull request) and some simple CSS 
customisations on top. 

I've also changed the tag line from "swim, bike, run", to add the word tech. 
I imagine my blog will remain more about running than anything else, but 
there will definitely be the odd technical post.
