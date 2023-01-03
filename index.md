---
layout: page
---

# Overview
I am a Staff Engineer at [Canonical](https://canonical.com/) where I work on a variety of open source things.

I am interested in a broad range of security topics. Most recently, I have focused on building systems that are resilient to attack using a range of techniques, including trusted computing and data provenance. You can find more information about my [research](research/) and [teaching](teaching/) interests on others pages on this site.

Prior to joinging Canonical I was an assistant professor in the [Department of Software and Information Systems](http://sis.uncc.edu) at the [University of North Carolina at Charlotte](http://www.uncc.edu).

Prior to joining the faculty at UNCC, I was a research scientist at [MIT Lincoln Laboratory](http://www.ll.mit.edu) in the [Secure Resilient Systems and Technology Group](http://www.ll.mit.edu/mission/cybersec/SRST/SRST.html) working with a number of incredibly talented people. While there, I worked on a range of topics related to computer and network defense.

Prior to joining the lab, I received my Ph.D. in Computer Science and Engineering from [The Pennsylvania State University](http://www.psu.edu) from the [Computer Science and Engineering Department](http://www.cse.psu.edu). I was a member of the [Systems and Internet Infrastructure Security Lab](http://siis.cse.psu.edu) where I was advised by [Professor Patrick McDaniel](http://patrickmcdaniel.org). My dissertation focused on building high-integrity systems at scale. I also received my M.S. in Computer Science and Engineering and my B.S. in Computer Engineering from Penn State.

# Recent News 
{% assign sorted = site.news | sort: 'date' | reverse %}
{% for post in sorted limit: 10 %}

### {{ post.date | date: "%b %-d, %Y" }}
<div class="news-blurb">
{{ post.excerpt }}
</div>
{% endfor %}

[Older News](news/)

