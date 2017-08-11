describe file('/opt/chef/embedded/etc/gemrc') do
  it { should exist }
  its('type') { should eq :file }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should eq 420 }
  its('content') { should eq <<-GEMRC }
---
gem: "--no-ri --no-rdoc"
":sources":
- http://rubygems.org/
GEMRC
end
