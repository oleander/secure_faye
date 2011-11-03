require "rest-client"
require "digest/sha1"
require "acts_as_chain"
require "jsonify"

module SecureFaye
  class Connect
    acts_as_chain :message, :token, :channel, :server
  
    def send!
      time = Time.now.to_i
      RestClient.post(@server, message: {
        channel: @channel, 
        data: @message,
        ext: {
          auth_token: Digest::SHA1.hexdigest([time, @message, @token, @channel].join),
          sent: time
        }
      }.to_json)
    end
  end
end
