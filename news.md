---
layout: page
---

{% assign sorted = (site.news | sort: 'date') | reverse %}
{% for post in sorted %}
<article class="">
<header>
<h3>{{ post.date | date: "%b %-d, %Y" }}</h3>
</header>
<section>
{{ post.excerpt }}
</section>
</article>
{% endfor %}

