/*
 * OrbisGIS is a GIS application dedicated to scientific spatial simulation.
 * This cross-platform GIS is developed at French IRSTV institute and is able to
 * manipulate and create vector and raster spatial information.
 *
 * OrbisGIS is distributed under GPL 3 license. It is produced by the "Atelier SIG"
 * team of the IRSTV Institute <http://www.irstv.fr/> CNRS FR 2488.
 *
 * Copyright (C) 2007-2012 IRSTV (FR CNRS 2488)
 *
 * This file is part of OrbisGIS.
 *
 * OrbisGIS is free software: you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * OrbisGIS is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * OrbisGIS. If not, see <http://www.gnu.org/licenses/>.
 *
 * For more information, please consult: <http://www.orbisgis.org/>
 * or contact directly:
 * info_at_ orbisgis.org
 */

package org.h2spatial.internal.function.spatial.convert;

import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.io.WKTWriter;
import org.h2spatialapi.ScalarFunction;

/**
 * Convert a Geometry value into a Well Known Text value.
 * @author Nicolas Fortin
 */
public class ST_AsWKT implements ScalarFunction {
    @Override
    public String getJavaStaticMethod() {
        return "asWKT";
    }

    @Override
    public Object getProperty(String propertyName) {
        if(propertyName.equals(ScalarFunction.PROP_DETERMINISTIC)) {
            return true;
        }
        return null;
    }

    /**
     * Convert a Geometry value into a Well Known Text value.
     * @param geometry Geometry instance
     * @return The String representation
     */
    public static String asWKT(Geometry geometry) {
        WKTWriter wktWriter = new WKTWriter();
        return wktWriter.write(geometry);
    }
}
