require_relative './funding_round'
require_relative './venture_capitalist'

class Startup
    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        @name, @domain = name, domain
    end

    def self.all()
        @@all
    end

    def self.find_by_founder(name)
        self.all.find {|startup| startup.founder == name}
    end

    def self.domains()
        self.all.map {|startup| startup.domain}.uniq
    end

    def sign_contract(vc, type, amount)
        new_fr = FundingRound.new(type, amount, vc, self)
    end

    def funding_rounds 
        rounds = FundingRound.all.select{|rounds| rounds.startup == self}
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def investors 
        funding_rounds.map {|round| round.venture_capitalist}.uniq
    end

    def total_funds
        funding_rounds.map {|round| round.investment }.sum
    end

    def big_investors
        VentureCapitalist.tres_commas_club.select {|vc| investors.include?(vc)}
    end
end
