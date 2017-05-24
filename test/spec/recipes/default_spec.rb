require 'spec_helper'

describe 'gemrc::default' do
  context 'with default node attributes' do
    cached(:chef_run) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04').converge('gemrc::default') }
    let(:gemrc_file) { chef_run.gemrc_file('/root/.gemrc') }
    let(:ruby_block) { chef_run.ruby_block('reload-gem-configuration') }

    it { expect(chef_run).to create_gemrc_file('/root/.gemrc').at_compile_time }
    it { expect(gemrc_file).to notify('ruby_block[reload-gem-configuration]').to(:run).immediately }
    it { expect(ruby_block).to do_nothing }
  end

  context "with node['gemrc']['reload'] = true" do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
        node.override['gemrc']['reload'] = true
      end.converge('gemrc::default')
    end
    let(:gemrc_file) { chef_run.gemrc_file('/root/.gemrc') }
    let(:ruby_block) { chef_run.ruby_block('reload-gem-configuration') }

    it { expect(chef_run).to create_gemrc_file('/root/.gemrc').at_compile_time }
    it { expect(gemrc_file).to notify('ruby_block[reload-gem-configuration]').to(:run).immediately }
    it { expect(ruby_block).to do_nothing }
  end
end
