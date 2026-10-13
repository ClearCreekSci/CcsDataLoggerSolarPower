// mount_hinge_outer.scad
//    OpenSCAD model for the solar panel mount hinge outer tabs
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

OUTER_HOLE_OFFSET = 2;

module mount_outer_hinge_box() {
    union() {
        mount_hinge_base();

        // hinge 1
        translate([0,0,0.5*HINGE_TAB_HEIGHT]) {
            hinge_tab(OUTER_HOLE_OFFSET);
        }
        // hinge 2
        translate([0,HINGE_GAP+HINGE_TAB_DEPTH,0.5*HINGE_TAB_HEIGHT]) {
            hinge_tab(OUTER_HOLE_OFFSET);
        }
        // hinge 3
        translate([0,-(HINGE_GAP+HINGE_TAB_DEPTH),0.5*HINGE_TAB_HEIGHT]) {
            hinge_tab(OUTER_HOLE_OFFSET);
        }
       
    } // difference
}

mount_outer_hinge_box();


