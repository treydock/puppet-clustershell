require 'spec_helper'

describe 'clustershell::groupmember' do
  let(:facts) {{ :osfamily => "RedHat" }}

  let(:title) { 'foo' }

  let(:params) {{ :group => 'bar' }}

  it { should create_clustershell__groupmember('foo') }

  it do
    should contain_datacat_fragment('clustershell::groupmember foo').with({
      :target   => 'clustershell-groups',
      :data     => {
        'bar' => ['foo'],
      },
    })
  end
end
