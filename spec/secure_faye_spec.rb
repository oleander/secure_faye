describe SecureFaye do
  before(:each) do
    @socket = SecureFaye.new.message("m").token(ENV["FAYE_TOKEN"]).server("http://0.0.0.0:9292/faye").channel("c")
  end
  
  it "should be able to send a message" do
    puts @socket.send!
  end
end