require 'spec_helper'
describe 'solaris_ndd', :type => :define do
  context 'compiles when invoked correctly' do
    let :title do
      "dev->blah"
    end
    let :params do
      {
        :value => 0,
      }
    end
    it { should compile }
  end

  context "errors when title (key) not in correct format" do
    let :title do
      "this title is not in the correct format"
    end
    let :params do
      {
        :value => 0,
      }
    end
    it {
      expect {
        is_expected.to compile.and_raise(Puppet::Error, /Incorrect key/)
      }
    }
  end


end
