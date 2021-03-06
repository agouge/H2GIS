/**
 * h2spatial is a library that brings spatial support to the H2 Java database.
 *
 * h2spatial is distributed under GPL 3 license. It is produced by the "Atelier SIG"
 * team of the IRSTV Institute <http://www.irstv.fr/> CNRS FR 2488.
 *
 * Copyright (C) 2007-2014 IRSTV (FR CNRS 2488)
 *
 * h2patial is free software: you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * h2spatial is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * h2spatial. If not, see <http://www.gnu.org/licenses/>.
 *
 * For more information, please consult: <http://www.orbisgis.org/>
 * or contact directly:
 * info_at_ orbisgis.org
 */
package org.h2gis.h2spatialext.function.spatial.create;

import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.LineString;
import com.vividsolutions.jts.geom.LinearRing;
import com.vividsolutions.jts.geom.Polygon;
import org.h2gis.h2spatialapi.DeterministicScalarFunction;

/**
 * Class to create a polygon
 *
 * @author Erwan Bocher
 */
public class ST_MakePolygon extends DeterministicScalarFunction {

    private static final GeometryFactory GF = new GeometryFactory();

    public ST_MakePolygon() {
        addProperty(PROP_REMARKS, "Creates a Polygon formed by the given shell and optionally holes.\n"
                + "Input geometries must be closed Linestrings");
    }

    @Override
    public String getJavaStaticMethod() {
        return "makePolygon";
    }

    /**
     * Creates a Polygon formed by the given shell.
     *
     * @param shell
     * @return
     */
    public static Polygon makePolygon(Geometry shell) throws IllegalArgumentException {
        LinearRing outerLine = checkLineString(shell);
        return GF.createPolygon(outerLine, null);
    }

    /**
     * Creates a Polygon formed by the given shell and holes.
     *
     * @param shell
     * @param holes
     * @return
     */
    public static Polygon makePolygon(Geometry shell, Geometry... holes) throws IllegalArgumentException {
        LinearRing outerLine = checkLineString(shell);
        LinearRing[] interiorlinestrings = new LinearRing[holes.length];
        for (int i = 0; i < holes.length; i++) {
            interiorlinestrings[i] = checkLineString(holes[i]);
        }
        return GF.createPolygon(outerLine, interiorlinestrings);
    }

    /**
     * Check if a geometry is a linestring and if its closed.
     *
     * @param geometry
     * @return
     * @throws SQLException
     */
    private static LinearRing checkLineString(Geometry geometry) throws IllegalArgumentException {
        if (geometry instanceof LineString) {
            LineString lineString = (LineString) geometry;
            if (lineString.isClosed()) {
                return GF.createLinearRing(lineString.getCoordinateSequence());
            } else {
                throw new IllegalArgumentException("The linestring must be closed.");
            }
        } else if (geometry instanceof LinearRing) {
            return (LinearRing) geometry;

        } else {
            throw new IllegalArgumentException("Only support linestring.");
        }
    }
}
