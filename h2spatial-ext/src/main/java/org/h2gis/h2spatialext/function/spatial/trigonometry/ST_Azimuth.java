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
package org.h2gis.h2spatialext.function.spatial.trigonometry;

import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.Point;
import org.h2gis.h2spatialapi.DeterministicScalarFunction;


/**
 * Returns the azimuth of the segment defined by the given Point geometries.
 * Return value is in radians.
 */
public class ST_Azimuth extends DeterministicScalarFunction{


    public ST_Azimuth(){
        addProperty(PROP_REMARKS, "Returns the azimuth of the segment defined by the given Point geometries, \n" +
                "or Null if the two points are coincident. Return value is in radians. \n" +
                " Angle is computed clockwise from the north equals to 0.");
    }

    @Override
    public String getJavaStaticMethod() {
        return "azimuth";
    }

    /**
     * This code compute the angle in radian as postgis does.
     * @author :  Jose Martinez-Llario from JASPA. JAva SPAtial for SQL
     * @param pointA
     * @param pointB
     * @return
     */
    public static Double azimuth(Geometry pointA, Geometry pointB){
        if ((pointA instanceof Point) && (pointB instanceof Point)) {
            Double angle ;
            double x0 = ((Point) pointA).getX();
            double y0 = ((Point) pointA).getY();
            double x1 = ((Point) pointB).getX();
            double y1 = ((Point) pointB).getY();

            if (x0 == x1) {
                if (y0 < y1) {
                    angle = 0.0;
                } else if (y0 > y1) {
                    angle = Math.PI;
                } else {
                    angle = null;
                }
            } else

            if (y0 == y1) {
                if (x0 < x1) {
                    angle = Math.PI / 2;
                } else if (x0 > x1) {
                    angle = Math.PI + (Math.PI / 2);
                } else {
                    angle = null;
                }
            } else

            if (x0 < x1) {
                if (y0 < y1) {
                    angle = Math.atan(Math.abs(x0 - x1) / Math.abs(y0 - y1));
                } else { /* ( y0 > y1 ) - equality case handled above */
                    angle = Math.atan(Math.abs(y0 - y1) / Math.abs(x0 - x1)) + (Math.PI / 2);
                }
            }

            else { /* ( x0 > x1 ) - equality case handled above */
                if (y0 > y1) {
                    angle = Math.atan(Math.abs(x0 - x1) / Math.abs(y0 - y1)) + Math.PI;
                } else { /* ( y0 < y1 ) - equality case handled above */
                    angle = Math.atan(Math.abs(y0 - y1) / Math.abs(x0 - x1)) + (Math.PI + (Math.PI / 2));
                }
            }
            return angle;
        }
        return null;
    }
}
