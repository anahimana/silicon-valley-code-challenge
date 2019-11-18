require 'pry'
class VentureCapitalist
    attr_accessor :name, :net_worth
    @@all = []
    def initialize(name, net_worth)
        @name = name
        @net_worth = net_worth
        @@all << self
    end

    def total_worth()
        @net_worth
    end

    def self.all()
        @@all
    end

    def self.tres_commas_club()
        self.all.select {|vc| vc.net_worth.to_s.length >= 10}
    end
    
    def offer_contract(startup, type, amount)
        FundingRound.new(type, amount, self, startup)
    end

    def funding_rounds() 
        rounds = FundingRound.all.select{|round| round.venture_capitalist == self}
    end

    def portfolio()
        funding_rounds.map {|round| round.startup}
    end

    def biggest_investment()
        max_investment = funding_rounds.map {|round| round.investment}.max
        funding_rounds.find {|round| round.investment == max_investment}
    end

    def invested(domain_name)
        amount = 0
        funding_rounds.each do |round| 
            if round.startup.domain == domain_name
                amount += round.investment
            end
        end
        amount
    end
end
