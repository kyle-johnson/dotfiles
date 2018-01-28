-- swap alt and meta for specific applications (in this case, Terminal and DataGrip)
-- (makes emacs-style move commands easier)

function fastKeyStroke(modifiers, character)
  -- this is a faster method than hs.eventtap.keyStroke (no pause between down and up)
  local event = require("hs.eventtap").event

  event.newKeyEvent(modifiers, string.lower(character), true):post()
  event.newKeyEvent(modifiers, string.lower(character), false):post()
end

function termMetaCombo (letter)
  local keystroke = function()
    fastKeyStroke({"alt"}, letter)
  end

  return hs.hotkey.new({"cmd"}, letter, nil, keystroke)
end

termBinds = {
  termMetaCombo('f'),
  termMetaCombo('b'),
  termMetaCombo('w'),
  termMetaCombo('d'),
  termMetaCombo('delete')
}

function enableBinds()
  -- hs.console.printStyledtext("term focused")
  for k,v in pairs(termBinds) do
    v:enable()
  end
end

function disableBinds()
  -- hs.console.printStyledtext("term unfocused")
  for k,v in pairs(termBinds) do
    v:disable()
  end
end

local wf=hs.window.filter

wf_terminal = wf.new{'Terminal'}
wf_terminal:subscribe(wf.windowFocused, enableBinds)
wf_terminal:subscribe(wf.windowUnfocused, disableBinds)

wf_datagrip = wf.new{'DataGrip'}
wf_datagrip:subscribe(wf.windowFocused, enableBinds)
wf_datagrip:subscribe(wf.windowUnfocused, disableBinds)
