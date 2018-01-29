class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    transactions.unshift("#{Time.now.strftime("%d/%m/%Y")} || #{sprintf('%.2f', amount)} || || #{sprintf('%.2f', @balance)}")
  end

  def withdraw(amount)
    @balance -= amount
    transactions.unshift("#{Time.now.strftime("%d/%m/%Y")} || || #{sprintf('%.2f', amount)} || #{sprintf('%.2f', @balance)}")
  end

  def print_statement
    puts header
  end

  private

  def header
    "date || credit || debit || balance\n"
  end
end
