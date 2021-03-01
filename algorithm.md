# Algorithm

tracks = []
current_track = 0
for vid in all_vids:
	if (vid+1) not in all_vids:
		return
	endtime = vid.starttime + vid.duration
	if diff(endtime, (vid+1).starttime) > 1 minute:
		tracks.append(vid)
		current_track += 1
	else:
		# nested while loop, compare curr vid pointer to next skipped video
		# TODO
		vid.append(vid+1)
