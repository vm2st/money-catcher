package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.filters.BitmapFilter;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_2 extends SceneScript
{
	
	/* ======================= After N seconds ======================== */
	public function _event_AfterNsecs(timeTask:TimedTask):Void
	{
		if(wrapper.enabled && true)
		{
			resumeSoundOnChannel(10);
			pauseSoundOnChannel(23);
		}
	}
	/* ======================== When Updating ========================= */
	public function _event_Updating(elapsedTime:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("speedisactive") : Bool) == true))
			{
				runLater(1000 * 1, function(timeTask:TimedTask):Void
				{
					for(index0 in 0...38)
					{
						Engine.engine.setGameAttribute("speedtime", ((Engine.engine.getGameAttribute("speedtime") : Float) - 0.0099));
						break;
						break;
					}
					if(((Engine.engine.getGameAttribute("speedtime") : Float) <= 0))
					{
						Engine.engine.setGameAttribute("speedisactive", false);
						Engine.engine.setGameAttribute("speedtime", 0);
					}
				}, null);
			}
			if(((Engine.engine.getGameAttribute("x2coinsisactive") : Bool) == true))
			{
				runLater(1000 * 1, function(timeTask:TimedTask):Void
				{
					for(index0 in 0...38)
					{
						Engine.engine.setGameAttribute("x2coinstime", ((Engine.engine.getGameAttribute("x2coinstime") : Float) - 0.0099));
						break;
						break;
					}
					if(((Engine.engine.getGameAttribute("x2coinstime") : Float) <= 0))
					{
						Engine.engine.setGameAttribute("x2coinsisactive", false);
						Engine.engine.setGameAttribute("x2coinstime", 0);
					}
				}, null);
			}
			if(((Engine.engine.getGameAttribute("bigisactive") : Bool) == true))
			{
				runLater(1000 * 1, function(timeTask:TimedTask):Void
				{
					for(index0 in 0...38)
					{
						Engine.engine.setGameAttribute("bigtime", ((Engine.engine.getGameAttribute("bigtime") : Float) - 0.0099));
						break;
						break;
					}
					if(((Engine.engine.getGameAttribute("bigtime") : Float) <= 0))
					{
						Engine.engine.setGameAttribute("bigisactive", false);
						Engine.engine.setGameAttribute("bigtime", 0);
						Engine.engine.setGameAttribute("bigisdisabled01S", true);
						runLater(1000 * 0.1, function(timeTask:TimedTask):Void
						{
							Engine.engine.setGameAttribute("bigisdisabled01S", false);
						}, null);
					}
				}, null);
			}
			if(((Engine.engine.getGameAttribute("coins") : Float) <= -1))
			{
				Engine.engine.setGameAttribute("coins", 0);
			}
		}
	}
	/* ========================= When Drawing ========================= */
	public function _event_Drawing(g:G, x:Float, y:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("devmode") : Bool) == true))
			{
				g.drawString("" + Engine.engine.getGameAttribute("up"), 925, 15);
				g.drawString("" + Engine.engine.getGameAttribute("down"), 925, 30);
				g.drawString("" + Engine.engine.getGameAttribute("left"), 925, 45);
				g.drawString("" + Engine.engine.getGameAttribute("right"), 925, 60);
				g.drawString("" + Engine.engine.getGameAttribute("hit"), 850, 15);
				g.drawString("" + Engine.engine.getGameAttribute("activeboostersXAXIS"), 1200, 240);
			}
		}
	}
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		
	}
	
	override public function init()
	{
		/* ======================== When Creating ========================= */
		if(((Engine.engine.getGameAttribute("disablezombie") : Bool) == false))
		{
			createRecycledActorOnLayer(getActorType(233), 105, 320, engine.getLayerById(Std.int(3)));
		}
		
		runLater(1000 * 0.5, _event_AfterNsecs, null);
		addListener(engine.whenUpdated, _event_Updating);
		addListener(engine.whenDrawing, _event_Drawing);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}