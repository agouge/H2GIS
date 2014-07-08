---
layout: docs
title: Quick-start guide
version: 1.2
prev_section: home
next_section: h2drivers
permalink: /docs/dev/quickstart/
---

Download the latest H2GIS web interface on the home page and run the jar
contained in the zip file. Then click on **Connect** in the web interface. You
will of course need a working [Java][] runtime environment.

Command-line gurus, just execute the following commands:

{% highlight bash %}
~ $ wget http://tinyurl.com/h2gis-zip -O h2gis.zip
~ $ unzip h2gis.zip
~ $ cd h2gis-standalone
~/h2gis-standalone $ java -jar h2-dist-1.1.0.jar
{% endhighlight %}

## Initialize the spatial extension

Spatial functions will not be available until the following request is
executed:

{% highlight mysql %}
CREATE ALIAS IF NOT EXISTS SPATIAL_INIT FOR
    "org.h2gis.h2spatialext.CreateSpatialExtension.initSpatialExtension";
CALL SPATIAL_INIT();
{% endhighlight %}

To open a shape file and show its contents:

{% highlight mysql %}
CALL FILE_TABLE('/home/user/myshapefile.shp', 'tablename');
SELECT * FROM TABLENAME;
{% endhighlight %}

[Java]: http://java.com/en/download/index.jsp
