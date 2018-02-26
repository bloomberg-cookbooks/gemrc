describe file('/opt/chef/embedded/etc/gemrc') do
  it { should exist }
  its('type') { should eq :file }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should eq 420 }
  its('content') { should match(%r{":sources":\n - http://rubygems.org/}) }
  its('content') { should match(%r{gem: "--no-ri --no-rdoc"}) }
end
