---
layout: docs
title: ST_ClosestPoint
category: geom2D/distance-functions
is_function: true
description: Return the point of Geometry A closest to Geometry B
prev_section: ST_ClosestCoordinate
next_section: ST_FurthestCoordinate
permalink: /docs/dev/ST_ClosestPoint/
---

### Signature

{% highlight mysql %}
POINT ST_ClosestPoint(GEOMETRY geomA, GEOMETRY geomB);
{% endhighlight %}

### Description

Returns the point of `geomA` closest to `geomB` using 2D distances
(z-coordinates are ignored).

<div class="note">
  <h5>What if the closest point is not unique?</h5>
  <p> Then the first one found is returned.</p>
</div>

<div class="note warning">
  <h5>The point returned depends on the order of the Geometry's
  coordinates.</h5>
</div>

### Examples

{% highlight mysql %}
SELECT  ST_ClosestPoint(POINT(4 8), LINESTRING(1 2, 3 6, 5 7, 4 1));
-- Answer: POINT(4 8)

SELECT  ST_ClosestPoint(LINESTRING(1 2, 3 6, 5 7, 4 1), POINT(4 8));
-- Answer: POINT(4.6 6.8)
{% endhighlight %}

<img class="displayed" src="../ST_ClosestPoint_1.png"/>

{% highlight mysql %}
SELECT  ST_ClosestPoint('POLYGON((0 0, 10 0, 10 5, 0 5, 0 0))',
                        'POINT(4 2)');
-- Answer: POINT(4 2)
{% endhighlight %}

<img class="displayed" src="../ST_ClosestPoint_2.png"/>

{% highlight mysql %}
SELECT  ST_ClosestPoint('POLYGON((0 0, 10 0, 10 5, 0 5, 0 0))',
                        'POINT(5 7)');
-- Answer: POINT(5 5)
{% endhighlight %}

<img class="displayed" src="../ST_ClosestPoint_3.png"/>

{% highlight mysql %}
-- This example shows that the POINT returned by ST_ClosestPoint
-- depends on the orientations of Geometries A and B. If they have the
-- same orientation, the POINT returned is the first POINT found in A.
-- If they have opposite orientation, the POINT returned is the POINT
-- of A closest to the first POINT found in B.
SELECT ST_ClosestPoint('LINESTRING(1 1, 1 5))',
                       'LINESTRING(2 1, 2 5))') A,
       ST_ClosestPoint('LINESTRING(1 1, 1 5))',
                       'LINESTRING(2 5, 2 1))') B;
-- Answer:
-- |      A      |      B      |
-- |-------------|-------------|
-- | POINT(1 1)  | POINT(1 5)  |
{% endhighlight %}

<img class="displayed" src="../ST_ClosestPoint_5.png"/>

{% highlight mysql %}
-- In this example, there are infinitely many closest points, but
-- ST_ClosestPoint returns the first one it finds. The POLYGON listed
-- as the second parameter remains the same, but its coordinates are
-- listed in a different order.
SELECT ST_ClosestPoint('POLYGON((0 0, 10 0, 10 5, 0 5, 0 0))',
                       'POLYGON((13 2, 15 0, 13 4, 13 2))') A,
       ST_ClosestPoint('POLYGON((0 0, 10 0, 10 5, 0 5, 0 0))',
                       'POLYGON((13 4, 13 2, 15 0, 13 4))') B;
-- Answer:
-- |      A       |      B       |
-- |--------------|--------------|
-- | POINT(10 2)  | POINT(10 4)  |
{% endhighlight %}

<img class="displayed" src="../ST_ClosestPoint_4.png"/>

##### See also

* [`ST_ClosestCoordinate`](../ST_ClosestCoordinate)
* <a href="https://github.com/irstv/H2GIS/blob/master/h2spatial-ext/src/main/java/org/h2gis/h2spatialext/function/spatial/distance/ST_ClosestPoint.java" target="_blank">Source code</a>
