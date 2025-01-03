local config = {}
local wezterm = require('wezterm')

config.font = wezterm.font_with_fallback{
	-- 'GohuFont 11 Nerd Font Mono',
	'CodeNewRoman Nerd Font Mono',
	'Hasklug Nerd Font Mono',
	'JetBrains Mono',
	'Ubuntu',
}

config.font_size = 10

config.default_prog = {
	'/opt/homebrew/bin/tmux',
	'new',
	'-A',
	'-s',
	'root',
}

config.color_scheme = 'GruvboxDarkHard'

config.enable_tab_bar = false
config.enable_scroll_bar = false
config.adjust_window_size_when_changing_font_size = false

config.window_padding = {
	top = 1,
	left = 1,
	right = 1,
	bottom = 1,
}

config.window_close_confirmation = 'NeverPrompt'

config.native_macos_fullscreen_mode = true
config.disable_default_key_bindings = true
config.keys = {
	{
		key = 'c',
		mods = 'SUPER',
		action = wezterm.action.CopyTo('Clipboard'),
	},
	{
		key = 'v',
		mods = 'SUPER',
		action = wezterm.action.PasteFrom('Clipboard'),
	},

	{
		key = 'c',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.CopyTo('Clipboard'),
	},
	{
		key = 'v',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.PasteFrom('Clipboard'),
	},

	{
		key = 'n',
		mods = 'SUPER',
		action = wezterm.action.SpawnWindow,
	},
	{
		key = 'n',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.SpawnWindow,
	},

	{
		key = 'k',
		mods = 'SUPER',
		-- zsh clear screen
		-- && tmux clear-history (scrollback buffer)
		action = wezterm.action.Multiple {
			-- zsh seq
			-- bindkey "^L" clear-screen
			wezterm.action.SendKey {
				key = 'l',
				mods = 'CTRL',
			},

			-- tmux seq
			-- https://github.com/fuadop/zsh-config/commit/d07b24955acfa99be5a50f766e493b0ccc27c195
			wezterm.action.SendKey {
				key = 'l',
				mods = 'META|CTRL'
			},
		},
	},

	{
		key = '-',
		mods = 'SUPER',
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = '-',
		mods = 'CTRL',
		action = wezterm.action.DecreaseFontSize,
	},

	{
		key = '=',
		mods = 'SUPER',
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = '=',
		mods = 'CTRL',
		action = wezterm.action.IncreaseFontSize,
	},

	{
		key = '0',
		mods = 'SUPER',
		action = wezterm.action.ResetFontSize,
	},
	{
		key = '0',
		mods = 'CTRL',
		action = wezterm.action.ResetFontSize,
	},

	{
		key = 'r',
		mods = 'SUPER',
		action = wezterm.action.ReloadConfiguration,
	},
	{
		key = 'r',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.ReloadConfiguration,
	},

	{
		key = 'h',
		mods = 'SUPER',
		action = wezterm.action.HideApplication,
	},

	{
		key = 'l',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.ShowDebugOverlay,
	},

	{
		key = 'q',
		mods = 'SUPER',
		action = wezterm.action.QuitApplication,
	},
}

return config

