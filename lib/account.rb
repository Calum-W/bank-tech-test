class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    transactions.unshift(Time.now.strftime("%d/%m/%Y") + " || 1000.00 || || 1000.00")
  end

  def withdraw(amount)
    @balance -= amount
  end

  def print_statement
    puts header
  end

  private

  def header
    "date || credit || debit || balance\n"
  end
end
