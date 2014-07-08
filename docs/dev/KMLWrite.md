---
layout: docs
title: KMLWrite
category: h2drivers
is_function: true
comments: true
description: KML, KMZ &rarr; Table
prev_section: GeoJsonWrite
next_section: SHPRead
permalink: /docs/dev/KMLWrite/
---

### Signature

{% highlight mysql %}
KMLWrite(VARCHAR path, VARCHAR tableName);
{% endhighlight %}

### Description

Writes table `tableName` to a [KML][wiki] file located at `path`.
A coordinate reference system must be set to save a KML file.

### Examples

{% highlight mysql %}
-- Create an example table to write to a KML file:
CREATE TABLE TEST(ID INT PRIMARY KEY, THE_GEOM POINT);
INSERT INTO TEST
    VALUES (1, ST_GeomFromText('POINT(2.19 47.58)', 4326));

-- Write it:
CALL KMLWrite('/home/user/test.kml', 'TEST');
{% endhighlight %}

##### See also

* <a href="https://github.com/irstv/H2GIS/blob/master/h2drivers/src/main/java/org/h2gis/drivers/kml/KMLWrite.java" target="_blank">Source code</a>

[wiki]: http://en.wikipedia.org/wiki/Keyhole_Markup_Language
