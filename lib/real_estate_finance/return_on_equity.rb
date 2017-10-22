module RealEstateFinance
  class ReturnOnEquity

    attr_reader :monthly_income, :vacancies, :non_payments, :taxes, :mortgage_interest, :marketing, :advertising, :management, :legal, :accounting, :utilities, :repairs, :maintenance, :acquisition, :sale_costs, :interest_rate, :loan_principle, :capital_expenditures, :capital_expenditure_loans, :earned_interest, :state_income_tax, :federal_income_tax, :principle_invested

    def initialize(monthly_income, vacancies, non_payments, taxes, mortgage_interest, marketing, advertising, management, legal, accounting, utilities, repairs, maintenance, acquisition, sale_costs, interest_rate, loan_principle, capital_expenditures, capital_expenditure_loans, earned_interest, state_income_tax, federal_income_tax, principle_invested)
      @monthly_income = monthly_income
      @vacancies = vacancies
      @non_payments = non_payments
      @taxes = taxes
      @mortgage_interest = mortgage_interest
      @marketing = marketing
      @advertising = advertising
      @management = management
      @legal = legal
      @accounting = accounting
      @utilities = utilities
      @repairs = repairs
      @maintenance = maintenance
      @acquisition = acquisition
      @sale_costs = sale_costs
      @interest_rate = interest_rate
      @loan_principle = loan_principle
      @capital_expenditures = capital_expenditures
      @capital_expenditure_loans = capital_expenditure_loans
      @earned_interest = earned_interest
      @state_income_tax = state_income_tax
      @federal_income_tax = federal_income_tax
      @principle_invested = principle_invested
    end

    def return_on_equity
      gpi = sprintf("%0.02f", (@monthly_income * 12)).to_f
      credit_losses = [@vacancies, @non_payments, @taxes, @mortgage_interest, @marketing, @advertising, @management, @legal, @accounting, @utilities, @repairs, @maintenance, @acquisition, @sale_costs]
      total_expenses = credit_losses.reduce(:+)
      expenses = sprintf("%0.02f", total_expenses).to_f
      noi = gpi - expenses

      credit_losses = [@capital_expenditure_loans, @capital_expenditures, sprintf("%0.02f", (@interest_rate / (100))).to_f, @loan_principle]
      credit_surpluses = @earned_interest
      cfbt = sprintf("%0.02f", ((noi - credit_losses.reduce(:+)) + credit_surpluses)).to_f
      cfat = sprintf("%0.02f", (cfbt - sprintf("%0.02f", (@state_income_tax + @federal_income_tax)).to_f)).to_f
      roq = sprintf("%0.02f", (cfat + @principle_invested)).to_f
    end

  end
end
