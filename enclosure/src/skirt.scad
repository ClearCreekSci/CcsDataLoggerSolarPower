//    skirt.scad
//    OpenSCAD model for a CCS Data Logger solar pan skirt
//
//    Copyright (C) 2026 Clear Creek Scientific
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <https://www.gnu.org/licenses/>.

include <common.scad>

$fa=1;
$fs=0.4;



module basic_solar_skirt() {
    difference() {
   
        // outer box
        translate([0,0,0.5*SKIRT_WALL_HEIGHT]) {
             cube([SKIRT_OUTER_X_DIM,SKIRT_OUTER_Y_DIM,SKIRT_WALL_HEIGHT],center=true); 
        }

        // cut out inner box
        translate([0,0,0.5*SKIRT_WALL_HEIGHT]) {
            cube([SKIRT_INNER_X_DIM,SKIRT_INNER_Y_DIM,SKIRT_WALL_HEIGHT+0.2],center=true); 
        }
    } // difference
}

module corner_tab() {
//color([1.0,0,0]) {
    difference() {
        cube([SKIRT_TAB_DIM,SKIRT_TAB_DIM,SKIRT_TAB_HEIGHT],center=true); 
        translate([0.5*(SKIRT_TAB_OFFSET),0.5*(SKIRT_TAB_OFFSET),-0.5*(SKIRT_TAB_HEIGHT)]) { 
            cylinder(h=2*SKIRT_TAB_HEIGHT-0.2,r=1,center=true);
        }
    }
//}
}

module skirt() {


    union() {
        basic_solar_skirt();

        translate([0.5*(SKIRT_OUTER_X_DIM-SKIRT_TAB_DIM),0.5*(SKIRT_OUTER_Y_DIM-SKIRT_TAB_DIM),0.5*SKIRT_TAB_HEIGHT]) {
            rotate([0,0,180]) {
                corner_tab();
            }
        }
        translate([-0.5*(SKIRT_OUTER_X_DIM-SKIRT_TAB_DIM),0.5*(SKIRT_OUTER_Y_DIM-SKIRT_TAB_DIM),0.5*SKIRT_TAB_HEIGHT]) {
            rotate([0,0,-90]) {
                corner_tab();
            }
        }
        translate([0.5*(SKIRT_OUTER_X_DIM-SKIRT_TAB_DIM),-0.5*(SKIRT_OUTER_Y_DIM-SKIRT_TAB_DIM),0.5*SKIRT_TAB_HEIGHT]) {
            rotate([0,0,90]) {
                corner_tab();
            }
        }
        translate([-0.5*(SKIRT_OUTER_X_DIM-SKIRT_TAB_DIM),-0.5*(SKIRT_OUTER_Y_DIM-SKIRT_TAB_DIM),0.5*SKIRT_TAB_HEIGHT]) {
            rotate([0,0,0]) {
                corner_tab();
            }
        }
    } // union
}

skirt();


