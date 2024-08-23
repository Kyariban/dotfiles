return {
	"nvim-java/nvim-java",
	config = function()
		require("java").setup({
			jdk = {
				auto_install = false,
			},
		})
		require("lspconfig").jdtls.setup({
			before_init = function(_, config)
				config.cmd = vim.list_extend(config.cmd, { "-parameters" })
			end,
			settings = {
				java = {
					configuration = {
						runtimes = {
							{
								name = "JavaSE-21",
								path = "/Users/thibaultleboulch/.sdkman/candidates/java/21.0.4-amzn",
								default = true,
							},
						},
					},
				},
			},
		})
	end,
}
