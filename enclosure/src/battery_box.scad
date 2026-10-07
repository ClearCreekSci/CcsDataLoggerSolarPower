//    battery_box.scad
//    OpenSCAD model for a CCS Data Logger lithium-poly battery 
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

INNER_X_DIM = 68.7;
INNER_Y_DIM = 18.8;
WALL_WIDTH = 1.5;
WALL_HEIGHT = INNER_Y_DIM + WALL_WIDTH + 3.0;
OUTER_X_DIM = INNER_X_DIM + WALL_WIDTH;
OUTER_Y_DIM = INNER_Y_DIM + WALL_WIDTH;
TAB_WIDTH = 8;
TAB_HOLE_RADIUS = 1;
TAB_CORNER_RADIUS=1;

module tab() {
    color(c=[1.0,0,0]) {
        difference() {
            roundedBox(size=[TAB_WIDTH,TAB_WIDTH,WALL_HEIGHT],radius=TAB_CORNER_RADIUS,sidesonly=true);
            // cube([TAB_WIDTH,TAB_WIDTH,WALL_WIDTH],center=true);
            translate([0,0,-WALL_HEIGHT]) {
                cylinder(2*WALL_HEIGHT,TAB_HOLE_RADIUS,TAB_HOLE_RADIUS);
            }
        }
    }
}

module basic_battery_box() {
    difference() {
    
        // outer box
        cube([OUTER_X_DIM,OUTER_Y_DIM,WALL_HEIGHT],center=true); 

        // cut out inner box
        translate([0,0,WALL_WIDTH]) {
            cube([INNER_X_DIM,INNER_Y_DIM,WALL_HEIGHT],center=true); 
        }
    } // difference
}

module basic_battery_box_with_cutouts() {
    difference() {
        basic_battery_box();

        // cut out middle of bottom
        cube([INNER_X_DIM-6,INNER_Y_DIM/4,2*WALL_HEIGHT],center=true); 
        
        // make end cutouts
        translate([0.5*INNER_X_DIM,0,WALL_WIDTH]) {
            cube([WALL_WIDTH+0.5,INNER_Y_DIM-10.0,WALL_HEIGHT-12.0],center=true); 
        }
        translate([-0.5*INNER_X_DIM,0,WALL_WIDTH]) {
            cube([WALL_WIDTH+0.5,INNER_Y_DIM-10.0,WALL_HEIGHT-12.0],center=true); 
        }
        
        // make side cutouts
        translate([0,0.5*INNER_Y_DIM,WALL_WIDTH]) {
            cube([INNER_X_DIM-10,INNER_Y_DIM-10.0,WALL_HEIGHT-12.0],center=true); 
        }
        translate([0,-0.5*INNER_Y_DIM,WALL_WIDTH]) {
            cube([INNER_X_DIM-10,INNER_Y_DIM-10.0,WALL_HEIGHT-12.0],center=true); 
        }

    } // difference
}

module battery_box() {
    union() {
        basic_battery_box_with_cutouts();
        
        // tabs
        translate([0.5*(OUTER_X_DIM - TAB_WIDTH),0.5*(INNER_Y_DIM + TAB_WIDTH),0]) {
            tab();
        }
        translate([-0.5*(OUTER_X_DIM - TAB_WIDTH),0.5*(INNER_Y_DIM + TAB_WIDTH),0]) {
            tab();
        }
        translate([0.5*(OUTER_X_DIM - TAB_WIDTH),-0.5*(INNER_Y_DIM + TAB_WIDTH),0]) {
            tab();
        }
        translate([-0.5*(OUTER_X_DIM - TAB_WIDTH),-0.5*(INNER_Y_DIM + TAB_WIDTH),0]) {
            tab();
        }
        
    }
}

battery_box();


