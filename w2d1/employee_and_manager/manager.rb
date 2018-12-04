class Manager < Employee

# some code within initialize that allows us to say who manager works over

    def initialize(name, title, salary, boss, employees)
        @employees = []
        super
    end
end