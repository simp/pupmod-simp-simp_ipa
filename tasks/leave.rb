#!/opt/puppetlabs/puppet/bin/ruby

require 'open3'
require_relative "../../ruby_task_helper/files/task_helper.rb"

class IpaLeave < TaskHelper
  def task(
    options: nil,
    **kwargs
  )

  # interact with the system
  stdout, stderr, status = Open3.capture3("ipa-client-install --unattended --uninstall #{options}")
  raise "Failed to join domain #{stderr}" unless status.success?

  # provide output
  {
    stdout: stdout,
    stderr: stderr,
    status: status
  }
  end
end

if __FILE__ == $0
  IpaLeave.run
end
