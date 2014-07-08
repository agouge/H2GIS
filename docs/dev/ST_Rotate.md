---
layout: docs
title: ST_Rotate
category: geom2D/affine-transformations
is_function: true
comments: true
description: Rotate a Geometry counter-clockwise by an angle (in radians) about a point
prev_section: geom2D/affine-transformations
next_section: ST_Scale
permalink: /docs/dev/ST_Rotate/
---

### Signatures

{% highlight mysql %}
GEOMETRY ST_Rotate(GEOMETRY geom, DOUBLE angle);
GEOMETRY ST_Rotate(GEOMETRY geom, DOUBLE angle, POINT origin);
GEOMETRY ST_Rotate(GEOMETRY geom, DOUBLE angle, DOUBLE x, DOUBLE y);
{% endhighlight %}

### Description

Rotates `geom` counter-clockwise by `angle` (in radians) about the point
`origin` (or about the point specified by coordinates `x` and `y`).  If no
point is specified, `geom` is rotated about its center (the center of its
internal envelope).

### Examples

{% highlight mysql %}
SELECT ST_Rotate('LINESTRING(1 3, 1 1, 2 1)', pi());
-- Answer:    LINESTRING(2 1, 2 3, 1 3)
{% endhighlight %}

<img class="displayed" src="../ST_Rotate.png"/>

{% highlight mysql %}
SELECT ST_Rotate('LINESTRING(1 3, 1 1, 2 1)', pi() / 3);
-- Answer: LINESTRING(0.3839745962155607 2.0669872981077813,
--                    2.1160254037844384 1.0669872981077806,
--                    2.6160254037844384 1.933012701892219)

SELECT ST_Rotate('LINESTRING(1 3, 1 1, 2 1)', -pi()/2, ST_GeomFromText('POINT(2 1)'));
-- Answer:    LINESTRING(4 1, 2 2, 2 1)

SELECT ST_Rotate('LINESTRING(1 3, 1 1, 2 1)', pi()/2, 1.0, 1.0);
-- Answer:    LINESTRING(-1 1, 1 1, 1 2)
{% endhighlight %}

##### See also

* <a href="https://github.com/irstv/H2GIS/blob/master/h2spatial-ext/src/main/java/org/h2gis/h2spatialext/function/spatial/affine_transformations/ST_Rotate.java" target="_blank">Source code</a>
