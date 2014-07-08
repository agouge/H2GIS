---
layout: docs
title: ST_X
category: geom2D/properties
is_function: true
comments: true
description: Return the x-value of the first coordinate of a Geometry
prev_section: ST_StartPoint
next_section: ST_XMax
permalink: /docs/dev/ST_X/
---

### Signature

{% highlight mysql %}
DOUBLE ST_X(GEOMETRY geom);
{% endhighlight %}

### Description

Returns the x-value of the first coordinate of `geom`.

{% include sfs-1-2-1.html %}

### Examples

{% highlight mysql %}
SELECT ST_X('MULTIPOINT((4 4), (1 1), (1 0), (0 3)))');
-- Answer: 4.0

SELECT ST_X(
    ST_GeometryN('MULTIPOINT((4 4), (1 1), (1 0), (0 3)))', 2));
-- Answer: 1.0

SELECT ST_X('LINESTRING(2 1, 1 3, 5 2)');
-- Answer: 2.0

SELECT ST_X(ST_PointN('LINESTRING(2 1, 1 3, 5 2)', 3));
-- Answer: 5.0

SELECT ST_X('POLYGON((5 0, 7 0, 7 1, 5 1, 5 0))');
-- Answer: 5.0

SELECT ST_X(
    ST_PointN(
        ST_ExteriorRing('POLYGON((5 0, 7 0, 7 1, 5 1, 5 0))'), 3));
-- Answer: 7.0

SELECT ST_X('MULTIPOLYGON(((0 2, 3 2, 3 6, 0 6, 0 2)),
                          ((5 0, 7 0, 7 1, 5 1, 5 0)))');
-- Answer: 0.0

SELECT ST_X('GEOMETRYCOLLECTION(
               MULTIPOINT((4 4), (1 1), (1 0), (0 3)),
               LINESTRING(2 1, 1 3, 5 2),
               POLYGON((1 2, 4 2, 4 6, 1 6, 1 2)))');
-- Answer: 4.0

{% endhighlight %}

##### See also

* [`ST_Y`](../ST_Y), [`ST_Z`](../ST_Z)
* [`ST_GeometryN`](../ST_GeometryN), [`ST_PointN`](../ST_PointN), [`ST_ExteriorRing`](../ST_ExteriorRing)
* <a href="https://github.com/irstv/H2GIS/blob/master/h2spatial/src/main/java/org/h2gis/h2spatial/internal/function/spatial/properties/ST_X.java" target="_blank">Source code</a>
