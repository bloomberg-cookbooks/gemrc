# blp-gemrc cookbook

[![Build Status](https://img.shields.io/travis/bloomberg-cookbooks/gemrc.svg)](https://travis-ci.org/bloomberg-cookbooks/gemrc)
[![Cookbook Version](https://img.shields.io/cookbook/v/blp-gemrc.svg)](https://supermarket.chef.io/cookbooks/blp-gemrc)
[![License](https://img.shields.io/github/license/bloomberg-cookbooks/gemrc.svg?maxAge=2592000)](http://www.apache.org/licenses/LICENSE-2.0)

The blp-gemrc cookbook is a library cookbook that provides a custom
resource for configuring the [gemrc file][0] for
a [RubyGems environment][1].

## Platforms

The following platforms are tested automatically
using [Test Kitchen][0], in Docker, with
the [default suite of integration tests][2]:

- Ubuntu 12.04/14.04/16.04
- CentOS (RHEL) 6/7

Additionally, the platforms below are also known to work:

- AIX 7.1
- Solaris 5.11
- Windows 2008r2/2012r2

## Recipes

The [default recipe][4] configures the embedded gem configuration of
the Chef Client. This allows for changing the gem sources that would
get pulled from during a normal convergence.

## Attributes

| Attribute Name | Type | Default Value | Description |
| -------------- | ---- | ------------- | ----------- |
| `node['gemrc']['config']` | Hash | `gem: '--no-ri --no-rdoc'` | Sets the options for the default recipe gemrc configuration. |

[0]: https://docs.ruby-lang.org/en/2.1.0/Gem/ConfigFile.html
[1]: https://rubygems.org/
[2]: https://github.com/bloomberg-cookbooks/gemrc/blob/master/test/integration/default/default_spec.rb
[3]: https://github.com/chef/omnibus
[4]: https://github.com/bloomberg-cookbooks/gemrc/blob/master/recipes/default.rb
