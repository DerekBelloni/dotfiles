return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").lua_ls.setup({})

			-- Setup for Go LSP
			require("lspconfig").gopls.setup({
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
						usePlaceholders = true,
						completeUnimported = true,
					},
				},
			})
			-- TypeScript/JavaScript LSP setup (using ts_ls instead of tsserver)
			require("lspconfig").ts_ls.setup({
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
			})

			-- C/C++ LSP setup
			require("lspconfig").clangd.setup({
				cmd = {
					"clangd",
					"--background-index",
					"--suggest-missing-includes",
					"--clang-tidy",
					"--header-insertion=iwyu",
				},
			})

			-- PHP/Laravel LSP setup
			require("lspconfig").intelephense.setup({
				settings = {
					intelephense = {
						stubs = {
							"apache",
							"bcmath",
							"bz2",
							"calendar",
							"com_dotnet",
							"Core",
							"ctype",
							"curl",
							"date",
							"dba",
							"dom",
							"enchant",
							"exif",
							"FFI",
							"fileinfo",
							"filter",
							"fpm",
							"ftp",
							"gd",
							"gettext",
							"gmp",
							"hash",
							"iconv",
							"imap",
							"intl",
							"json",
							"ldap",
							"libxml",
							"mbstring",
							"meta",
							"mysqli",
							"oci8",
							"odbc",
							"openssl",
							"pcntl",
							"pcre",
							"PDO",
							"pdo_ibm",
							"pdo_mysql",
							"pdo_pgsql",
							"pdo_sqlite",
							"pgsql",
							"Phar",
							"posix",
							"pspell",
							"readline",
							"Reflection",
							"session",
							"shmop",
							"SimpleXML",
							"snmp",
							"soap",
							"sockets",
							"sodium",
							"SPL",
							"sqlite3",
							"standard",
							"superglobals",
							"sysvmsg",
							"sysvsem",
							"sysvshm",
							"tidy",
							"tokenizer",
							"xml",
							"xmlreader",
							"xmlrpc",
							"xmlwriter",
							"xsl",
							"Zend OPcache",
							"zip",
							"zlib",
							"wordpress",
							"laravel",
							"blade",
						},
						files = {
							maxSize = 5000000,
						},
						environment = {
							includePaths = {},
						},
						completion = {
							insertUseDeclaration = true,
							fullyQualifyGlobalConstantsAndFunctions = false,
						},
					},
				},
			})
			-- YAML LSP setup
			require("lspconfig").yamlls.setup({
				settings = {
					yaml = {
						format = {
							enable = true, -- Enable formatting
							singleQuote = true, -- Prefer single quotes
							printWidth = 80, -- Line length
						},
						validate = true, -- Enable validation
						hover = true, -- Enable hover information
						completion = true, -- Enable autocompletion
						schemas = {
							["https://json.schemastore.org/docker-compose.json"] = "docker-compose*.{yml,yaml}", -- Schema for Docker Compose
						},
					},
				},
			})
			-- HTML LSP setup
			require("lspconfig").html.setup({
				cmd = { "vscode-html-language-server", "--stdio" },
				filetypes = { "html" },
				settings = {
					html = {
						format = {
							enable = true, -- Enable formatting
							templating = true, -- Support for templating (e.g., Laravel Blade, if used)
							wrapLineLength = 80, -- Match your YAML printWidth
							indentInnerHtml = true, -- Indent <head> and <body>
							preserveNewLines = true,
						},
						hover = {
							documentation = true, -- Show documentation on hover
							references = true, -- Show references on hover
						},
						completion = {
							attributeDefaultValue = "doublequotes", -- Use double quotes for attributes
						},
					},
				},
				on_attach = function(client, bufnr)
					-- Consistent with your other LSPs, add custom keybindings here if desired
					print("HTML LSP attached to buffer " .. bufnr)
				end,
				capabilities = vim.lsp.protocol.make_client_capabilities(), -- Basic LSP capabilities
			})
		end,
	},
}
