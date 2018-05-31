require 'spec_helper_acceptance'

test_name 'simp_ipa class'

describe 'simp_ipa class' do
  let(:manifest) {
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
    end
  end
end
