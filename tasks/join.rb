#!/opt/puppetlabs/puppet/bin/ruby

require 'open3'
require_relative '../../ruby_task_helper/files/task_helper.rb'

# Task helper for joining an IPA domain
class IpaJoin < TaskHelper
  def task(
    server:     nil,
    hostname:   nil,
    password:   nil,
    principal:  nil,
    domain:     nil,
    realm:      nil,
    ip_address: nil,
    options:    nil,
    **_kwargs
  )

    opts = {
      'password'   => password,
      'principal'  => principal,
      'server'     => server,
      'ip-address' => ip_address,
      'domain'     => domain,
      'realm'      => realm,
      'hostname'   => hostname,
    }.map { |k, v| v.nil? ? next : "--#{k}=#{v}" }

    # interact with the system
    stdout, stderr, status = Open3.capture3("ipa-client-install --unattended #{opts.join(' ')} #{options}")
    raise "Failed to join domain #{stderr}" unless status.success?

    # provide output
    {
      stdout: stdout,
      stderr: stderr,
      status: status
    }
  end
end

if __FILE__ == $PROGRAM_NAME
  IpaJoin.run
end
