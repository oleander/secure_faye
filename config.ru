require "secure_faye/server"
unless ENV["FAYE_TOKEN"]
  abort("You must specify a FAYE_TOKEN.")
end

SecureFaye::Server.new.start!