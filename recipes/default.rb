#
# Cookbook: blp-gemrc
# License: Apache 2.0
#
# Copyright 2013, OptimisCorp, Inc.
# Copyright 2014-2017, Bloomberg Finance L.P.
#

gemrc_file Gem::ConfigFile::SYSTEM_WIDE_CONFIG_FILE do
  options node['gemrc']['config'].to_h
  reload true
  owner 'root'
  group node['root_group']
  mode '0644'
end.run_action(:create)
