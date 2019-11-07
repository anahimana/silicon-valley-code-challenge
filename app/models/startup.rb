require 'pry'
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
end
