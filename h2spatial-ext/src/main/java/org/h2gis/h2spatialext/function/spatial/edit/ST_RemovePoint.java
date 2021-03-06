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
package org.h2gis.h2spatialext.function.spatial.edit;

import com.vividsolutions.jts.geom.Coordinate;
import com.vividsolutions.jts.geom.CoordinateArrays;
import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.geom.GeometryFactory;
import com.vividsolutions.jts.geom.LinearRing;
import com.vividsolutions.jts.geom.Polygon;
import com.vividsolutions.jts.geom.prep.PreparedPolygon;
import com.vividsolutions.jts.geom.util.GeometryEditor;
import java.sql.SQLException;
import org.h2gis.h2spatialapi.DeterministicScalarFunction;

/**
 * Remove all points on a geometry that are located within a polygon.
 *
 * @author Erwan Bocher
 */
public class ST_RemovePoint extends DeterministicScalarFunction {
  
    private static final GeometryFactory GF = new GeometryFactory();
    
    public ST_RemovePoint() {
        addProperty(PROP_REMARKS, "Remove all points on a geometry that are located within a polygon.");
    }

    @Override
    public String getJavaStaticMethod() {
        return "removePoint";
    }

    /**
     * Remove all vertices that are located within a polygon
     *
     * @param geometry
     * @param polygon
     * @return
     * @throws SQLException
     */
    public static Geometry removePoint(Geometry geometry, Polygon polygon) throws SQLException {
        GeometryEditor localGeometryEditor = new GeometryEditor();
        PolygonDeleteVertexOperation localBoxDeleteVertexOperation = new PolygonDeleteVertexOperation(GF, new PreparedPolygon(polygon));
        Geometry localGeometry = localGeometryEditor.edit(geometry, localBoxDeleteVertexOperation);
        if (localGeometry.isEmpty()) {
            return null;
        }
        return localGeometry;            
    }


    /**
     * This class is used to remove vertexes that are contained into a polygon.
     *
     */
    private static class PolygonDeleteVertexOperation extends GeometryEditor.CoordinateOperation {

        private GeometryFactory GF;
        //This polygon used to select the coordinates to removed
        private PreparedPolygon polygon;

        public PolygonDeleteVertexOperation(GeometryFactory GF, PreparedPolygon polygon) {
            this.polygon = polygon;
            this.GF=GF;
        }       

        @Override
        public Coordinate[] edit(Coordinate[] paramArrayOfCoordinate, Geometry paramGeometry) {           
            if (!this.polygon.intersects(paramGeometry)) {
                return paramArrayOfCoordinate;
            }            
            Coordinate[] arrayOfCoordinate1 = new Coordinate[paramArrayOfCoordinate.length];
            int j = 0;
            for (Coordinate coordinate : paramArrayOfCoordinate) {
                if (!this.polygon.contains(GF.createPoint(coordinate))) {
                    arrayOfCoordinate1[(j++)] = coordinate;
                }
            }

            Coordinate[] arrayOfCoordinate2 = CoordinateArrays.removeNull(arrayOfCoordinate1);
            Coordinate[] localObject = arrayOfCoordinate2;
            if (((paramGeometry instanceof LinearRing)) && (arrayOfCoordinate2.length > 1) && (!arrayOfCoordinate2[(arrayOfCoordinate2.length - 1)].equals2D(arrayOfCoordinate2[0]))) {
                Coordinate[] arrayOfCoordinate3 = new Coordinate[arrayOfCoordinate2.length + 1];
                CoordinateArrays.copyDeep(arrayOfCoordinate2, 0, arrayOfCoordinate3, 0, arrayOfCoordinate2.length);
                arrayOfCoordinate3[(arrayOfCoordinate3.length - 1)] = new Coordinate(arrayOfCoordinate3[0]);
                localObject = arrayOfCoordinate3;
            }
            return localObject;
        }        
    }   
}
