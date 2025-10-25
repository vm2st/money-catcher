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



class ActorEvents_233 extends ActorScript
{
	public var _cooldown:Bool;
	public var _diffX:Float;
	public var _diffY:Float;
	public var _angleDeg:Float;
	public var _deg:Float;
	public var _hit:Bool;
	
	/* ========================= When Drawing ========================= */
	public function _event_Drawing(g:G, x:Float, y:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if(((Engine.engine.getGameAttribute("devmode") : Bool) == true))
			{
				g.drawString("" + _deg, 50, 50);
			}
		}
	}
	/* ======================== When Updating ========================= */
	public function _event_Updating(elapsedTime:Float):Void
	{
		if(wrapper.enabled && true)
		{
			actor.disableRotation();
			_diffX = ((Engine.engine.getGameAttribute("playerX") : Float) - actor.getX());
			_diffY = ((Engine.engine.getGameAttribute("playerY") : Float) - actor.getY());
			_angleDeg = Utils.DEG * (Math.atan2(_diffY, _diffX));
			actor.setVelocity(_angleDeg, 12);
			if((((_angleDeg >= -180) && (_angleDeg <= -90)) || ((_angleDeg <= 180) && (_angleDeg >= 90))))
			{
				actor.setAnimation("l");
			}
			else
			{
				actor.setAnimation("r");
			}
			if(((Engine.engine.getGameAttribute("disablezombie") : Bool) == true))
			{
				recycleActor(actor);
			}
			Engine.engine.setGameAttribute("anglezombie", _deg);
			if((_hit == true))
			{
				playSound(getSound(237));
				createRecycledActor(getActorType(244), 100, 18, Script.FRONT);
				Engine.engine.setGameAttribute("coins", ((Engine.engine.getGameAttribute("coins") : Float) - 5));
				_hit = false;
			}
			if(((Engine.engine.getGameAttribute("hit") : Bool) == true))
			{
				if((((Engine.engine.getGameAttribute("anglezombie") : Float) > 0) && ((Engine.engine.getGameAttribute("anglezombie") : Float) < 90)))
				{
					if((actor.getX() > 1180))
					{
						actor.setX((actor.getX() + 20));
					}
					else
					{
						actor.setX((actor.getX() - 20));
					}
				}
				if((((Engine.engine.getGameAttribute("anglezombie") : Float) > 90) && ((Engine.engine.getGameAttribute("anglezombie") : Float) < 180)))
				{
					if((actor.getX() < 30))
					{
						actor.setX((actor.getX() - 20));
					}
					else
					{
						actor.setX((actor.getX() + 20));
					}
				}
				if((((Engine.engine.getGameAttribute("anglezombie") : Float) > 0) && ((Engine.engine.getGameAttribute("anglezombie") : Float) < 180)))
				{
					if((actor.getY() > 630))
					{
						actor.setX((actor.getX() - 20));
					}
					else
					{
						actor.setY((actor.getY() - 20));
					}
				}
				if((((Engine.engine.getGameAttribute("anglezombie") : Float) > -180) && ((Engine.engine.getGameAttribute("anglezombie") : Float) < 0)))
				{
					if((actor.getY() < 30))
					{
						actor.setX((actor.getX() - 20));
					}
					else
					{
						actor.setY((actor.getY() + 20));
					}
				}
			}
		}
	}
	/* ======================= Every N seconds ======================== */
	public function _event_EveryNsecs(timeTask:TimedTask):Void
	{
		if(wrapper.enabled && true)
		{
			_diffX = ((Engine.engine.getGameAttribute("playerX") : Float) - actor.getX());
			_diffY = ((Engine.engine.getGameAttribute("playerY") : Float) - actor.getY());
			_deg = Utils.DEG * (Math.atan2(_diffY, _diffX));
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
	/* ======================== Actor of Type ========================= */
	public function _event_ActorType(event:Collision):Void
	{
		if(wrapper.enabled && sameAsAny(getActorType(14), event.otherActor.getType(), event.otherActor.getGroup()))
		{
			if((_cooldown == false))
			{
				_hit = true;
			}
			_cooldown = true;
			runLater(1000 * 0.1, function(timeTask:TimedTask):Void
			{
				_cooldown = false;
			}, actor);
			Engine.engine.setGameAttribute("hit", true);
			runLater(1000 * 0.1, function(timeTask:TimedTask):Void
			{
				Engine.engine.setGameAttribute("hit", false);
			}, actor);
		}
	}
	/* ======================== Actor of Type ========================= */
	public function _event_ActorTypeCopyCopy(event:Collision):Void
	{
		if(wrapper.enabled && sameAsAny(getActorType(166), event.otherActor.getType(), event.otherActor.getGroup()))
		{
			if((_cooldown == false))
			{
				_hit = true;
			}
			_cooldown = true;
			runLater(1000 * 0.1, function(timeTask:TimedTask):Void
			{
				_cooldown = false;
			}, actor);
			Engine.engine.setGameAttribute("hit", true);
			runLater(1000 * 0.1, function(timeTask:TimedTask):Void
			{
				Engine.engine.setGameAttribute("hit", false);
			}, actor);
		}
	}
	/* ======================== Actor of Type ========================= */
	public function _event_ActorTypeCopyCopyCopyCopy(event:Collision):Void
	{
		if(wrapper.enabled && sameAsAny(getActorType(195), event.otherActor.getType(), event.otherActor.getGroup()))
		{
			if((_cooldown == false))
			{
				_hit = true;
			}
			_cooldown = true;
			runLater(1000 * 0.1, function(timeTask:TimedTask):Void
			{
				_cooldown = false;
			}, actor);
			Engine.engine.setGameAttribute("hit", true);
			runLater(1000 * 0.1, function(timeTask:TimedTask):Void
			{
				Engine.engine.setGameAttribute("hit", false);
			}, actor);
		}
	}
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("cooldown", "_cooldown");
		_cooldown = false;
		nameMap.set("diffX", "_diffX");
		_diffX = 0.0;
		nameMap.set("diffY", "_diffY");
		_diffY = 0.0;
		nameMap.set("angleDeg", "_angleDeg");
		_angleDeg = 0.0;
		nameMap.set("deg", "_deg");
		_deg = 0.0;
		nameMap.set("hit", "_hit");
		_hit = false;
		
	}
	
	override public function init()
	{
		
		
		addListener(actor.whenDrawing, _event_Drawing);
		addListener(actor.whenUpdated, _event_Updating);
		runPeriodically(1000 * 0.001, _event_EveryNsecs, actor);
		addListener(actor.whenCollided, _event_ActorType);
		addListener(actor.whenCollided, _event_ActorTypeCopyCopy);
		addListener(actor.whenCollided, _event_ActorTypeCopyCopyCopyCopy);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}