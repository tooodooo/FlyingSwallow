script DefaultInput
	
	on getVolume()
		return input volume of (get volume settings)
	end getVolume
	
	on setDefaultInputVolume:target
		set targetvolume to target as integer
		tell application "System Events" to set volume input volume targetvolume
		
		if targetvolume is 0 then
			
		else
			
		end if
	end setDefaultInputVolume:
	
end script
