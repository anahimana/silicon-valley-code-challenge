require_relative '../app/models/startup'

RSpec.describe Startup do
    describe "#name" do
      it "retutns the name of a startup" do
        startup = Startup.new("TestToucher")
        expect(startup.name).to eq("TestToucher")
      end
    end

end