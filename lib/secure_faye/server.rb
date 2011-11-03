module SecureFaye
  require "faye"
  require "digest/sha1"
  require "acts_as_chain"
  
  class ServerAuth
    def incoming(message, callback)
      minutes = 10
      if message["channel"] !~ %r{^/meta/}
        token = Digest::SHA1.hexdigest([message["ext"]["sent"], message["data"], ENV["FAYE_TOKEN"], message["channel"]].join)
        if message["ext"]["auth_token"] != token
          message["error"] = "Token isn't valid."
        elsif message["ext"]["sent"].to_i < (Time.now.to_i - minutes * 60)
          message["error"] = "Message is older than #{minutes} minute(s)."
        end
      end
            
      callback.call(message)
    end
  end
  
  class Server
    acts_as_chain :mount, :timeout
    
    def initialize
      @timeout ||= 45
      @mount ||= "/faye"
      @faye_server = Faye::RackAdapter.new(mount: @mount, timeout: @timeout)
      @faye_server.add_extension(SecureFaye::ServerAuth.new)
    end
    
    def server
      @faye_server
    end
  end
end