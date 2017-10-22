module RealEstateFinance
  class BreakEvenRatio

    attr_reader :interest_rate, :loan_principle, :marketing, :advertising, :management, :legal, :accounting, :utilities, :repairs, :maintenance, :monthly_income, :estimated_loss_percentage

    def initialize(interest_rate, loan_principle, marketing, advertising, management, legal, accounting, utilities, repairs, maintenance, monthly_income, estimated_loss_percentage)
      @interest_rate = interest_rate
      @loan_principle = loan_principle
      @marketing = marketing
      @advertising = advertising
      @management = management
      @legal = legal
      @accounting = accounting
      @utilities = utilities
      @repairs = repairs
      @maintenance = maintenance
      @monthly_income = monthly_income
      @estimated_loss_percentage = estimated_loss_percentage
    end

    def break_even_ratio
      interest_rate_formatted = sprintf("%0.02f", @interest_rate / (100)).to_f
      interest_dollar_amount = sprintf("%0.02f", (interest_rate_formatted * @loan_principle) + @loan_principle).to_f

      credit_losses = [@marketing, @advertising, @management, @legal, @accounting, @utilities, @repairs, @maintenance]
      operating_expenses = credit_losses.reduce(:+)

      total_expenses = sprintf("%0.02f", (interest_dollar_amount + operating_expenses)).to_f

      agi = sprintf("%0.02f", (@monthly_income * 12)).to_f
      loss_percentage = sprintf("%0.02f", @estimated_loss_percentage.to_i / (100.to_f)).to_f

      goi = sprintf("%0.02f", (agi * loss_percentage)).to_f

      ber = sprintf("%0.02f", (total_expenses / (goi))).to_f
    end

  end
end
