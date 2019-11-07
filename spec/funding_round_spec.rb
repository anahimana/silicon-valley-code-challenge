require_relative '../app/models/funding_round'
require_relative '../app/models/startup'
require_relative '../app/models/venture_capitalist'

RSpec.describe FundingRound do
    describe "#startup" do
        it "returns the startup object for that given funding round" do
            vc = VentureCapitalist.new("VC Unlimited", 1000000000)
            startup = Startup.new("TestToucher", "Elon Musk", "Software")
            funding_round = FundingRound.new("Seed", 1000, vc, startup)
        expect(funding_round.startup).to eq(startup)
        end

        it "Raises an error when attempting to change startup" do
            vc = VentureCapitalist.new("VC Unlimited", 1000000000)
            startup = Startup.new("TestToucher", "Elon Musk", "Software")
            new_startup = Startup.new("TestToucher", "Elon Musk", "Software")
            funding_round = FundingRound.new("Seed", 1000, vc, startup)
        expect { funding_round.startup = new_startup }.to raise_error(NoMethodError)
        end
    end

    describe "#venture_capitalist" do
        it "returns the venture capitalist object for that given funding round" do
            vc = VentureCapitalist.new("JJ Investing", 1000000000)
            startup = Startup.new("GetMoney", "Zachary Fuller", "Software")
            funding_round = FundingRound.new("Seed", 1000, vc, startup)
        expect(funding_round.venture_capitalist).to eq(vc)
        end

        it "Raises an error when attempting to change the venture capitalist" do
            vc = VentureCapitalist.new("VC Unlimited", 1000000000)
            startup = Startup.new("Jack Jack", "Miller Fuller", "Software")
            new_vc = VentureCapitalist.new("D DD", 1000000000)
            funding_round = FundingRound.new("Seed", 1000, vc, startup)
        expect { funding_round.venture_capitalist = new_vc }.to raise_error(NoMethodError)
        end
    end

    describe "#type" do
        it "returns the type of funding round" do
            vc = VentureCapitalist.new("JJ Investing", 1000000000)
            startup = Startup.new("GetMoney", "Zachary Fuller", "Software")
            funding_round = FundingRound.new("Pre-Seed", 1000, vc, startup)
            funding_round2 = FundingRound.new("Series A", 300000, vc, startup)
        expect(funding_round.type).to eq("Pre-Seed")
        expect(funding_round2.type).to eq("Series A")
        end
    end

    describe "#investment" do
        it "returns the amount invested during this funding round" do
            vc = VentureCapitalist.new("F Mae Lou", 1000000000)
            startup = Startup.new("Lumens", "Frido Lay", "Software")
            funding_round = FundingRound.new("Pre-Seed", 1000, vc, startup)
            funding_round2 = FundingRound.new("Series A", 300000, vc, startup)
        expect(funding_round.investment).to eq(1000)
        expect(funding_round2.investment).to eq(300000)
        end
    end

    describe ".all" do
        it "returns all of the funding rounds" do
            vc = VentureCapitalist.new("F Mae Lou", 1000000000)
            startup = Startup.new("Lumens", "Frido Lay", "Software")
            funding_round = FundingRound.new("Angel", 1000, vc, startup)
            funding_round2 = FundingRound.new("Series C", 300000, vc, startup)
        expect(FundingRound.all).to include(funding_round, funding_round2)
        end
    end

end