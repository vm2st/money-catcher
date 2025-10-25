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



class Design_13_13_EndlessAnimation extends ActorScript
{
	public var _AnimationList:Array<Dynamic>;
	public var _Entry:Array<Dynamic>;
	public var _CurrentAnimationPrefix:String;
	public var _Parts:Array<Dynamic>;
	public var _CurrentAnimationIndex:Float;
	public var _LastFrameDuration:Float;
	public var _Waiting:Bool;
	public var _DefaultMode:String;
	public var _Reverse:Bool;
	public var _LastAnimationIndex:Float;
	public var _FirstAnimationIndex:Float;
	public var _CurrentMode:String;
	public var _CurrentFrame:Float;
	public var _CurrentAnimation:String;
	public var _NextAnimationIndex:Float;
	
	/* ======================== When Updating ========================= */
	public function _event_Updated(elapsedTime:Float):Void
	{
		if(wrapper.enabled && true)
		{
			if((!(_Waiting) && (actor.getCurrentFrame() == (actor.getNumFrames() - 1))))
			{
				_CurrentAnimation = actor.getAnimation();
				_CurrentFrame = actor.getCurrentFrame();
				_Parts = (("" + _CurrentAnimation)).split("-");
				if((_Parts.length == 2))
				{
					_CurrentAnimationPrefix = "" + _Parts[0];
					_CurrentAnimationIndex = asNumber(_Parts[1]);
					for(item in cast(_AnimationList, Array<Dynamic>))
					{
						_Entry = ("" + item).split(",");
						if(((_Entry.length >= 3) && (_CurrentAnimationPrefix == _Entry[0])))
						{
							_Waiting = true;
							_LastFrameDuration = (actor.currAnimation.getFrameDurations()[(actor.getNumFrames() - 1)] / 1000);
							runLater(1000 * _LastFrameDuration, function(timeTask:TimedTask):Void
							{
								_Waiting = false;
								if(((_CurrentAnimation == actor.getAnimation()) && (_CurrentFrame == actor.getCurrentFrame())))
								{
									_Parts = (("" + actor.getAnimation())).split("-");
									if((_Parts.length == 2))
									{
										_CurrentAnimationPrefix = "" + _Parts[0];
										_CurrentAnimationIndex = asNumber(_Parts[1]);
										for(item in cast(_AnimationList, Array<Dynamic>))
										{
											_Entry = ("" + item).split(",");
											if(((_Entry.length >= 3) && (_CurrentAnimationPrefix == _Entry[0])))
											{
												_FirstAnimationIndex = asNumber(_Entry[1]);
												_LastAnimationIndex = asNumber(_Entry[2]);
												if((_Entry.length >= 4))
												{
													_CurrentMode = "" + _Entry[3];
												}
												else
												{
													_CurrentMode = _DefaultMode;
												}
												if((_CurrentMode == "Reverse"))
												{
													if(_Reverse)
													{
														if((_CurrentAnimationIndex == _FirstAnimationIndex))
														{
															_NextAnimationIndex = (_FirstAnimationIndex + 1);
															_Reverse = false;
														}
														else
														{
															_NextAnimationIndex = (_CurrentAnimationIndex - 1);
														}
													}
													else
													{
														if((_CurrentAnimationIndex == _LastAnimationIndex))
														{
															_NextAnimationIndex = (_LastAnimationIndex - 1);
															_Reverse = true;
														}
														else
														{
															_NextAnimationIndex = (_CurrentAnimationIndex + 1);
														}
													}
												}
												else if(((_CurrentMode == "Loop") && (_CurrentAnimationIndex == _LastAnimationIndex)))
												{
													_NextAnimationIndex = _FirstAnimationIndex;
												}
												else
												{
													_NextAnimationIndex = (_CurrentAnimationIndex + 1);
												}
												actor.setAnimation(((_CurrentAnimationPrefix) + ((("-") + (("" + _NextAnimationIndex))))));
												break;
											}
										}
									}
								}
							}, actor);
							break;
						}
					}
				}
			}
		}
	}
	public function _customBlock_SwitchEndlessAnimation(__animation:String):Void
	{
		var __Self:Actor = actor;
		if(!((("" + __animation)).split("-")[0] == (("" + actor.getAnimation())).split("-")[0]))
		{
			actor.setAnimation(__animation);
		}
	}
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Animation List", "_AnimationList");
		nameMap.set("Entry", "_Entry");
		nameMap.set("Current Animation Prefix", "_CurrentAnimationPrefix");
		_CurrentAnimationPrefix = "";
		nameMap.set("Parts", "_Parts");
		nameMap.set("Current Animation Index", "_CurrentAnimationIndex");
		_CurrentAnimationIndex = 0.0;
		nameMap.set("Last Frame Duration", "_LastFrameDuration");
		_LastFrameDuration = 0.0;
		nameMap.set("Waiting", "_Waiting");
		_Waiting = false;
		nameMap.set("Default Mode", "_DefaultMode");
		_DefaultMode = "";
		nameMap.set("Reverse", "_Reverse");
		_Reverse = false;
		nameMap.set("Last Animation Index", "_LastAnimationIndex");
		_LastAnimationIndex = 0.0;
		nameMap.set("First Animation Index", "_FirstAnimationIndex");
		_FirstAnimationIndex = 0.0;
		nameMap.set("Current Mode", "_CurrentMode");
		_CurrentMode = "";
		nameMap.set("Current Frame", "_CurrentFrame");
		_CurrentFrame = 0.0;
		nameMap.set("Current Animation", "_CurrentAnimation");
		_CurrentAnimation = "";
		nameMap.set("Next Animation Index", "_NextAnimationIndex");
		_NextAnimationIndex = 0.0;
		
	}
	
	override public function init()
	{
		
		
		addListener(actor.whenUpdated, _event_Updated);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}