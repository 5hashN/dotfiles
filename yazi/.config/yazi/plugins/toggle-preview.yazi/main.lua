--- @sync entry

local function entry(_, job)
	local r = rt.mgr.ratio
	local mode = job.args[1] or "split"

	if mode == "max" then
		rt.mgr.ratio = r[3] == 9999 and { 0, 1, 0 } or { 0, 1, 9999 }
	else
		rt.mgr.ratio = r[3] > 0 and { 0, 1, 0 } or { 0, 4, 3 }
	end

	ya.emit("app:resize", {})
end

return { entry = entry }
