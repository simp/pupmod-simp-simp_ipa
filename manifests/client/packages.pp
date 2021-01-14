# Class to contain packages required for simp::simp_ipa::install
#
# @api private
#
class simp_ipa::client::packages {
  assert_private()

  package { 'ipa-client':
    ensure => $simp_ipa::client::install::ipa_client_ensure,
  }
}
