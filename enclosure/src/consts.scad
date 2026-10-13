//    consts.scad
//    Constant values for OpenSCAD model 
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

WALL_WIDTH = 1.5;
TAB_WIDTH = 8;
HALF_TAB_WIDTH = 0.5 * TAB_WIDTH;
TAB_HOLE_RADIUS = 1;
TAB_CORNER_RADIUS=1;
DRAIN_HOLE_HEIGHT = 5.0;
DRAIN_HOLE_RADIUS = 2.0;
SCREW_HOLE_HEIGHT = 2.0 * WALL_WIDTH;
SCREW_HOLE_RADIUS = 1.0;
SCREW_HEAD_HEIGHT = 0.5*WALL_WIDTH;
SCREW_HEAD_RADIUS = 2.5;

BATTERY_INNER_X_DIM = 69.2;
BATTERY_INNER_Y_DIM = 19.0;
BATTERY_WALL_HEIGHT = BATTERY_INNER_Y_DIM + WALL_WIDTH + 5.0;
BATTERY_OUTER_X_DIM = BATTERY_INNER_X_DIM + 2*WALL_WIDTH;
BATTERY_OUTER_Y_DIM = BATTERY_INNER_Y_DIM + 2*WALL_WIDTH;
BATTERY_X_OFFSET = 10; 

PANEL_WALL_HEIGHT = 8;
PANEL_INNER_X_DIM = 138;
PANEL_INNER_Y_DIM = 114;
PANEL_OUTER_X_DIM = PANEL_INNER_X_DIM + 2*WALL_WIDTH;
PANEL_OUTER_Y_DIM = PANEL_INNER_Y_DIM + 2*WALL_WIDTH;
PANEL_CENTER_BOX_WIDTH = 30;

PANEL_CENTER_X_LEN = 52.5;
PANEL_CENTER_Y_LEN = 41.0;

MOUNT_INNER_X_DIM = 33.0;
MOUNT_INNER_Y_DIM = MOUNT_INNER_X_DIM;
MOUNT_WALL_HEIGHT = 36.0;
MOUNT_OUTER_X_DIM = MOUNT_INNER_X_DIM + 2*WALL_WIDTH;
MOUNT_OUTER_Y_DIM = MOUNT_INNER_Y_DIM + 2*WALL_WIDTH;

CHARGER_INNER_X_DIM = MOUNT_INNER_X_DIM;
CHARGER_INNER_Y_DIM = MOUNT_INNER_Y_DIM;
CHARGER_WALL_HEIGHT = 15.0;
CHARGER_OUTER_X_DIM = CHARGER_INNER_X_DIM + 2*WALL_WIDTH;
CHARGER_OUTER_Y_DIM = CHARGER_INNER_Y_DIM + 2*WALL_WIDTH;

HINGE_TAB_WIDTH = 15.0;
HINGE_TAB_DEPTH = 3.0;
HINGE_TAB_HEIGHT = 16.0;
HINGE_TAB_RADIUS = 3.0;

HINGE_HOLE_DEPTH = HINGE_TAB_DEPTH+0.2;
// Hinge hole needs to accept a 10/32 inch screw
HINGE_HOLE_DIAMETER = 6;
HINGE_HOLE_RADIUS = 0.5*HINGE_HOLE_DIAMETER;
HINGE_HOLE_OFFSET = HINGE_TAB_HEIGHT - (HINGE_HOLE_RADIUS+3);

HINGE_GAP = 3.1;
HINGE_SUPPORT_OVERHANG = 2.0;

