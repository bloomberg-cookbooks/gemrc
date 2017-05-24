node.default['gemrc']['path'] = Gem::ConfigFile::SYSTEM_WIDE_CONFIG_FILE
node.default['gemrc']['reload'] = true
node.default['gemrc']['config']['sources'] = ['http://rubygems.org/']
include_recipe 'gemrc::default'
