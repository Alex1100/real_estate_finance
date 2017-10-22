module RealEstateFinance
  class CashFlowBeforeTaxes

    attr_reader :monthly_income, :vacancies, :non_payments, :taxes, :mortgage_interest, :marketing, :advertising, :management, :legal, :accounting, :utilities, :repairs, :maintenance, :acquisition, :sale_costs, :interest_rate, :loan_principle, :capital_expenditures, :capital_expenditure_loans, :earned_interest

    def initialize(monthly_income, vacancies, non_payments, taxes, mortgage_interest, marketing, advertising, management, legal, accounting, utilities, repairs, maintenance, acquisition, sale_costs, interest_rate, loan_principle, capital_expenditures, capital_expenditure_loans, earned_interest)
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
    end

    def cash_flow_before_taxes
      gpi = sprintf("%0.02f", (@monthly_income * 12)).to_f
      credit_losses = [@vacancies, @non_payments, @taxes, @mortgage_interest, @marketing, @advertising, @management, @legal, @accounting, @utilities, @repairs, @maintenance, @acquisition, @sale_costs]
      total_expenses = credit_losses.reduce(:+)
      expenses = sprintf("%0.02f", total_expenses).to_f
      noi = gpi - expenses

      credit_losses = [@capital_expenditure_loans, @capital_expenditures, sprintf("%0.02f", (@interest_rate / (100))).to_f, @loan_principle]
      credit_surpluses = @earned_interest
      cfbt = sprintf("%0.02f", ((noi - credit_losses.reduce(:+)) + credit_surpluses)).to_f
    end

  end
end
