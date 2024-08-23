return {
	"eatgrass/maven.nvim",
	enabled = false,
	cmd = { "Maven", "MavenExec" },
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("maven").setup({
			executable = "./mvnw",
		})
	end,
}
