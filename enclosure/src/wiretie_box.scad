//    wiretie_box.scad
//    OpenSCAD model for a wire tie box
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


module basic_wiretie_box() {
    difference() {
    
        // outer box
        cube([WIRETIE_OUTER_X_DIM,WIRETIE_OUTER_Y_DIM,WIRETIE_WALL_HEIGHT],center=true); 

        // cut out inner box
        translate([0,0,WALL_WIDTH]) {
            cube([WIRETIE_INNER_X_DIM,WIRETIE_INNER_Y_DIM,WIRETIE_WALL_HEIGHT],center=true); 
        }
    } // difference
}

RAIL_WIDTH = WIRETIE_INNER_Y_DIM/8;

module basic_wiretie_box_with_cutouts() {
    difference() {
        basic_wiretie_box();

        // cut out tie rails 
        translate([0,0,-0.5*(WIRETIE_WALL_HEIGHT)-0.1]) {
            cube([WIRETIE_INNER_X_DIM,1.5*RAIL_WIDTH,4*WALL_WIDTH],center=true); 
        }
        translate([0,2.5*RAIL_WIDTH,-0.5*(WIRETIE_WALL_HEIGHT)-0.1]) {
            cube([WIRETIE_INNER_X_DIM,1.5*RAIL_WIDTH,4*WALL_WIDTH],center=true); 
        }
        translate([0,-2.5*RAIL_WIDTH,-0.5*(WIRETIE_WALL_HEIGHT)-0.1]) {
            cube([WIRETIE_INNER_X_DIM,1.5*RAIL_WIDTH,4*WALL_WIDTH],center=true); 
        }
        
        // make end cutouts
        translate([0.5*(WIRETIE_OUTER_X_DIM-WALL_WIDTH),0,WALL_WIDTH]) {
            cube([WALL_WIDTH+0.5,WIRETIE_INNER_Y_DIM,WIRETIE_WALL_HEIGHT-2],center=true); 
        }
        translate([-0.5*(WIRETIE_OUTER_X_DIM-WALL_WIDTH),0,WALL_WIDTH]) {
            cube([WALL_WIDTH+0.5,WIRETIE_INNER_Y_DIM,WIRETIE_WALL_HEIGHT-2],center=true); 
        }
        
        // make side cutouts
        translate([0,0.5*WIRETIE_INNER_Y_DIM,WALL_WIDTH]) {
            cube([WIRETIE_INNER_X_DIM-10,WIRETIE_INNER_Y_DIM-10.0,WIRETIE_WALL_HEIGHT-2],center=true); 
        }
        translate([0,-0.5*WIRETIE_INNER_Y_DIM,WALL_WIDTH]) {
            cube([WIRETIE_INNER_X_DIM-10,WIRETIE_INNER_Y_DIM-10.0,WIRETIE_WALL_HEIGHT-2],center=true); 
        }

    } // difference
}

module wiretie_box() {
    union() {
        basic_wiretie_box_with_cutouts();
        
        // tabs
        translate([0.5*(WIRETIE_OUTER_X_DIM - TAB_WIDTH),0.5*(WIRETIE_INNER_Y_DIM + TAB_WIDTH),0]) {
            tab(WIRETIE_WALL_HEIGHT);
        }
        translate([-0.5*(WIRETIE_OUTER_X_DIM - TAB_WIDTH),0.5*(WIRETIE_INNER_Y_DIM + TAB_WIDTH),0]) {
            tab(WIRETIE_WALL_HEIGHT);
        }
        translate([0.5*(WIRETIE_OUTER_X_DIM - TAB_WIDTH),-0.5*(WIRETIE_INNER_Y_DIM + TAB_WIDTH),0]) {
            tab(WIRETIE_WALL_HEIGHT);
        }
        translate([-0.5*(WIRETIE_OUTER_X_DIM - TAB_WIDTH),-0.5*(WIRETIE_INNER_Y_DIM + TAB_WIDTH),0]) {
            tab(WIRETIE_WALL_HEIGHT);
        }
        
    }
}

wiretie_box();


