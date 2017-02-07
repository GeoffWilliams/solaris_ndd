require 'spec_helper'
describe 'solaris_ndd' do
  context 'with default values for all parameters' do
    it { should contain_class('solaris_ndd') }
  end
end
