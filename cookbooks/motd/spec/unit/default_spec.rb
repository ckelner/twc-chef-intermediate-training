require 'spec_helper'

describe 'motd::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'creates an motd correctly' do
    expect(chef_run).to create_template('/etc/motd').with(
      user: 'root',
      group: 'root',
      mode: '0644'
    )
  end
end
