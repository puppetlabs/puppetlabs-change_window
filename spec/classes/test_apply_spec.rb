require 'spec_helper'

describe 'test_apply', type: :class do
  context 'on all OSes' do
    let :facts do
      {
        id: 'root',
        kernel: 'Linux',
        osfamily: 'RedHat',
        operatingsystem: 'RedHat',
        operatingsystemrelease: '6',
        concat_basedir: '/dne',
        path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        is_pe: false,
      }
    end

    it { is_expected.to contain_class('test_notify_simple') }
    it { is_expected.to contain_class('test_notify_parameter') }
    it { is_expected.to contain_notify('test_notify_parameter').with_noop(true) }
    it { is_expected.to contain_notify('test_notify_simple').without_noop }
  end
end
