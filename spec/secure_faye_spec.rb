describe SecureFaye do
  before(:each) do
    @socket = SecureFaye::Connect.new.message("m").token(ENV["FAYE_TOKEN"]).server("http://0.0.0.0:9292/faye").channel("c")
  end
  
  # TODO: Add more tests
  it "should be able to send a message" do
    lambda {
      @socket.send!
    }.should_not raise_error(RestClient::Exception)
  end
end