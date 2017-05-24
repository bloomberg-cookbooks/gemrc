name 'default'
default_source :community
cookbook 'gemrc', path: '.'
run_list 'gemrc::default'
named_run_list :freebsd, 'freebsd::default', run_list
named_run_list :centos, 'redhat::default', run_list
named_run_list :debian, 'ubuntu::default', run_list
named_run_list :windows, 'windows::default', run_list
