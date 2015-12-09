require 'spec_helper'

describe 'motd::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'does something' do
    skip 'need to write this test'
  end
end
