# Algorithm

tracks = []
for vid in all_vids:
	endtime = vid.starttime + vid.duration

	if diff(endtime, (vid+1).starttime) > 1 minute:
		tracks.append(vid)
	else:
		# nested while loop, compare curr vid pointer to next skipped video
		# TODO
		vid.append(vid+1)
