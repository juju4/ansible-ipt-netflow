require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

#describe package('fprobe-ulog'), :if => os[:family] == 'redhat' do
#  it { should be_installed }
#end

#describe package('fprobe'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
#  it { should be_installed }
#end

describe file('/lib/modules/4.4.0-31-generic/extra/ipt_NETFLOW.ko'), :if => os[:family] == 'ubuntu' && os[:release] == '16.04' do
  it { should be_readable }
end
describe file('/lib/modules/3.13.0-92-generic/extra/ipt_NETFLOW.ko'), :if => os[:family] == 'ubuntu' && os[:release] == '14.04' do
  it { should be_readable }
end
describe file('/lib/modules/3.2.0-106-generic/extra/ipt_NETFLOW.ko'), :if => os[:family] == 'ubuntu' && os[:release] == '12.04' do
  it { should be_readable }
end
describe kernel_module('ipt_NETFLOW') do
  it { should be_loaded }
end
describe file('/etc/modprobe.d/ipt_netflow.conf') do
  it { should be_readable }
end

