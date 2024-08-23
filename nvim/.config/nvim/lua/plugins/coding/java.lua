return {
	"nvim-java/nvim-java",
	config = function()
		require("java").setup()
		require("lspconfig").jdtls.setup({
			settings = {
				java = {
					configuration = {
						runtimes = {
							{
								name = "JavaSE-21",
								path = "/Users/thibaultleboulch/.sdkman/candidates/java/21.0.4-amzn",
								default = true,
							},
							{
								name = "JavaSE-17",
								path = "/Users/thibaultleboulch/.sdkman/candidates/java/17.0.12-amzn",
								default = false,
							},
						},
					},
				},
			},
		})
	end,
}
