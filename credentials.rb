# ⚠️ WARNING, CONTAINS CREDENTIALS ⚠️

class Credentials
  attr_reader :smtp_host, :smtp_port, :smtp_user, :smtp_pass, :auth_options, :name

  # netcup example
  def initialize
    @smtp_host = 'smtp host'
    @smtp_port = 587
    @smtp_user = 'a'
    @smtp_pass = 'b'
    @name = 'Max Musterman'
    @auth_options = {
      :enable_starttls_auto => true
      :authentication       => 'plain',
    }
  end

  # all-inkl example
  def other_example
    @smtp_host = 'smtp host'
    @smtp_port = 465
    @smtp_user = 'a'
    @smtp_pass = 'b'
    @name = 'Max Musterman'
    @auth_options = {
      :authentication       => :login,
      :ssl                  => true,
      :openssl_verify_mode  => 'none' #Use this because ssl is activated but we have no certificate installed. So clients need to confirm to use the untrusted url.
    }
  end
end
