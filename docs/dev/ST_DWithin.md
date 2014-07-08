---
layout: docs
title: ST_DWithin
category: geom2D/predicates
is_function: true
comments: true
description: Return true if the Geometries are within the specified distance of one another
prev_section: ST_Crosses
next_section: ST_Disjoint
permalink: /docs/dev/ST_DWithin/
---

### Signature

{% highlight mysql %}
BOOLEAN ST_DWithin(GEOMETRY geomA, GEOMETRY geomB, DOUBLE distance);
{% endhighlight %}

### Description

Returns true if `geomA` is within `distance` of `geomB`.

### Examples

| geomA POLYGON                        | geomB POLYGON                           |
|--------------------------------------|-----------------------------------------|
| POLYGON((0 0, 10 0, 10 5, 0 5, 0 0)) | POLYGON((12 0, 14 0, 14 6, 12 6, 12 0)) |

<img class="displayed" src="../ST_DWithin.png"/>

{% highlight mysql %}
SELECT ST_DWithin(geomA, geomB, 2.0) FROM input_table;
-- Answer:    TRUE

SELECT ST_DWithin(geomA, geomB, 1.0) FROM input_table;
-- Answer:    FALSE

SELECT ST_DWithin(geomA, geomB, -1.0) FROM input_table;
-- Answer:    FALSE

SELECT ST_DWithin(geomA, geomB, 3.0) FROM input_table;
-- Answer:    TRUE

SELECT ST_DWithin(geomA, geomA, -1.0) FROM input_table;
-- Answer:    FALSE

SELECT ST_DWithin(geomA, geomA, 0.0) FROM input_table;
-- Answer:    TRUE

SELECT ST_DWithin(geomA, geomA, 5000.0) FROM input_table;
-- Answer:    TRUE
{% endhighlight %}

##### See also

* <a href="https://github.com/irstv/H2GIS/blob/master/h2spatial-ext/src/main/java/org/h2gis/h2spatialext/function/spatial/predicates/ST_DWithin.java" target="_blank">Source code</a>
