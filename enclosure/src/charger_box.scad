// charger_box.scad
//    OpenSCAD model for a box to enclose Adafruit's bq25185 battery charger 
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

LONG_PIN_MEASURE = 24.0;
SHORT_PIN_MEASURE = 13.8;
PIN_HEIGHT = 3.5;
PIN_RADIUS = 1.3;
PIN_POINT_RADIUS = 0.9;

CHARGER_CUTOUT_WIDTH = 10.5;
CHARGER_CUTOUT_HEIGHT = 6.0;
CHARGER_PIN_CUTOUT_X = 3;
CHARGER_PIN_CUTOUT_Y = 7;
PANEL_CABLE_WIDTH = 2;

module basic_charger_box() {
    difference() {
    
        // outer box
        cube([CHARGER_OUTER_X_DIM,CHARGER_OUTER_Y_DIM,CHARGER_WALL_HEIGHT],center=true); 

        // cut out inner box
        translate([0,0,WALL_WIDTH]) {
            cube([CHARGER_INNER_X_DIM,CHARGER_INNER_Y_DIM,CHARGER_WALL_HEIGHT],center=true); 
        }
    } // difference
}

module basic_charger_box_with_cutouts() {
    difference() {

        translate([0,0,0.5*CHARGER_WALL_HEIGHT]) {
            basic_charger_box();
        }

        // make pin cutouts
        translate([0.5*(LONG_PIN_MEASURE)-PIN_RADIUS,0,WALL_WIDTH-0.5]) {
            cube([CHARGER_PIN_CUTOUT_X,CHARGER_PIN_CUTOUT_Y,WALL_WIDTH+1],center=true); 
        }
        translate([-0.5*(LONG_PIN_MEASURE)+PIN_RADIUS,0,WALL_WIDTH-0.5]) {
            cube([CHARGER_PIN_CUTOUT_X,CHARGER_PIN_CUTOUT_Y,WALL_WIDTH+1],center=true); 
        }
       
        // make end cutouts
        translate([0,0.5*(CHARGER_INNER_Y_DIM+WALL_WIDTH),0.5*CHARGER_CUTOUT_HEIGHT+WALL_WIDTH]) {
            cube([CHARGER_CUTOUT_WIDTH,WALL_WIDTH+1,CHARGER_CUTOUT_HEIGHT],center=true); 
        }
        translate([0,-0.5*(CHARGER_INNER_Y_DIM+WALL_WIDTH),0.5*CHARGER_CUTOUT_HEIGHT+WALL_WIDTH]) {
            cube([CHARGER_CUTOUT_WIDTH,WALL_WIDTH+1,CHARGER_CUTOUT_HEIGHT],center=true); 
        }
        
        // make side cutouts
        translate([0.5*(CHARGER_INNER_X_DIM+WALL_WIDTH),0,0.5*CHARGER_CUTOUT_HEIGHT+WALL_WIDTH]) {
            cube([WALL_WIDTH+1,CHARGER_CUTOUT_WIDTH,CHARGER_CUTOUT_HEIGHT],center=true); 
        }
        translate([-0.5*(CHARGER_INNER_X_DIM+WALL_WIDTH),0,0.5*CHARGER_CUTOUT_HEIGHT+WALL_WIDTH]) {
            cube([WALL_WIDTH+1,CHARGER_CUTOUT_WIDTH,CHARGER_CUTOUT_HEIGHT],center=true); 
        }

        // make panel cable cutouts
        translate([0.5*(CHARGER_INNER_X_DIM+WALL_WIDTH),0,CHARGER_WALL_HEIGHT-(PANEL_CABLE_WIDTH-0.2)]) {
            cube([WALL_WIDTH+1,CHARGER_CUTOUT_WIDTH,CHARGER_CUTOUT_HEIGHT],center=true); 
        }
        translate([-0.5*(CHARGER_INNER_X_DIM+WALL_WIDTH),0,CHARGER_WALL_HEIGHT-(PANEL_CABLE_WIDTH-0.2)]) {
            cube([WALL_WIDTH+1,CHARGER_CUTOUT_WIDTH,CHARGER_CUTOUT_HEIGHT],center=true); 
        }

    } // difference
}

module charger_box() {
    union() {
        basic_charger_box_with_cutouts();
       
        // pins
        translate([0.5*(LONG_PIN_MEASURE),0.5*(SHORT_PIN_MEASURE),0.5*PIN_HEIGHT+WALL_WIDTH]) {
            cylinder(h=PIN_HEIGHT,r1=PIN_RADIUS,r2=PIN_POINT_RADIUS,center=true);
        }
        translate([-0.5*(LONG_PIN_MEASURE),0.5*(SHORT_PIN_MEASURE),0.5*PIN_HEIGHT+WALL_WIDTH]) {
            cylinder(h=PIN_HEIGHT,r1=PIN_RADIUS,r2=PIN_POINT_RADIUS,center=true);
        }
        translate([0.5*(LONG_PIN_MEASURE),-0.5*(SHORT_PIN_MEASURE),0.5*PIN_HEIGHT+WALL_WIDTH]) {
            cylinder(h=PIN_HEIGHT,r1=PIN_RADIUS,r2=PIN_POINT_RADIUS,center=true);
        }
        translate([-0.5*(LONG_PIN_MEASURE),-0.5*(SHORT_PIN_MEASURE),0.5*PIN_HEIGHT+WALL_WIDTH]) {
            cylinder(h=PIN_HEIGHT,r1=PIN_RADIUS,r2=PIN_POINT_RADIUS,center=true);
        }
 
        // tabs
        translate([0.5*(CHARGER_OUTER_X_DIM - TAB_WIDTH),0.5*(CHARGER_INNER_Y_DIM + TAB_WIDTH),0.5*CHARGER_WALL_HEIGHT]) {
            tab(CHARGER_WALL_HEIGHT);
        }
        translate([-0.5*(CHARGER_OUTER_X_DIM - TAB_WIDTH),0.5*(CHARGER_INNER_Y_DIM + TAB_WIDTH),0.5*CHARGER_WALL_HEIGHT]) {
            tab(CHARGER_WALL_HEIGHT);
        }
        translate([0.5*(CHARGER_OUTER_X_DIM - TAB_WIDTH),-0.5*(CHARGER_INNER_Y_DIM + TAB_WIDTH),0.5*CHARGER_WALL_HEIGHT]) {
            tab(CHARGER_WALL_HEIGHT);
        }
        translate([-0.5*(CHARGER_OUTER_X_DIM - TAB_WIDTH),-0.5*(CHARGER_INNER_Y_DIM + TAB_WIDTH),0.5*CHARGER_WALL_HEIGHT]) {
            tab(CHARGER_WALL_HEIGHT);
        }
        
    }
}

charger_box();


