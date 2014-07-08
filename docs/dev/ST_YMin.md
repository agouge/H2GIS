---
layout: docs
title: ST_YMin
category: geom2D/properties
is_function: true
comments: true
description: Return the minimum y-value of a Geometry
prev_section: ST_YMax
next_section: geom2D/trigonometry
permalink: /docs/dev/ST_YMin/
---

### Signature

{% highlight mysql %}
DOUBLE ST_YMin(GEOMETRY geom);
{% endhighlight %}

### Description

Returns the minimum y-value of `geom`.

### Examples

{% highlight mysql %}
SELECT ST_YMin('LINESTRING(1 2 3, 4 5 6)');
-- Answer:    2.0
{% endhighlight %}

<img class="displayed" src="../ST_YMin.png"/>

##### See also

* [`ST_XMin`](../ST_XMin), [`ST_XMax`](../ST_XMax), [`ST_YMax`](../ST_YMax), [`ST_ZMax`](../ST_ZMax), [`ST_ZMin`](../ST_ZMin)
* <a href="https://github.com/irstv/H2GIS/blob/master/h2spatial-ext/src/main/java/org/h2gis/h2spatialext/function/spatial/properties/ST_YMin.java" target="_blank">Source code</a>
