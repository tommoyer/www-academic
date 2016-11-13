---
layout: page
---
# News

{% assign sorted = (site.news | sort: 'date') | reverse %}
{% for post in sorted %}
<article class="">
<header>
<h3>{{ post.date | date: "%b %-d, %Y" }}</h3>
</header>
<section class="news-blurb">
{{ post.excerpt }}
</section>
</article>
{% endfor %}

