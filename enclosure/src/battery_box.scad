//    battery_box.scad
//    OpenSCAD model for a box for a PKCELL 18650 lithium-ion battery 
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


module basic_battery_box() {
    difference() {
    
        // outer box
        cube([BATTERY_OUTER_X_DIM,BATTERY_OUTER_Y_DIM,BATTERY_WALL_HEIGHT],center=true); 

        // cut out inner box
        translate([0,0,WALL_WIDTH]) {
            cube([BATTERY_INNER_X_DIM,BATTERY_INNER_Y_DIM,BATTERY_WALL_HEIGHT],center=true); 
        }
    } // difference
}

module basic_battery_box_with_cutouts() {
    difference() {
        basic_battery_box();

        // cut out middle of bottom
        cube([BATTERY_INNER_X_DIM-6,BATTERY_INNER_Y_DIM/4,2*BATTERY_WALL_HEIGHT],center=true); 
        
        // make end cutouts
        translate([0.5*BATTERY_INNER_X_DIM,0,WALL_WIDTH]) {
            cube([WALL_WIDTH+0.5,BATTERY_INNER_Y_DIM-10.0,BATTERY_WALL_HEIGHT-12.0],center=true); 
        }
        translate([-0.5*BATTERY_INNER_X_DIM,0,WALL_WIDTH]) {
            cube([WALL_WIDTH+0.5,BATTERY_INNER_Y_DIM-10.0,BATTERY_WALL_HEIGHT-12.0],center=true); 
        }
        
        // make side cutouts
        translate([0,0.5*BATTERY_INNER_Y_DIM,WALL_WIDTH]) {
            cube([BATTERY_INNER_X_DIM-10,BATTERY_INNER_Y_DIM-10.0,BATTERY_WALL_HEIGHT-12.0],center=true); 
        }
        translate([0,-0.5*BATTERY_INNER_Y_DIM,WALL_WIDTH]) {
            cube([BATTERY_INNER_X_DIM-10,BATTERY_INNER_Y_DIM-10.0,BATTERY_WALL_HEIGHT-12.0],center=true); 
        }

    } // difference
}

module battery_box() {
    union() {
        basic_battery_box_with_cutouts();
        
        // tabs
        translate([0.5*(BATTERY_OUTER_X_DIM - TAB_WIDTH),0.5*(BATTERY_INNER_Y_DIM + TAB_WIDTH),0]) {
            tab(BATTERY_WALL_HEIGHT);
        }
        translate([-0.5*(BATTERY_OUTER_X_DIM - TAB_WIDTH),0.5*(BATTERY_INNER_Y_DIM + TAB_WIDTH),0]) {
            tab(BATTERY_WALL_HEIGHT);
        }
        translate([0.5*(BATTERY_OUTER_X_DIM - TAB_WIDTH),-0.5*(BATTERY_INNER_Y_DIM + TAB_WIDTH),0]) {
            tab(BATTERY_WALL_HEIGHT);
        }
        translate([-0.5*(BATTERY_OUTER_X_DIM - TAB_WIDTH),-0.5*(BATTERY_INNER_Y_DIM + TAB_WIDTH),0]) {
            tab(BATTERY_WALL_HEIGHT);
        }
        
    }
}

battery_box();


