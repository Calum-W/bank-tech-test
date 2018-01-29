class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    record_transaction(amount, false)
  end

  def withdraw(amount)
    @balance -= amount
    record_transaction(false, amount)
  end

  def print_statement
    puts header + @transactions.join("\n")
  end

  private

  def header
    "date || credit || debit || balance\n"
  end

  def record_transaction(deposited_amount, withdrawn_amount)
    transactions.unshift("#{current_time} || #{sprintf('%.2f', deposited_amount) + " " if deposited_amount}|| #{sprintf('%.2f', withdrawn_amount) + " " if withdrawn_amount}|| #{sprintf('%.2f', @balance)}")
  end

  def current_time
    Time.now.strftime("%d/%m/%Y")
  end
end
