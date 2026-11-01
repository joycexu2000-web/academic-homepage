function Span(el)
  local style = el.attributes["style"] or ""
  if style:match("float:%s*right") then
    local result = {pandoc.RawInline("latex", "\\hfill ")}
    for _, item in ipairs(el.content) do table.insert(result, item) end
    return result
  end
end

function Image(el)
  el.attributes["width"] = "40%"
  return el
end

function Para(el)
  if pandoc.utils.stringify(el):match("^Pfizer Inc") then
    return {pandoc.RawBlock("latex", "\\newpage"), el}
  end
end
