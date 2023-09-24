playVideo = true;

function onStartCountdown()
	if isStoryMode and not seenCutscene then
		if playVideo then
			startVideo('ProveItCutscene');
			playVideo = false;
			return Function_Stop;
		end
	end
	return Function_Continue;
end