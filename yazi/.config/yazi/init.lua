local function perm_to_octal(perm)
	if not perm or #perm < 10 then
		return "---"
	end

	local out = {}
	for i = 2, 8, 3 do
		local r = perm:sub(i, i) == "r" and 4 or 0
		local w = perm:sub(i + 1, i + 1) == "w" and 2 or 0
		local x_ch = perm:sub(i + 2, i + 2)
		local x = (x_ch == "x" or x_ch == "s" or x_ch == "t") and 1 or 0
		out[#out + 1] = tostring(r + w + x)
	end
	return table.concat(out)
end

Entity:children_add(function(self)
	local f = self._file
	if not f.in_current then
		return ""
	end

	local mtime = math.floor(f.cha.mtime or 0)
	local date_str = mtime > 0 and os.date("%Y-%m-%d %H:%M", mtime) or "                "
	local perm_str = perm_to_octal(f.cha:perm())
	local size_str = ya.readable_size(f.cha.len or 0)

	local meta = string.format("%s  %s  %7s  ", date_str, perm_str, size_str)
	return ui.Span(meta):fg("#7f849c")
end, 1500)

function Entity:highlights()
	local f = self._file
	local name, p = f.name, ui.printable
	local slash = f.cha.is_dir and "/" or ""
	local highlights = f:highlights()

	local function styled_span(text, base_style)
		if f.in_current and f.is_hovered then
			local s = f:style() or ui.Style()
			if base_style then
				s = s:patch(base_style)
			end
			return ui.Span(text):style(s):reverse()
		end
		return base_style and ui.Span(text):style(base_style) or text
	end

	if not highlights or #highlights == 0 then
		return styled_span(p(name) .. slash)
	end

	local spans, last = {}, 0
	for _, h in ipairs(highlights) do
		if h[1] > last then
			spans[#spans + 1] = styled_span(p(name:sub(last + 1, h[1])))
		end
		spans[#spans + 1] = styled_span(p(name:sub(h[1] + 1, h[2])), th.mgr.find_keyword)
		last = h[2]
	end
	if last < #name then
		spans[#spans + 1] = styled_span(p(name:sub(last + 1)))
	end
	if slash ~= "" then
		spans[#spans + 1] = styled_span(slash)
	end
	return ui.Line(spans)
end

local orig_tab_new = Tab.new
function Tab:new(area, tab)
	return orig_tab_new(self, area:pad(ui.Pad(1, 0, 0, 0)), tab)
end
