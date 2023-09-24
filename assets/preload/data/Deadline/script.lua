playVideo = true;

function onStartCountdown()
	if isStoryMode and not seenCutscene then
		if playVideo then
			startVideo('DeadlineCutscene');
			playVideo = false;
			return Function_Stop;
		end
	end
	return Function_Continue;
end