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

include <common.scad>

$fa=1;
$fs=0.4;


module basic_solar_box() {
    difference() {
    
        // outer box
        translate([0,0,0.5*PANEL_WALL_HEIGHT]) {
             cube([PANEL_OUTER_X_DIM,PANEL_OUTER_Y_DIM,PANEL_WALL_HEIGHT],center=true); 
        }

        // cut out inner box
        translate([0,0,0.5*PANEL_WALL_HEIGHT+0.5*WALL_WIDTH]) {
            cube([PANEL_INNER_X_DIM,PANEL_INNER_Y_DIM,PANEL_WALL_HEIGHT],center=true); 
        }
    } // difference
}

module basic_solar_box_with_cutout() {
    difference() {
        basic_solar_box();

        // cut out middle of bottom
        translate([0,0,0.5*PANEL_WALL_HEIGHT-(2*WALL_WIDTH)]) {
            cube([PANEL_INNER_X_DIM-6,PANEL_CENTER_BOX_WIDTH,2*WALL_WIDTH],center=true); 
      }
    } // difference
}

module solar_box() {
    difference() {
        basic_solar_box_with_cutout();

        // cut out drain holes
        translate([0.5*PANEL_INNER_X_DIM-DRAIN_HOLE_RADIUS,0.5*PANEL_INNER_Y_DIM-DRAIN_HOLE_RADIUS,0]) {
            drain_hole();
        }
        translate([-0.5*PANEL_INNER_X_DIM+DRAIN_HOLE_RADIUS,0.5*PANEL_INNER_Y_DIM-DRAIN_HOLE_RADIUS,0]) {
            drain_hole();
        }
        translate([0.5*PANEL_INNER_X_DIM-DRAIN_HOLE_RADIUS,-0.5*PANEL_INNER_Y_DIM+DRAIN_HOLE_RADIUS,0]) {
            drain_hole();
        }
        translate([-0.5*PANEL_INNER_X_DIM+DRAIN_HOLE_RADIUS,-0.5*PANEL_INNER_Y_DIM+DRAIN_HOLE_RADIUS,0]) {
            drain_hole();
        }

        // cut out screw holes for battery box
        translate([0.5*(PANEL_INNER_X_DIM-TAB_WIDTH)-PANEL_CENTER_X_LEN+BATTERY_X_OFFSET,0.5*BATTERY_INNER_X_DIM,0]) {
            screw_hole();
        }
        translate([0.5*(PANEL_INNER_X_DIM+TAB_WIDTH)-PANEL_CENTER_X_LEN+0.5*BATTERY_INNER_Y_DIM+BATTERY_X_OFFSET,0.5*BATTERY_INNER_X_DIM,0]) {
            screw_hole();
        }
        translate([0.5*(PANEL_INNER_X_DIM-TAB_WIDTH)-PANEL_CENTER_X_LEN+BATTERY_X_OFFSET,-0.5*BATTERY_INNER_X_DIM,0]) {
            screw_hole();
        }
        translate([0.5*(PANEL_INNER_X_DIM+TAB_WIDTH)-PANEL_CENTER_X_LEN+0.5*BATTERY_INNER_Y_DIM+BATTERY_X_OFFSET,-0.5*BATTERY_INNER_X_DIM,0]) {
            screw_hole();
        }

        // cut out screw holes for charger box
        translate([-CHARGER_X_OFFSET,0.5*PANEL_INNER_Y_DIM-0.5*(CHARGER_INNER_Y_DIM+TAB_WIDTH),0]) {
            screw_hole();
        }
        translate([-CHARGER_X_OFFSET,0.5*PANEL_INNER_Y_DIM-(CHARGER_INNER_Y_DIM+TAB_WIDTH),0]) {
            screw_hole();
        }
        translate([-(CHARGER_X_OFFSET+CHARGER_INNER_X_DIM),0.5*PANEL_INNER_Y_DIM-0.5*(CHARGER_INNER_Y_DIM+TAB_WIDTH),0]) {
            screw_hole();
        }
        translate([-(CHARGER_X_OFFSET+CHARGER_INNER_X_DIM),0.5*PANEL_INNER_Y_DIM-(CHARGER_INNER_Y_DIM+TAB_WIDTH),0]) {
            screw_hole();
        }
        
        // cut out screw holes for mount box
        translate([0.5*MOUNT_INNER_X_DIM,0.5*MOUNT_INNER_Y_DIM+TAB_WIDTH,0]) {
            screw_hole();
        }
        translate([0.5*MOUNT_INNER_X_DIM,-0.5*(MOUNT_INNER_Y_DIM+TAB_WIDTH),0]) {
            screw_hole();
        }
        translate([-0.5*MOUNT_INNER_X_DIM,0.5*MOUNT_INNER_Y_DIM+TAB_WIDTH,0]) {
            screw_hole();
        }
        translate([-0.5*MOUNT_INNER_X_DIM,-0.5*(MOUNT_INNER_Y_DIM+TAB_WIDTH),0]) {
            screw_hole();
        }
        
    } // difference
}

solar_box();


