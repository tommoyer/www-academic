---
layout: page
---

I recently defended my dissertation, titled <em>Building Scalable Document Integrity Systems</em>. Next, I will be working at [MIT Lincoln Laboratory](http://www.ll.mit.edu), where I will be working on various problems in Computer Security. My new contact information is reflected in the sidebar.

{% assign sorted = (site.news | sort: 'date') | reverse %}
{% for post in sorted limit: 5 %}

### {{ post.date | date: "%b %-d, %Y" }}
{{ post.excerpt }}
{% endfor %}

[Older News](news/)

