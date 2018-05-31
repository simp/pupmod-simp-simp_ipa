require 'spec_helper'

describe 'simp_ipa' do
  shared_examples_for "a structured module" do
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to create_class('simp_ipa') }
    it { is_expected.to contain_class('simp_ipa::install') }
  end

  context 'supported operating systems' do
    on_supported_os.each do |os, os_facts|
      context "on #{os}" do
        let(:facts) do
          os_facts
        end

        it_behaves_like "a structured module"
      end
    end
  end
end
