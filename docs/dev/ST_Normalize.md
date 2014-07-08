---
layout: docs
title: ST_Normalize
category: geom2D/edit-geometries
is_function: true
comments: true
description: Return a Geometry with a normal form
prev_section: ST_Densify
next_section: ST_RemoveHoles
permalink: /docs/dev/ST_Normalize/
---

### Signature

{% highlight mysql %}
GEOMETRY ST_Normalize(GEOMETRY geom);
{% endhighlight %}

### Description

Converts a Geometry to its normal (or canonical) form.
The definitions for normal form use the standard lexicographical
ordering on coordinates.

### Examples

{% highlight mysql %}
SELECT ST_Normalize('POLYGON((2 4, 1 3, 2 1, 6 1, 6 3, 4 4, 2 4))');
-- Answer:           POLYGON((1 3, 2 4, 4 4, 6 3, 6 1, 2 1, 1 3))

SELECT ST_Normalize('MULTIPOINT((2 2), (2 5), (10 3), (7 1),
                                (5 1), (5 3))');
-- Answer:           MULTIPOINT((2 2), (2 5), (5 1), (5 3),
--                              (7 1), (10 3))

SELECT ST_Normalize('LINESTRING(3 1, 6 1, 6 3, 3 3, 1 1)');
-- Answer:           LINESTRING(1 1, 3 3, 6 3, 6 1, 3 1)
{% endhighlight %}

##### See also

* <a href="https://github.com/irstv/H2GIS/blob/master/h2spatial-ext/src/main/java/org/h2gis/h2spatialext/function/spatial/edit/ST_Normalize.java" target="_blank">Source code</a>
* JTS [Geometry#normalize][jts]

[jts]: http://tsusiatsoftware.net/jts/javadoc/com/vividsolutions/jts/geom/Geometry.html#normalize()
