local function on_language_status(_, result)
    local command = vim.api.nvim_command
    command 'echohl ModeMsg'
    command(string.format('echo "%s"', result.message))
    command 'echohl None'
end

return {
    cmd = {
        'java',
        '-javaagent:/home/bshepherd/bin/lombok-1.18.30.jar',
	    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
	    '-Dosgi.bundles.defaultStartLevel=4',
	    '-Declipse.product=org.eclipse.jdt.ls.core.product',
	    '-Dlog.level=ALL',
	    '-Xmx20G',
	    '--add-modules=ALL-SYSTEM',
	    '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
	    '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',
	    '-jar',
        '/home/bshepherd/bin/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
	    '-configuration',
        '/home/bshepherd/bin/jdtls/config_linux',
	    '-data',
        '/home/bshepherd/.workspace/'
    },

    root_markers = { 'build.gradle', 'gradle.properties', '.git' },

    filetypes = { 'java' },

    settings = {},

    single_file_support = true,

    handlers = {
        ['language/status'] = vim.schedule_wrap(on_language_status),
    }
}
