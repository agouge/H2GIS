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

package org.h2gis.h2spatialext.function.spatial.affine_transformations;

import com.vividsolutions.jts.geom.Coordinate;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.util.AffineTransformation;
import org.h2gis.h2spatialapi.DeterministicScalarFunction;

/**
 * ST_Scale scales the given geometry by multiplying the coordinates by the
 * indicated scale factors.
 *
 * @author Adam Gouge
 */
public class ST_Scale extends DeterministicScalarFunction {

    public ST_Scale() {
        addProperty(PROP_REMARKS, "Scales the given geometry by " +
                "multiplying the coordinates by the indicated scale factors");
    }

    @Override
    public String getJavaStaticMethod() {
        return "scale";
    }

    /**
     * Scales the given geometry by multiplying the coordinates by the
     * indicated x and y scale factors, leaving the z-coordinate untouched.
     *
     * @param geom    Geometry
     * @param xFactor x scale factor
     * @param yFactor y scale factor
     * @return The geometry scaled by the given x and y scale factors
     */
    public static Geometry scale(Geometry geom, double xFactor, double yFactor) {
        return scale(geom, xFactor, yFactor, 1.0);
    }

    /**
     * Scales the given geometry by multiplying the coordinates by the
     * indicated x, y and z scale factors.
     *
     * @param geom    Geometry
     * @param xFactor x scale factor
     * @param yFactor y scale factor
     * @param zFactor z scale factor
     * @return The geometry scaled by the given x, y and z scale factors
     */
    public static Geometry scale(Geometry geom, double xFactor, double yFactor, double zFactor) {
        if (geom != null) {
            Geometry scaledGeom = (Geometry) geom.clone();
            for (Coordinate c : scaledGeom.getCoordinates()) {
                c.setOrdinate(Coordinate.X, c.getOrdinate(Coordinate.X) * xFactor);
                c.setOrdinate(Coordinate.Y, c.getOrdinate(Coordinate.Y) * yFactor);
                c.setOrdinate(Coordinate.Z, c.getOrdinate(Coordinate.Z) * zFactor);
            }
            return scaledGeom;
        } else {
            return null;
        }
    }
}
