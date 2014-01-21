---
layout: docs
title: ST_MakeLine
category: h2spatial-ext/geometry-creation
description: <code>(MULTI)POINT</code> &rarr; <code>LINESTRING</code>
prev_section: h2spatial-ext/geometry-creation
next_section: ST_MakePoint
permalink: /docs/dev/ST_MakeLine/
---

### Signature

{% highlight mysql %}
LINESTRING ST_MakeLine(POINT pointA, POINT pointB, ...);
LINESTRING ST_MakeLine(POINT pointA, MULTIPOINT multipoint, ...);
LINESTRING ST_MakeLine(MULTIPOINT multipoint);
LINESTRING ST_MakeLine(MULTIPOINT multipointA, MULTIPOINT multipointB);
LINESTRING ST_MakeLine(GEOMETRYCOLLECTION points);
{% endhighlight %}

### Description

Constructs a `LINESTRING` from the given `POINT`s or `MULTIPOINT`s.

This function can be used as a scalar function, to draw a line between `POINT`s (at least 2), `POINT`s and `MULTIPOINT`s, `MULTIPOINT`s and `POINT`s, `MULTIPOINT`s and `MULTIPOINT`s or `GEOMETRYCOLLECTION`s.

It also can be used as an aggregative function in order to draw lines between values listed in a table. 

### Examples

#### Scalar function
{% highlight mysql %}
SELECT ST_MakeLine('POINT(1 2)'::Geometry, 'POINT(4 5)'::Geometry);
-- Answer:     LINESTRING(1 2, 4 5)
{% endhighlight %}

<img class="displayed" src="../ST_MakeLine_1.png"/>

{% highlight mysql %}
SELECT ST_MakeLine('POINT(1 2 3)'::Geometry, 'POINT(4 5 6)'::Geometry);
-- Answer:     LINESTRING(1 2 3, 4 5 6)
{% endhighlight %}

<img class="displayed" src="../ST_MakeLine_2.png"/>

{% highlight mysql %}
SELECT ST_MakeLine('POINT(1 2)'::Geometry, 'MULTIPOINT(4 5, 12 9)'::Geometry);
-- Answer:     LINESTRING(1 2, 4 5, 12 9)
{% endhighlight %}

<img class="displayed" src="../ST_MakeLine_3.png"/>

{% highlight mysql %}
SELECT ST_MakeLine('MULTIPOINT(1 2, 17 6)'::Geometry, 'MULTIPOINT(4 5, 7 9, 18 -1)'::Geometry);
-- Answer:     LINESTRING(1 2, 17 6, 4 5, 7 9, 18 -1)
{% endhighlight %}

<img class="displayed" src="../ST_MakeLine_4.png"/>

{% highlight mysql %}
ST_MakeLine('POINT(1 2)'::Geometry, 'POINT(4 5)'::Geometry, 'POINT(7 8)'::Geometry);
-- Answer:     LINESTRING(1 2, 4 5, 7 8)
{% endhighlight %}

<img class="displayed" src="../ST_MakeLine_5.png"/>

{% highlight mysql %}
SELECT ST_MakeLine('MULTIPOINT(1 2, 3 4)'::Geometry);
-- Answer:     LINESTRING(1 2, 3 4)
{% endhighlight %}


#### Aggregate function
{% highlight mysql %}
CREATE TABLE input_table(point Point);
INSERT INTO input_table VALUES
     ('POINT(1 2)'::Geometry),
     ('POINT(3 4)'::Geometry),
     ('POINT(5 6)'::Geometry),
     ('POINT(7 8)'::Geometry),
     ('POINT(9 10)'::Geometry);
SELECT ST_MakeLine(ST_Accum(point)) FROM input_table;
-- Answer:     LINESTRING(1 2, 3 4, 5 6, 7 8, 9 10)

CREATE TABLE input_table(point Geometry);
INSERT INTO input_table VALUES
     ('POINT(5 5)'::Geometry),
     ('MULTIPOINT(1 2, 7 9, 18 -4)'::Geometry),
     ('POINT(3 4)'::Geometry),
     ('POINT(99 3)'::Geometry);
SELECT ST_MakeLine(ST_Accum(point)) FROM input_table;
-- Answer:     LINESTRING(5 5, 1 2, 7 9, 18 -4, 3 4, 99 3)

CREATE TABLE input_table(multi_point MultiPoint);
INSERT INTO input_table VALUES
     ('MULTIPOINT(5 5, 1 2, 3 4, 99 3)'::Geometry),
     ('MULTIPOINT(-5 12, 11 22, 34 41, 65 124)'::Geometry),
     ('MULTIPOINT(1 12, 5 -21, 9 41, 32 124)'::Geometry);
SELECT ST_MakeLine(ST_Accum(multi_point)) FROM input_table;
-- Answer:     LINESTRING(5 5, 1 2, 3 4, 99 3, -5 12, 11 22,
--             34 41, 65 124, 1 12, 5 -21, 9 41, 32 124)
{% endhighlight %}

##### See also

* <a href="https://github.com/irstv/H2GIS/blob/master/h2spatial-ext/src/main/java/org/h2gis/h2spatialext/function/spatial/create/ST_MakeLine.java" target="_blank">Source code</a>