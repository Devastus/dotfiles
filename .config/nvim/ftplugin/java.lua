-- local home = os.getenv('HOME')
-- local root_dir = require('jdtls.setup').find_root({'.git', 'pom.xml', 'mvnw', 'gradlew'})
-- local config = {
--     java = {
--         signatureHelp = { enabled = true };
--         sources = {
--             organizeImports = {
--                 starThreshold = 9999;
--                 staticStarThreshold = 9999;
--             };
--         };
--         codeGeneration = {
--             toString = {
--                 template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
--             }
--         };
--     },
--   -- The command that starts the language server
--     cmd = { "java-lsp.sh", root_dir },
--     -- cmd = {
--     -- '/usr/lib/jvm/default/bin/java',
--     'java',
--     '-Dosgi.bundles.defaultStartLevel=4',
--     -- ADD REMAINING OPTIONS FROM https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line !
--     -- '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044',
--     -- '-javaagent:$HOME/.local/jars/lombok.jar',
--     -- '-Xbootclasspath/a:$HOME/.local/jars/lombok.jar',
--     -- '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--     -- '-Dosgi.bundles.defaultStartLevel=4',
--     -- '-Declipse.product=org.eclipse.jdt.ls.core.product',
--     -- '-Dlog.protocol=true',
--     -- '-Dlog.level=ALL',
--     -- '-Xms1G',
--     -- '-Xmx2G',
--     -- '-jar /usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--     -- '-configuration /usr/share/java/jdtls/config_linux',
--     -- '-data ' .. home .. '/.local/share/eclipse/' .. vim.fn.fnamemodify(root_dir, ":p:h:t"),
--     -- '--add-modules=ALL-SYSTEM',
--     -- '--add-opens java.base/java.util=ALL-UNNAMED',
--     -- '--add-opens java.base/java.lang=ALL-UNNAMED'
--     -- },
--     root_dir = root_dir
-- }
-- require('jdtls').start_or_attach(config)
