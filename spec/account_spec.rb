require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'initialises with a balance of 0' do
    expect(account.balance).to eq 0
  end

  it 'initialises with an empty transactions array' do
    expect(account.transactions).to eq []
  end

  describe '#deposit' do
    it 'adds the amount given to the account balance' do
      expect { account.deposit(1000) }.to change { account.balance }.by(1000)
    end

    it 'adds a single transaction to the transactions array in the correct format' do
      account.deposit(1000)
      expect(account.transactions).to eq [Time.now.strftime("%d/%m/%Y") + " || 1000.00 || || 1000.00"]
    end

    it 'adds multiple deposits to the transactions array with newer deposits appearing at the beginning' do
      account.deposit(1000)
      account.deposit(200)
      expect(account.transactions).to eq [Time.now.strftime("%d/%m/%Y") + " || 200.00 || || 1200.00", Time.now.strftime("%d/%m/%Y") + " || 1000.00 || || 1000.00"]
    end

    it 'raises an error if the amount is 0' do
      expect { account.deposit(0) }.to raise_error 'Please enter an amount greater than 0'
    end

    it 'raises an error if the amount is negative' do
      expect { account.deposit(-100) }.to raise_error 'Please enter an amount greater than 0'
    end
  end

  describe '#withdraw' do
    it 'subtracts the amount given from the account balance' do
      expect { account.withdraw(1000) }.to change { account.balance }.by(-1000)
    end

    it 'adds a single transaction to the transactions array in the correct format' do
      account.withdraw(1000)
      expect(account.transactions).to eq [Time.now.strftime("%d/%m/%Y") + " || || 1000.00 || -1000.00"]
    end

    it 'adds multiple withdrawals to the transactions array with newer withdrawals appearing at the beginning' do
      account.withdraw(1000)
      account.withdraw(200)
      expect(account.transactions).to eq [Time.now.strftime("%d/%m/%Y") + " || || 200.00 || -1200.00", Time.now.strftime("%d/%m/%Y") + " || || 1000.00 || -1000.00"]
    end

    it 'raises an error if the amount is 0' do
      expect { account.withdraw(0) }.to raise_error 'Please enter an amount greater than 0'
    end

    it 'raises an error if the amount is negative' do
      expect { account.withdraw(-100) }.to raise_error 'Please enter an amount greater than 0'
    end
  end

  context 'mixture of deposits and withdrawals' do
    it 'updates the balance correctly as withdrawals and deposits are made' do
      account.deposit(1000)
      account.withdraw(200)
      expect(account.balance).to eq 800
    end

    it 'adds a mixture of formatted withdrawals/deposits to the transactions array' do
      account.deposit(1000)
      account.withdraw(200)
      expect(account.transactions).to eq [Time.now.strftime("%d/%m/%Y") + " || || 200.00 || 800.00", Time.now.strftime("%d/%m/%Y") + " || 1000.00 || || 1000.00"]
    end
  end

  describe '#print_statement' do
    it 'just prints headers if no transactions have been made' do
      expect { account.print_statement }.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'prints a single transaction under the header' do
      account.deposit(1000)
      expect { account.print_statement }.to output("date || credit || debit || balance\n#{Time.now.strftime("%d/%m/%Y")} || 1000.00 || || 1000.00\n").to_stdout
    end

    it 'prints multiple transactions under the header' do
      account.deposit(1000)
      account.deposit(2000)
      account.withdraw(500)
      expect { account.print_statement }.to output("date || credit || debit || balance\n#{Time.now.strftime("%d/%m/%Y")} || || 500.00 || 2500.00\n#{Time.now.strftime("%d/%m/%Y")} || 2000.00 || || 3000.00\n#{Time.now.strftime("%d/%m/%Y")} || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end
