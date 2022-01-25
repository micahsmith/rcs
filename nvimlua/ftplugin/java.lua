local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1', '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product', '-Dlog.protocol=true',
        '-Dlog.level=ALL', '-Xms1g', '--add-modules=ALL-SYSTEM', '--add-opens',
        'java.base/java.util=ALL-UNNAMED', '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar',
        '/opt/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration', '/opt/jdtls/config_linux',
        -- See `data directory configuration` section in the README
        '-data', '/path/to/unique/per/project/workspace/folder'
    },

    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

    settings = {java = {}},
    init_options = {bundles = {}}
}

require('jdtls').start_or_attach(config)
