// mount_box.scad
//    OpenSCAD model for the solar panel mount
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

module basic_mount_box() {
    difference() {
    
        // outer box
        cube([MOUNT_OUTER_X_DIM,MOUNT_OUTER_Y_DIM,MOUNT_WALL_HEIGHT],center=true); 

        // cut out inner box
        translate([0,0,WALL_WIDTH]) {
            cube([MOUNT_INNER_X_DIM,MOUNT_INNER_Y_DIM,MOUNT_WALL_HEIGHT],center=true); 
        }
    } // difference
}

module basic_mount_box_with_cutouts() {
    difference() {

        translate([0,0,0.5*MOUNT_WALL_HEIGHT]) {
            basic_mount_box();
        }


    } // difference
}

module mount_box() {
    union() {
        basic_mount_box_with_cutouts();
        
        // tabs
        translate([0.5*(MOUNT_OUTER_X_DIM - TAB_WIDTH),0.5*(MOUNT_INNER_Y_DIM + TAB_WIDTH),0.5*MOUNT_WALL_HEIGHT]) {
            tab(MOUNT_WALL_HEIGHT);
        }
        translate([-0.5*(MOUNT_OUTER_X_DIM - TAB_WIDTH),0.5*(MOUNT_INNER_Y_DIM + TAB_WIDTH),0.5*MOUNT_WALL_HEIGHT]) {
            tab(MOUNT_WALL_HEIGHT);
        }
        translate([0.5*(MOUNT_OUTER_X_DIM - TAB_WIDTH),-0.5*(MOUNT_INNER_Y_DIM + TAB_WIDTH),0.5*MOUNT_WALL_HEIGHT]) {
            tab(MOUNT_WALL_HEIGHT);
        }
        translate([-0.5*(MOUNT_OUTER_X_DIM - TAB_WIDTH),-0.5*(MOUNT_INNER_Y_DIM + TAB_WIDTH),0.5*MOUNT_WALL_HEIGHT]) {
            tab(MOUNT_WALL_HEIGHT);
        }
        
    }
}

mount_box();


