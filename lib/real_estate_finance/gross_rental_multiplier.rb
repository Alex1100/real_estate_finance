module RealEstateFinance
  class GrossRentalMultiplier

    attr_reader :market_value, :monthly_income

    def initialize(market_value, monthly_income)
      @market_value = market_value
      @monthly_income = monthly_income
    end

    def gross_rental_multiplier
      annual_gross_potential_income = sprintf("%0.02f", (@monthly_income * 12)).to_f
      calculation = @market_value.to_i / (annual_gross_potential_income)
      sprintf("%0.03f", calculation).to_f
    end

  end
end
