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



class ActorEvents_14 extends ActorScript
{
	
	/* ======================= Every N seconds ======================== */
	public function _event_EveryNsecs(timeTask:TimedTask):Void
	{
		if(wrapper.enabled && true)
		{
			if((actor.getX() > 1245))
			{
				actor.setX(1245);
			}
			if((2 > actor.getY()))
			{
				actor.setY(2);
			}
			if((3 > actor.getX()))
			{
				actor.setX(3);
			}
			if((actor.getY() > 645))
			{
				actor.setY(645);
			}
		}
	}
	/* ======================== When Updating ========================= */
	public function _event_Updating(elapsedTime:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("istouch") : Bool) == true))
			{
				if(((Engine.engine.getGameAttribute("up") : Float) == 1))
				{
					if(((Engine.engine.getGameAttribute("gameisexited") : Bool) == false))
					{
						simulateKeyPress("up");
					}
					else
					{
						simulateKeyRelease("up");
					}
				}
				else
				{
					simulateKeyRelease("up");
				}
				if(((Engine.engine.getGameAttribute("down") : Float) == 1))
				{
					if(((Engine.engine.getGameAttribute("gameisexited") : Bool) == false))
					{
						simulateKeyPress("down");
					}
					else
					{
						simulateKeyRelease("down");
					}
				}
				else
				{
					simulateKeyRelease("down");
				}
				if(((Engine.engine.getGameAttribute("left") : Float) == 1))
				{
					if(((Engine.engine.getGameAttribute("gameisexited") : Bool) == false))
					{
						simulateKeyPress("left");
					}
					else
					{
						simulateKeyRelease("left");
					}
				}
				else
				{
					simulateKeyRelease("left");
				}
				if(((Engine.engine.getGameAttribute("right") : Float) == 1))
				{
					if(((Engine.engine.getGameAttribute("gameisexited") : Bool) == false))
					{
						simulateKeyPress("right");
					}
					else
					{
						simulateKeyRelease("right");
					}
				}
				else
				{
					simulateKeyRelease("right");
				}
			}
			else
			{
				
			}
			if(isKeyDown("WUP"))
			{
				if(((Engine.engine.getGameAttribute("gameisexited") : Bool) == false))
				{
					simulateKeyPress("up");
					Engine.engine.setGameAttribute("istouch", false);
				}
				else
				{
					simulateKeyRelease("up");
					Engine.engine.setGameAttribute("istouch", true);
				}
			}
			if(isKeyReleased("WUP"))
			{
				simulateKeyRelease("up");
				Engine.engine.setGameAttribute("istouch", true);
			}
			if(isKeyDown("SDOWN"))
			{
				if(((Engine.engine.getGameAttribute("gameisexited") : Bool) == false))
				{
					simulateKeyPress("down");
					Engine.engine.setGameAttribute("istouch", false);
				}
				else
				{
					simulateKeyRelease("down");
					Engine.engine.setGameAttribute("istouch", true);
				}
			}
			if(isKeyReleased("SDOWN"))
			{
				simulateKeyRelease("down");
				Engine.engine.setGameAttribute("istouch", true);
			}
			if(isKeyDown("ALEFT"))
			{
				if(((Engine.engine.getGameAttribute("gameisexited") : Bool) == false))
				{
					simulateKeyPress("left");
					Engine.engine.setGameAttribute("istouch", false);
				}
				else
				{
					simulateKeyRelease("left");
					Engine.engine.setGameAttribute("istouch", true);
				}
			}
			if(isKeyReleased("ALEFT"))
			{
				simulateKeyRelease("left");
				Engine.engine.setGameAttribute("istouch", true);
			}
			if(isKeyDown("DRIGHT"))
			{
				if(((Engine.engine.getGameAttribute("gameisexited") : Bool) == false))
				{
					simulateKeyPress("right");
					Engine.engine.setGameAttribute("istouch", false);
				}
				else
				{
					simulateKeyRelease("right");
					Engine.engine.setGameAttribute("istouch", true);
				}
			}
			if(isKeyReleased("DRIGHT"))
			{
				simulateKeyRelease("right");
				Engine.engine.setGameAttribute("istouch", true);
			}
			if(((Engine.engine.getGameAttribute("bigisactive") : Bool) == true))
			{
				recycleActor(actor);
			}
			if(!((Engine.engine.getGameAttribute("skin") : Float) == 0))
			{
				recycleActor(actor);
			}
			Engine.engine.setGameAttribute("playerX", actor.getX());
			Engine.engine.setGameAttribute("playerY", actor.getY());
			if(((Engine.engine.getGameAttribute("hit") : Bool) == true))
			{
				if((((Engine.engine.getGameAttribute("anglezombie") : Float) > 0) && ((Engine.engine.getGameAttribute("anglezombie") : Float) < 90)))
				{
					if((actor.getX() > 1180))
					{
						actor.setX((actor.getX() - 30));
					}
					else
					{
						actor.setX((actor.getX() + 20));
					}
					
					
				}
				if((((Engine.engine.getGameAttribute("anglezombie") : Float) > 90) && ((Engine.engine.getGameAttribute("anglezombie") : Float) < 180)))
				{
					if((actor.getX() < 30))
					{
						actor.setX((actor.getX() + 30));
						if((actor.getX() > 1180))
						{
							actor.setX((actor.getX() - 30));
						}
					}
					else
					{
						actor.setX((actor.getX() - 20));
					}
					
					
				}
				if((((Engine.engine.getGameAttribute("anglezombie") : Float) > 0) && ((Engine.engine.getGameAttribute("anglezombie") : Float) < 180)))
				{
					if((actor.getY() > 630))
					{
						actor.setY((actor.getY() - 30));
						if((actor.getX() > 1180))
						{
							actor.setX((actor.getX() - 30));
						}
					}
					else
					{
						actor.setY((actor.getY() + 20));
					}
					
					
				}
				if((((Engine.engine.getGameAttribute("anglezombie") : Float) > -180) && ((Engine.engine.getGameAttribute("anglezombie") : Float) < 0)))
				{
					if((actor.getY() < 30))
					{
						actor.setY((actor.getY() + 30));
						if((actor.getX() > 1180))
						{
							actor.setX((actor.getX() - 30));
						}
					}
					else
					{
						actor.setY((actor.getY() - 20));
					}
					
					
				}
				if((((Engine.engine.getGameAttribute("anglezombie") : Float) > 179) && ((Engine.engine.getGameAttribute("anglezombie") : Float) < 181)))
				{
					if((actor.getY() < 30))
					{
						actor.setY((actor.getY() + 30));
					}
					if((actor.getY() > 630))
					{
						actor.setY((actor.getY() - 30));
					}
					if((actor.getX() > 1180))
					{
						actor.setX((actor.getX() - 30));
					}
					if((actor.getX() < 30))
					{
						actor.setX((actor.getX() + 30));
					}
				}
				if(((actor.getX() > 1200) && (actor.getY() > 600)))
				{
					actor.setX(1100);
					actor.setY(560);
					actor.setX((actor.getX() - 30));
				}
				if(((actor.getX() > 1200) && (actor.getY() < 20)))
				{
					actor.setX(1100);
					actor.setY(60);
					actor.setX((actor.getX() - 30));
				}
				if(((actor.getX() < 20) && (actor.getY() < 20)))
				{
					actor.setX(80);
					actor.setY(60);
					actor.setX((actor.getX() + 30));
					actor.setY((actor.getY() + 20));
				}
				if(((actor.getX() < 20) && (actor.getY() > 600)))
				{
					actor.setX(80);
					actor.setY(560);
					actor.setX((actor.getX() - 30));
					actor.setY((actor.getY() - 20));
				}
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
				g.drawString("" + Engine.engine.getGameAttribute("playerX"), 30, 30);
				g.drawString("" + Engine.engine.getGameAttribute("playerY"), 30, 45);
				g.drawString("" + Engine.engine.getGameAttribute("istouch"), 30, 60);
			}
		}
	}
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		
	}
	
	override public function init()
	{
		
		
		runPeriodically(1000 * 0.01, _event_EveryNsecs, actor);
		addListener(actor.whenUpdated, _event_Updating);
		addListener(actor.whenDrawing, _event_Drawing);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}