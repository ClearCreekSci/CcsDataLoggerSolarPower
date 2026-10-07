//    ccs_dl_solar_panel.scad
//    OpenSCAD model for a CCS Data Logger solar pan
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

use <MCAD/boxes.scad>
use <MCAD/regular_shapes.scad>

$fa=1;
$fs=0.4;

WALL_WIDTH = 1.5;
WALL_HEIGHT = 8;
INNER_X_DIM = 92.2;
INNER_Y_DIM = 73.2;
OUTER_X_DIM = INNER_X_DIM + WALL_WIDTH;
OUTER_Y_DIM = INNER_Y_DIM + WALL_WIDTH;

DRAIN_HOLE_HEIGHT = 3.0 * WALL_WIDTH;
DRAIN_HOLE_RADIUS = 1.0;

module drain_hole() {
    cylinder(h=DRAIN_HOLE_HEIGHT,r=DRAIN_HOLE_RADIUS,center=true);
}

module basic_solar_box() {
    difference() {
    
        // outer box
        translate([0,0,0.5*WALL_HEIGHT]) {
             cube([OUTER_X_DIM,OUTER_Y_DIM,WALL_HEIGHT],center=true); 
        }

        // cut out inner box
        translate([0,0,0.5*WALL_HEIGHT+0.5*WALL_WIDTH]) {
            cube([INNER_X_DIM,INNER_Y_DIM,WALL_HEIGHT],center=true); 
        }
    } // difference
}

module basic_solar_box_with_cutout() {
    difference() {
        basic_solar_box();

        // cut out middle of bottom
        translate([0,0,0.5*WALL_HEIGHT-(2*WALL_WIDTH)]) {
            cube([INNER_X_DIM-6,INNER_Y_DIM/3,2*WALL_WIDTH],center=true); 
      }
    } // difference
}

module solar_box() {
    difference() {
        basic_solar_box_with_cutout();

        // cut out drain holes
        translate([0.5*INNER_X_DIM-DRAIN_HOLE_RADIUS,0.5*INNER_Y_DIM-DRAIN_HOLE_RADIUS,0]) {
            drain_hole();
        }
        translate([-0.5*INNER_X_DIM+DRAIN_HOLE_RADIUS,0.5*INNER_Y_DIM-DRAIN_HOLE_RADIUS,0]) {
            drain_hole();
        }
        translate([0.5*INNER_X_DIM-DRAIN_HOLE_RADIUS,-0.5*INNER_Y_DIM+DRAIN_HOLE_RADIUS,0]) {
            drain_hole();
        }
        translate([-0.5*INNER_X_DIM+DRAIN_HOLE_RADIUS,-0.5*INNER_Y_DIM+DRAIN_HOLE_RADIUS,0]) {
            drain_hole();
        }
    } // difference
}

solar_box();


