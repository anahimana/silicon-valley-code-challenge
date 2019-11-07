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
end
