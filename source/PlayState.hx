package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.animation.FlxAnimation;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;

class PlayState extends FlxState
{ 
	var spritesheet:FlxSprite;
	var text : FlxText;
	var facing : FlxObject;
	override public function create()
	{
		super.create();
		//creating canvas area for player/graphic to display
		text = new FlxText(0, 0, 2000);
		add(text);

		spritesheet = new FlxSprite();
		//loading the graphic image from assets
		spritesheet.loadGraphic(AssetPaths.walking__png, true, 767 , 1263);
		spritesheet.x = FlxG.width/2 - spritesheet.width/2; 
		spritesheet.y = FlxG.height/2 - spritesheet.height/2;

		//scaling the graphic to 20% to display full player
		spritesheet.scale.set(0.2, 0.2);

		//adding animations to the graphic
		spritesheet.animation.add("run", [0,1,2,3,4,5,6], 20 , true);
		spritesheet.animation.add("idle", [4]);

		//setting the face flip directions.
		spritesheet.setFacingFlip(RIGHT, false, false);
		spritesheet.setFacingFlip(LEFT, true, false);

		add(spritesheet);
		
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if(FlxG.keys.pressed.RIGHT){
			spritesheet.animation.play("run");
			spritesheet.x ++;
			spritesheet.facing = RIGHT;
		} else if(FlxG.keys.pressed.LEFT){
			spritesheet.animation.play("run");
			spritesheet.x --;
			spritesheet.facing = LEFT;
		} else {
			spritesheet.animation.play("idle");
		}
	}
}
