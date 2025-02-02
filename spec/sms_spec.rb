require 'sms'

describe SMS do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages) }
  let(:config) { { account_sid: "1234", auth_token: "23fds", from: "+245", to: "+44", body: "Thank you! Your order will be delivered before %s" } }

  it "should deliver an SMS with estimated time" do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order will be delivered before 18:52"
    }
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    expect(messages).to receive(:create).with(args)
    sms.deliver
  end
end
