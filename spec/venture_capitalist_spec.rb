require_relative '../app/models/venture_capitalist'

RSpec.describe VentureCapitalist do
    describe "#name" do
        it "returns the venture capitalist's name" do
            vc = VentureCapitalist.new("VC Unlimited", 100000)
        expect(vc.name).to eq("VC Unlimited")
        end
    end

    describe "#total_worth" do
        it "returns the total worth of of investor" do
            vc = VentureCapitalist.new("VC Unlimited", 100000)
        expect(vc.total_worth).to eq(100000)
        end
    end

    describe ".all" do
        it "returns an array of all venture capitalists" do
            mark = VentureCapitalist.new("Mark", 1000000000)
            mohammad = VentureCapitalist.new("Mohammad", 30000000)
            jerico = VentureCapitalist.new("Jerico", 900000000)
            vcs = VentureCapitalist.all
        expect(vcs).to include(mark, mohammad, jerico)
        end
    end

    describe ".tres_commas_club" do
        it "returns an array of all venture capitalists in the Trés Commas club" do
            mitch = VentureCapitalist.new("Mitch", 6000000000)
            benjmain = VentureCapitalist.new("Benjamin", 200000)
            fsnb = VentureCapitalist.new("FSNB", 110929283747)
            three_comma_vcs = VentureCapitalist.tres_commas_club
        expect(three_comma_vcs).to include(mitch, fsnb)
        expect(three_comma_vcs).not_to include(benjmain)
        end
    end

end


