require 'spec_helper_acceptance'

test_name 'simp_ipa class'

describe 'simp_ipa class' do
  let(:manifest) {
    #FIXME This tests nothing. The simp_ipa class is empty.
    <<-EOS
      class { 'simp_ipa': }
    EOS
  }

  hosts.each do |host|
    context "on #{host}" do
      it 'should work with no errors' do
        apply_manifest_on(host, manifest, :catch_failures => true)
      end

      it 'should be idempotent' do
        apply_manifest_on(host, manifest, :catch_changes => true)
      end

      # simp_ipa::client::install is tested somewhat in the simp-core ipa suite
      it 'should test simp_ipa::client::install'

      # tasks not yet tested
      it 'should test join task'
      it 'should test leave task'
    end
  end
end
