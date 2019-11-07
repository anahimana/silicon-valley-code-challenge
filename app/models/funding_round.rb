class FundingRound
    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist
    @@all = []
    def initialize(type, investment, vc, startup )
        @type = type
        @investment = investment
        @startup = startup
        @venture_capitalist = vc
        @@all << self
    end

    def self.all()
        @@all
    end
end
