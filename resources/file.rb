#
# Cookbook: blp-gemrc
# License: Apache 2.0
#
# Copyright 2013, OptimisCorp, Inc.
# Copyright 2014-2017, Bloomberg Finance L.P.
#

require 'yaml'
provides :gemrc_file

unified_mode true

property :path, String, name_property: true
property :owner, String, default: 'root'
property :group, String, default: lazy { node['root_group'] }
property :mode, String, default: '0644'

property :reload, [true, false], default: false
property :sensitive, [true, false], default: false
property :options, Hash, default: { 'gem' => '--no-ri --no-rdoc' }

def to_yaml
  config = {}
  symbols = %i(sources update_sources backtrace verbose bulk_threshold)
  options.each_pair do |k, v|
    if symbols.include?(k.to_sym)
      config[k.to_sym] = v
    else
      config[k] = v
    end
  end
  config.to_yaml
end

action :create do
  directory ::File.dirname(new_resource.path)

  r = file new_resource.path do
    content new_resource.to_yaml
    owner new_resource.owner unless windows?
    group new_resource.group unless windows?
    mode new_resource.mode unless windows?
    sensitive new_resource.sensitive
  end

  Gem.configuration = Gem::ConfigFile.new ["--config-file=#{new_resource.path}"] if new_resource.reload && r.updated_by_last_action?
end

action :delete do
  file new_resource.path do
    action :delete
  end
end
