---
layout: docs
title: ST_Contains
category: geom2D/predicates
is_function: true
description:
prev_section: geom2D/predicates
next_section: ST_Covers
permalink: /docs/dev/ST_Contains/
description: Return true if Geometry A contains Geometry B
---

### Signatures

{% highlight mysql %}
BOOLEAN ST_Contains(GEOMETRY geomA, GEOMETRY geomB);
{% endhighlight %}

### Description

Returns true if `geomA` contains `geomB`.

{% include sfs-1-2-1.html %}

### Examples

##### Cases where `ST_Contains` is true

{% highlight mysql %}
SELECT ST_Contains('POLYGON ((1 1, 8 1, 8 7, 1 7, 1 1)'),
                   'POLYGON ((2 2, 7 2, 7 5, 2 5, 2 2))');
-- Answer: True
{% endhighlight %}

<img class="displayed" src="../ST_Contains_1.png"/>

{% highlight mysql %}
SELECT ST_Contains('POLYGON ((1 1, 8 1, 8 7, 1 7, 1 1)'),
                   'POLYGON ((1 2, 6 2, 6 5, 1 5, 1 2))');
-- Answer: True
{% endhighlight %}

<img class="displayed" src="../ST_Contains_4.png"/>

{% highlight mysql %}
SELECT ST_Contains('POLYGON ((1 1, 8 1, 8 7, 1 7, 1 1)'),
                   'LINESTRING (2 6, 6 2)');
-- Answer: True
{% endhighlight %}

<img class="displayed" src="../ST_Contains_2.png"/>

{% highlight mysql %}
SELECT ST_Contains('POLYGON ((1 1, 8 1, 8 7, 1 7, 1 1)'),
                   'LINESTRING (1 2, 1 6, 5 2)');
-- Answer: True
{% endhighlight %}

<img class="displayed" src="../ST_Contains_5.png"/>

{% highlight mysql %}
SELECT ST_Contains('POLYGON ((1 1, 8 1, 8 7, 1 7, 1 1)'),
                   'POINT (4 4)');
-- Answer: True
{% endhighlight %}

<img class="displayed" src="../ST_Contains_3.png"/>

{% highlight mysql %}
SELECT ST_Contains('LINESTRING (2 1, 5 3, 2 6'),
                   'LINESTRING (3 5, 5 3)');
-- Answer: True
{% endhighlight %}

<img class="displayed" src="../ST_Contains_10.png"/>

{% highlight mysql %}
SELECT ST_Contains('LINESTRING (2 1, 5 3, 2 6'),
                   'POINT (4 4)');
-- Answer: True
{% endhighlight %}

<img class="displayed" src="../ST_Contains_11.png"/>

##### Cases where `ST_Contains` is false

{% highlight mysql %}
SELECT ST_Contains('POLYGON ((1 1, 8 1, 8 7, 1 7, 1 1)'),
                   'POLYGON ((0 2, 5 2, 5 5, 0 5, 0 2))');
-- Answer: FALSE
{% endhighlight %}

<img class="displayed" src="../ST_Contains_7.png"/>

{% highlight mysql %}
SELECT ST_Contains('POLYGON ((1 1, 8 1, 8 7, 1 7, 1 1)'),
                   'LINESTRING (2 6, 0 8)');
-- Answer: FALSE
{% endhighlight %}

<img class="displayed" src="../ST_Contains_8.png"/>

{% highlight mysql %}
SELECT ST_Contains('POLYGON ((1 1, 8 1, 8 7, 1 7, 1 1)'),
                   'LINESTRING (1 2, 1 6)');
-- Answer: FALSE
{% endhighlight %}

<img class="displayed" src="../ST_Contains_12.png"/>

{% highlight mysql %}
SELECT ST_Contains('POLYGON ((1 1, 8 1, 8 7, 1 7, 1 1)'),
                   'POINT (8 4)');
-- Answer: FALSE
{% endhighlight %}

<img class="displayed" src="../ST_Contains_6.png"/>

{% highlight mysql %}
SELECT ST_Contains('POLYGON ((1 1, 7 1, 7 7, 1 7, 1 1)'),
                   'POINT (8 4)');
-- Answer: FALSE
{% endhighlight %}

<img class="displayed" src="../ST_Contains_9.png"/>

##### See also

* [`ST_Intersects`](../ST_Intersects),
  [`ST_Touches`](../ST_Touches),
  [`ST_Overlaps`](../ST_Overlaps)
* <a href="https://github.com/irstv/H2GIS/blob/master/h2spatial/src/main/java/org/h2gis/h2spatial/internal/function/spatial/predicates/ST_Contains.java" target="_blank">Source code</a>
