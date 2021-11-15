/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 67A80010
/// @DnDArgument : "key" "vk_right"
var l67A80010_0;
l67A80010_0 = keyboard_check(vk_right);
if (l67A80010_0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 435C3E20
	/// @DnDParent : 67A80010
	/// @DnDArgument : "expr" "move_speed"
	/// @DnDArgument : "var" "hsp"
	hsp = move_speed;
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 62FF86B9
/// @DnDArgument : "key" "vk_left"
var l62FF86B9_0;
l62FF86B9_0 = keyboard_check(vk_left);
if (l62FF86B9_0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 20F3C33D
	/// @DnDParent : 62FF86B9
	/// @DnDArgument : "expr" "-move_speed"
	/// @DnDArgument : "var" "hsp"
	hsp = -move_speed;
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
/// @DnDVersion : 1
/// @DnDHash : 23C7646D
var l23C7646D_0;
l23C7646D_0 = keyboard_check_pressed(vk_space);
if (l23C7646D_0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 47CB78D6
	/// @DnDParent : 23C7646D
	/// @DnDArgument : "expr" "-jump_speed"
	/// @DnDArgument : "var" "vsp"
	vsp = -jump_speed;
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 70D45ACA
/// @DnDArgument : "expr" "global.grav"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "var" "vsp"
vsp += global.grav;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 17A1BF5F
/// @DnDArgument : "expr" "hsp*drag"
/// @DnDArgument : "var" "hsp"
hsp = hsp*drag;

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 5CCAE80D
/// @DnDArgument : "expr" "hsp"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "var" "x"
x += hsp;

/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 2AAE274A
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "vsp"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "obj_ground"
/// @DnDSaveInfo : "object" "obj_ground"
var l2AAE274A_0 = instance_place(x + 0, y + vsp, obj_ground);
if ((l2AAE274A_0 > 0))
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7F0C8670
	/// @DnDParent : 2AAE274A
	/// @DnDArgument : "var" "collide"
	/// @DnDArgument : "value" "false"
	var collide = false;

	/// @DnDAction : YoYo Games.Loops.While_Loop
	/// @DnDVersion : 1
	/// @DnDHash : 6D98D585
	/// @DnDParent : 2AAE274A
	/// @DnDArgument : "var" "collide"
	/// @DnDArgument : "value" "false"
	while ((collide == false)) {
		/// @DnDAction : YoYo Games.Collisions.If_Object_At
		/// @DnDVersion : 1.1
		/// @DnDHash : 07F8245F
		/// @DnDParent : 6D98D585
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y" "sign(vsp)"
		/// @DnDArgument : "y_relative" "1"
		/// @DnDArgument : "object" "obj_ground"
		/// @DnDArgument : "not" "1"
		/// @DnDSaveInfo : "object" "obj_ground"
		var l07F8245F_0 = instance_place(x + 0, y + sign(vsp), obj_ground);
		if (!(l07F8245F_0 > 0))
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 0C2279B5
			/// @DnDParent : 07F8245F
			/// @DnDArgument : "expr" "vsp"
			/// @DnDArgument : "expr_relative" "1"
			/// @DnDArgument : "var" "y"
			y += vsp;
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 56A91F1F
		/// @DnDParent : 6D98D585
		else
		{
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 25AA2864
			/// @DnDParent : 56A91F1F
			/// @DnDArgument : "expr" "true"
			/// @DnDArgument : "var" "collide"
			collide = true;
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 32A9D1A2
			/// @DnDParent : 56A91F1F
			/// @DnDArgument : "var" "vsp"
			vsp = 0;
		}
	}
}

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 7D7352DA
/// @DnDArgument : "expr" "vsp"
/// @DnDArgument : "expr_relative" "1"
/// @DnDArgument : "var" "y"
y += vsp;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0D1A95A2
/// @DnDArgument : "var" "hsp"
/// @DnDArgument : "not" "1"
if(!(hsp == 0))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1F14EE5A
	/// @DnDParent : 0D1A95A2
	/// @DnDArgument : "expr" "spr_player_walk"
	/// @DnDArgument : "var" "sprite_index"
	sprite_index = spr_player_walk;

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 67821B8A
	/// @DnDParent : 0D1A95A2
	/// @DnDArgument : "var" "hsp"
	/// @DnDArgument : "op" "2"
	if(hsp > 0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 4DE68261
		/// @DnDParent : 67821B8A
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "var" "facing"
		facing = 1;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 38546EE6
	/// @DnDParent : 0D1A95A2
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2FB2BDB7
		/// @DnDParent : 38546EE6
		/// @DnDArgument : "expr" "-1"
		/// @DnDArgument : "var" "facing"
		facing = -1;
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 3F7A07C4
else
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 43DC2688
	/// @DnDParent : 3F7A07C4
	/// @DnDArgument : "expr" "spr_player_idle"
	/// @DnDArgument : "var" "sprite_index"
	sprite_index = spr_player_idle;
}