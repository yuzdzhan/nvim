local lsp = require("lsp-zero")

lsp.preset("recommended")

------------------------
-- Formatting
------------------------

lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
	"intelephense",
	"cssls",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
	["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
	-- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<C-f>", function() vim.lsp.buf.format { async = true } end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.settingsa = {
	intelephense = {
		-- Add wordpress to the list of stubs
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
			"phpunit",
		},
		diagnostics = {
			enable = true,
		},
	},
}

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
