class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
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
