return {
	"nvim-java/nvim-java",
	config = function()
		require("java").setup({
			root_markers = {
				"settings.gradle",
				"settings.gradle.kts",
				"pom.xml",
				"build.gradle",
				"mvnw",
				"gradlew",
				"build.gradle",
				"build.gradle.kts",
				".git",
			},

			-- load java test plugins
			java_test = {
				enable = true,
			},

			-- load java debugger plugins
			java_debug_adapter = {
				enable = true,
			},

			spring_boot_tools = {
				enable = true,
			},

			jdk = {
				auto_install = false,
			},

			notifications = {
				dap = false,
			},

			verification = {
				invalid_order = true,
				duplicate_setup_calls = true,
				invalid_mason_registry = true,
			},
		})
		require("lspconfig").jdtls.setup({
			before_init = function(_, config)
				config.cmd = vim.list_extend(config.cmd, { "-parameters" })
			end,
			handlers = {
				["$/progress"] = function(_, result, ctx) end,
			},
			settings = {
				java = {
					format = {
						settings = {
							profile = "nvim gestion",
							url = "file:///Users/thibaultleboulch/.config/nvim/lang-config/GoogleStyle.xml",
						},
					},
					configuration = {
						runtimes = {
							{
								name = "JavaSE-21",
								path = "/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home",
								default = true,
							},
						},
					},
				},
			},
		})
	end,
}
