local plugins = {
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require'treesitter-context'.setup {
      enable = true, -- 启用插件
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    }
    end
  },
	{
    "github/copilot.vim",
		lazy = false,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim", lazy = false,
    dependencies = {
        { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
        -- See Configuration section for options
		},
    -- See Commands section for default commands if you want to lazy load on them
	},
	{
	  "GCBallesteros/jupytext.nvim",
	  config = true,
	  -- Depending on your nvim distro or config you may need to make the loading not lazy
	  lazy=false,
	},
	{
	  "NvChad/nvterm",
	  config = function ()
	    require("nvterm").setup()
	  end,
	},
	{
	  "olimorris/codecompanion.nvim", lazy = false,
	  --config = true,
	  dependencies = {
	    "nvim-lua/plenary.nvim",
	    "nvim-treesitter/nvim-treesitter",
	  },
		config = function()
    	require("codecompanion").setup({
    	  adapters = {
    	    deepseek = function()
    	      return require("codecompanion.adapters").extend("deepseek", {
    	        env = {
    	          api_key = "sk-d4cb97a6624d435ca0816c251106772b",
    	        },
    	      })
    	    end,
    	  },
    	  strategies = {
    	    chat = { adapter = "deepseek", },
    	    inline = { adapter = "deepseek" },
    	    agent = { adapter = "deepseek" },
    	  },
    	})
  	end
	}
}

return plugins

