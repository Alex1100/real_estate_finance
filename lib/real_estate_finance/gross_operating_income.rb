module RealEstateFinance
  class GrossOperatingIncome

    attr_reader :monthly_income, :estimated_loss_percentage

    def initialize(monthly_income, estimated_loss_percentage)
      @monthly_income = monthly_income
      @estimated_loss_percentage = estimated_loss_percentage
    end

    def gross_operating_income
      agi = sprintf("%0.02f", (@monthly_income * 12)).to_f
      loss_percentage = sprintf("%0.02f", @estimated_loss_percentage.to_i / (100.to_f)).to_f
      estimated_loss = sprintf("%0.02f", (agi * loss_percentage)).to_f
    end

  end
end
