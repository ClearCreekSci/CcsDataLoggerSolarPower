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

include <consts.scad>
use <MCAD/boxes.scad>
use <MCAD/regular_shapes.scad>

module tab(height) {
    difference() {
        roundedBox(size=[TAB_WIDTH,TAB_WIDTH,height],radius=TAB_CORNER_RADIUS,sidesonly=true);
        translate([0,0,-height]) {
            cylinder(2*height,TAB_HOLE_RADIUS,TAB_HOLE_RADIUS);
        }
    }
}

module drain_hole() {
    //cylinder(h=DRAIN_HOLE_HEIGHT,r=DRAIN_HOLE_RADIUS,center=true);
    cube([DRAIN_HOLE_HEIGHT,DRAIN_HOLE_HEIGHT,DRAIN_HOLE_HEIGHT],center=true);
}

module screw_hole() {
    union() {
        cylinder(h=SCREW_HOLE_HEIGHT,r=SCREW_HOLE_RADIUS,center=true);
        translate([0,0,0.5*WALL_WIDTH]) {
            cylinder(h=SCREW_HEAD_HEIGHT,r=SCREW_HEAD_RADIUS,center=true);
        }
    }
}

module hinge_tab(hole_offset) {
    rotate([90,0,0]) {
        difference() {
            roundedBox(size=[HINGE_TAB_WIDTH,HINGE_TAB_HEIGHT,HINGE_TAB_DEPTH],radius=HINGE_TAB_RADIUS,sidesonly=true);
            translate([0,hole_offset,0]) {
                cylinder(h=HINGE_HOLE_DEPTH+0.2,r=HINGE_HOLE_RADIUS,center=true);
            }
        }
    }
}

BASE_X_DIM = MOUNT_OUTER_X_DIM;
BASE_Y_DIM = MOUNT_OUTER_Y_DIM+2*(TAB_WIDTH-WALL_WIDTH);

module mount_hinge_base() {
    union () {
        // main base 
        difference() {
            roundedBox(size=[BASE_X_DIM,BASE_Y_DIM,WALL_WIDTH],radius=TAB_CORNER_RADIUS,sidesonly=true);

            // cut out screw holes
            translate([0.5*(BASE_X_DIM-TAB_WIDTH),0.5*(BASE_Y_DIM-TAB_WIDTH),0]) {
                screw_hole();
            }
            translate([-0.5*(BASE_X_DIM-TAB_WIDTH),0.5*(BASE_Y_DIM-TAB_WIDTH),0]) {
                screw_hole();
            }
            translate([0.5*(BASE_X_DIM-TAB_WIDTH),-0.5*(BASE_Y_DIM-TAB_WIDTH),0]) {
                screw_hole();
            }
            translate([-0.5* (BASE_X_DIM-TAB_WIDTH),-0.5*(BASE_Y_DIM-TAB_WIDTH),0]) {
                screw_hole();
            }
        } // difference

        // support base for hinges
        translate([0,0,0.5*HINGE_TAB_DEPTH]) {
            cube([HINGE_TAB_WIDTH+2*HINGE_SUPPORT_OVERHANG,4*HINGE_TAB_DEPTH+HINGE_GAP+2*HINGE_SUPPORT_OVERHANG,HINGE_TAB_DEPTH],center=true);
        }
    }
}

