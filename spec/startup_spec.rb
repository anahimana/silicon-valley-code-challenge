require_relative '../app/models/startup'
require_relative '../app/models/venture_capitalist'

RSpec.describe Startup do
  describe "#name" do
    it "returns the name of a startup" do
      startup = Startup.new("TestToucher", "Elon Musk", "Software")
      expect(startup.name).to eq("TestToucher")
    end
    
  end

  describe "#founder" do
    it "returns the founder's name" do
      startup = Startup.new("TestToucher", "Elon Musk", "Software")
      expect(startup.founder).to eq("Elon Musk")
    end

    it "get error if attempting to change founder" do
      startup = Startup.new("TestToucher", "Elon Musk", "Software")
      expect { startup.founder = "Peter Parker" }.to raise_error(NoMethodError)
    end

  end

  describe "#domain" do
    it "returns the startup's domain" do
      startup = Startup.new("TestToucher", "Elon Musk", "Software")
      expect(startup.domain).to eq("Software")
    end

    it "get an error if attempting to change domain" do
      startup = Startup.new("TestToucher", "Elon Musk", "Software")
      expect { startup.domain = "Finance" }.to raise_error(NoMethodError)

    end
  end

  describe "#pivot" do
    it "change the domain and name of the startup" do
      startup = Startup.new("TestToucher", "Elon Musk", "Software")
      new_name = "BugChasers"
      new_domain = "Technology"
      startup.pivot(new_name, new_domain)
      expect(startup.name).to eq("BugChasers")
      expect(startup.domain).to eq("Technology")
    end
    
  end
  
  describe ".all" do
    it "returns all of the startup instances" do
      startup = Startup.new("TestToucher", "Elon Musk", "Software")
      startup2 = Startup.new("FreakyFinder", "Duck Dodger", "Something")
      startup3 = Startup.new("DoodleDodger", "Frank Muncher", "SNDY")
      startups = Startup.all
      expect(startups).to include(startup, startup2, startup3)
    end

  end

  describe ".find_by_founder" do
    it "returns the first startup whose founder's name matches" do
      startup = Startup.new("TestToucher", "Elon Musk", "Software")
      startup3 = Startup.new("DoodleDodger", "Frank Muncher", "SNDY")
      founder_startup = Startup.find_by_founder("Frank Muncher")
      founder_startup2 = Startup.find_by_founder("Elon Musk")
      expect(founder_startup).to be_a(Startup)
      expect(founder_startup2).to be_a(Startup)
    end

  end

  describe ".domains" do
    it "return an array of all of the different startup domains" do
      startup = Startup.new("TestToucher", "Elon Musk", "Software")
      startup3 = Startup.new("DoodleDodger", "Frank Muncher", "SNDY")
      startup_domains = Startup.domains
      expect(startup_domains).to be_a(Array)
      expect(startup_domains).to include("Software", "SNDY")
      expect(startup_domains).not_to include("SNY", "Softwire")
      
    end

  end

  describe "#add_investor" do
    it "can add an investor to startup" do
      startup = Startup.new("TestToucher", "Elon Musk", "Software")
      investor = VentureCapitalist.new("VC Unlimited", 100000)
      startup.add_investor(investor)
      expect(startup.investors).to be_a(Array)
      expect(startup.investors).to include(investor)
    end
  end

end