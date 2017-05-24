name 'default'
default_source :community
default_source :chef_repo, '..'
cookbook 'gemrc', path: '../../..'
run_list 'test::default'
