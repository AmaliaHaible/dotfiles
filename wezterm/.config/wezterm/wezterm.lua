local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- Note that this file starts with a dot bc i started on windows and was too lazy to change it
config.font = wezterm.font("JetBrainsMonoNL Nerd Font", { weight = "DemiBold", stretch = "Normal", style = "Normal" })

config.default_prog = { "zsh" }
config.default_cwd = "~/projects/"

config.font_size = 10
config.color_scheme = "nordfox"
config.colors = { background = "282c34" }

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "pwsh.exe", "-NoLogo" }
	config.default_cwd = "C:/Users/Florian/projects/"

	config.launch_menu = {
		{ label = "MSYS MINGW64", args = { "cmd.exe ", "/k", "C:\\msys64\\msys2_shell.cmd -defterm -here -no-start -mingw64 -shell bash" } },
		{ label = "MSYS UCRT64", args = { "cmd.exe ", "/k", "C:\\msys64\\msys2_shell.cmd -defterm -here -no-start -ucrt64 -shell bash" } },
		{ label = "PowerShell (Old)", args = { "powershell.exe", "-NoLogo" } },
		{ label = "PowerShell (New)", args = { "pwsh.exe", "-NoLogo" } },
		{
			label = "VC 2022 PowerShell",
			args = {
				"pwsh.exe",
				"-NoExit",
				"-Command",
				'&{Import-Module "C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/Tools/Microsoft.VisualStudio.DevShell.dll"; Enter-VsDevShell 4bbb64cc -SkipAutomaticLocation -DevCmdArguments "-arch=x64 -host_arch=x64"}',
			},
		},
	}
	-- for cmd: see https://wezterm.org/config/launch.html#the-launcher-menu
    -- I hate everything about this. if someone reads this, just create this function in your $PROFILE 
    -- function vs22 {
    --     Import-Module "C:/Program Files/Microsoft Visual Studio/2022/Community/Common7/Tools/Microsoft.VisualStudio.DevShell.dll"; 
    --     Enter-VsDevShell 4bbb64cc -SkipAutomaticLocation -Arch amd64 -HostArch amd64
    --     # Enter-VsDevShell -VsInstallPath "C:\Program Files\Microsoft Visual Studio\2022\Community\" -SkipAutomaticLocation -Arch amd64 -HostArch amd64
    -- }

end

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

wezterm.on("decrease-transparency", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 1.0
	end
	overrides.window_background_opacity = overrides.window_background_opacity - 0.05
	if overrides.window_background_opacity <= 0 then
		overrides.window_background_opacity = 0
	end
	window:set_config_overrides(overrides)
end)

wezterm.on("increase-transparency", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 1.0
	end
	overrides.window_background_opacity = overrides.window_background_opacity + 0.05
	if overrides.window_background_opacity >= 1 then
		overrides.window_background_opacity = 1
	end
	window:set_config_overrides(overrides)
end)
config.disable_default_key_bindings = true

-- qwerty layout is default, so i need to change a lot
config.keys = {
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
	{ key = "!", mods = "SHIFT|CTRL", action = act.ActivateTab(0) },
	{ key = '"', mods = "SHIFT|CTRL", action = act.ActivateTab(1) },
	{ key = "§", mods = "SHIFT|CTRL", action = act.ActivateTab(2) },
	{ key = "$", mods = "SHIFT|CTRL", action = act.ActivateTab(3) },
	{ key = "%", mods = "SHIFT|CTRL", action = act.ActivateTab(4) },

	{ key = "'", mods = "SHIFT|CTRL", action = act.ResetFontSize },
	{ key = "*", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
	{ key = "_", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
	{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	{ key = "F", mods = "SHIFT|CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "K", mods = "SHIFT|CTRL", action = act.ClearScrollback("ScrollbackOnly") },
	{ key = "L", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },
	{ key = "M", mods = "SHIFT|CTRL", action = act.Hide },
	{ key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },
	{ key = "P", mods = "SHIFT|CTRL", action = act.ActivateCommandPalette },
	{ key = "R", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
	{ key = "T", mods = "SHIFT|CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "W", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "X", mods = "SHIFT|CTRL", action = act.ActivateCopyMode },
	{ key = "Z", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState },
	--{ key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
	{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
	{ key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "PageUp", mods = "SHIFT|CTRL", action = act.MoveTabRelative(-1) },
	{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },
	{ key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "PageDown", mods = "SHIFT|CTRL", action = act.MoveTabRelative(1) },
	{ key = "LeftArrow", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(1) },
	{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.ScrollByLine(-1) },
	{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.ScrollByLine(1) },

	--Panes, with alt
	{ key = "LeftArrow", mods = "ALT|CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "LeftArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "RightArrow", mods = "ALT|CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "RightArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "UpArrow", mods = "ALT|CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "UpArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "ALT|CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "DownArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "w", mods = "ALT|CTRL", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = ",", mods = "ALT|CTRL", action = act.RotatePanes("CounterClockwise") },
	{ key = ".", mods = "ALT|CTRL", action = act.RotatePanes("Clockwise") },
	{ key = "z", mods = "ALT|CTRL", action = act.TogglePaneZoomState },
	{ key = "a", mods = "ALT|CTRL", action = act.PaneSelect({ mode = "Activate" }) },
	{ key = "s", mods = "ALT|CTRL", action = act.PaneSelect({ mode = "SwapWithActive" }) },
	{ key = "s", mods = "SHIFT|ALT|CTRL", action = act.PaneSelect({ mode = "SwapWithActiveKeepFocus" }) },
	{ key = "d", mods = "ALT|CTRL", action = act.PaneSelect({ mode = "MoveToNewTab" }) },

	-- Opposite to vim splits
	{ key = "V", mods = "SHIFT|ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "H", mods = "SHIFT|ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Transparency
	{ key = "+", mods = "ALT|CTRL", action = act.EmitEvent("increase-transparency") },
	{ key = "-", mods = "ALT|CTRL", action = act.EmitEvent("decrease-transparency") },
}

wezterm.plugin.require("https://github.com/yriveiro/wezterm-tabs").apply_to_config(config, { tabs = { tab_bar_at_bottom = false } })

return config
