describe 'apache::default' do
  context 'on Ubuntu' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
        {
          :platform => 'ubuntu',
          :version => '14.04'
        }
      ).converge(described_recipe)
    end
    it 'should install the correct packages' do
      expect(chef_run).to install_package('httpd')
    end
  end

  context 'on CentOS' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
        {
          :platform => 'centos',
          :version => '6.5'
        }
      ).converge(described_recipe)
    end
    it 'should install the correct packages' do
      expect(chef_run).to install_package('httpd')
    end
  end
end
