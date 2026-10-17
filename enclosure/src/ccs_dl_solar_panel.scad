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
        translate([0,0,0.5*PANEL_WALL_HEIGHT+WALL_WIDTH]) {
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
        translate([0.5*PANEL_INNER_X_DIM,0.5*PANEL_INNER_Y_DIM,0.25*DRAIN_HOLE_HEIGHT]) {
            rotate([0,0,45]) {
                drain_hole();
            }
        }
        translate([0.5*PANEL_INNER_X_DIM,-0.5*PANEL_INNER_Y_DIM,0.25*DRAIN_HOLE_HEIGHT]) {
            rotate([0,0,45]) {
                drain_hole();
            }
        }
        translate([-0.5*PANEL_INNER_X_DIM,0.5*PANEL_INNER_Y_DIM,0.25*DRAIN_HOLE_HEIGHT]) {
            rotate([0,0,45]) {
                drain_hole();
            }
        }
        translate([-0.5*PANEL_INNER_X_DIM,-0.5*PANEL_INNER_Y_DIM,0.25*DRAIN_HOLE_HEIGHT]) {
            rotate([0,0,45]) {
                drain_hole();
            }
        }


        // cut out screw holes for battery box
color([0,0,1.0]) {
        translate([0.5*(PANEL_CENTER_BOX_WIDTH)+BATTERY_X_OFFSET,0.5*(BATTERY_OUTER_X_DIM-TAB_WIDTH),0.1]) {
            screw_hole();
        }
        translate([0.5*(PANEL_CENTER_BOX_WIDTH)+BATTERY_X_OFFSET+BATTERY_INNER_Y_DIM+TAB_WIDTH,0.5*(BATTERY_OUTER_X_DIM-TAB_WIDTH),0.1]) {
                screw_hole();
        }
        translate([0.5*(PANEL_CENTER_BOX_WIDTH)+BATTERY_X_OFFSET,-0.5*(BATTERY_OUTER_X_DIM-TAB_WIDTH),0.1]) {
            screw_hole();
        }
        translate([0.5*(PANEL_CENTER_BOX_WIDTH)+BATTERY_X_OFFSET+BATTERY_INNER_Y_DIM+TAB_WIDTH,-0.5*(BATTERY_OUTER_X_DIM-TAB_WIDTH),0.1]) {
            screw_hole();
        }
}
        // cut out screw holes for mount box (with charger)
        translate([0.5*(MOUNT_OUTER_Y_DIM-TAB_WIDTH),0.5*(MOUNT_OUTER_X_DIM+TAB_WIDTH)-WALL_WIDTH,0.1]) {
            screw_hole();
        }
        translate([0.5*(MOUNT_OUTER_Y_DIM-TAB_WIDTH),-0.5*(MOUNT_OUTER_X_DIM+TAB_WIDTH)+WALL_WIDTH,0.1]) {
            screw_hole();
        }
        translate([-0.5*(MOUNT_OUTER_Y_DIM-TAB_WIDTH),0.5*(MOUNT_OUTER_X_DIM+TAB_WIDTH)-WALL_WIDTH,0.1]) {
            screw_hole();
        }
        translate([-0.5*(MOUNT_OUTER_Y_DIM-TAB_WIDTH),-0.5*(MOUNT_OUTER_X_DIM+TAB_WIDTH)+WALL_WIDTH,0.1]) {
            screw_hole();
        }


        // cut out screw holes for wiretie box
color([1.0,0,0]) {
        translate([-0.5*(PANEL_CENTER_BOX_WIDTH)-WIRETIE_X_OFFSET,0.5*(WIRETIE_OUTER_X_DIM-TAB_WIDTH),0.1]) {
            screw_hole();
        }
        translate([-0.5*(PANEL_CENTER_BOX_WIDTH)-WIRETIE_X_OFFSET-WIRETIE_OUTER_Y_DIM-0.5*TAB_WIDTH,0.5*(WIRETIE_OUTER_X_DIM-TAB_WIDTH),0.1]) {
                screw_hole();
        }
        translate([-0.5*(PANEL_CENTER_BOX_WIDTH)-WIRETIE_X_OFFSET,-0.5*(WIRETIE_OUTER_X_DIM-TAB_WIDTH),0.1]) {
            screw_hole();
        }
        translate([-0.5*(PANEL_CENTER_BOX_WIDTH)-WIRETIE_X_OFFSET-WIRETIE_OUTER_Y_DIM-0.5*TAB_WIDTH,-0.5*(WIRETIE_OUTER_X_DIM-TAB_WIDTH),0.1]) {
                screw_hole();
        }
}

        // cut out screw holes for skirt box
        translate([0.5*(SKIRT_INNER_X_DIM-SKIRT_TAB_DIM),0.5*(SKIRT_INNER_Y_DIM-SKIRT_TAB_DIM),0.1]) {
            screw_hole();
        }
        translate([-0.5*(SKIRT_INNER_X_DIM-SKIRT_TAB_DIM),0.5*(SKIRT_INNER_Y_DIM-SKIRT_TAB_DIM),0.1]) {
            screw_hole();
        }
        translate([0.5*(SKIRT_INNER_X_DIM-SKIRT_TAB_DIM),-0.5*(SKIRT_INNER_Y_DIM-SKIRT_TAB_DIM),0.1]) {
            screw_hole();
        }
        translate([-0.5*(SKIRT_INNER_X_DIM-SKIRT_TAB_DIM),-0.5*(SKIRT_INNER_Y_DIM-SKIRT_TAB_DIM),0.1]) {
            screw_hole();
        }


        
    } // difference
}

solar_box();

