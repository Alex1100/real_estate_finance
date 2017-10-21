module RealEstateFinance
  class EstimatedPropertyValueByGRM

    attr_reader :market_value, :monthly_income

    def initialize(market_value, monthly_income)
      @market_value = market_value
      @monthly_income = monthly_income
    end

    def estimated_property_value
      annual_gross_potential_income = sprintf("%0.02f", (@monthly_income * 12)).to_f
      calculation = @market_value.to_i / (annual_gross_potential_income)
      grm = sprintf("%0.03f", calculation).to_f
      property_value_by_grm = sprintf("%0.02f", (grm * annual_gross_potential_income)).to_f
    end

  end
end
