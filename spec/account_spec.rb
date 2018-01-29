require 'account'

describe Account do

  subject(:account) { described_class.new }

  it 'initialises with a balance of 0' do
    expect(account.balance).to eq 0
  end

  it 'initialises with an empty transactions array' do
    expect(account.transactions).to eq []
  end

  describe "#deposit" do
    it 'adds the amount given to the account balance' do
      expect{account.deposit(1000)}.to change{account.balance}.by(1000)
    end

    it 'adds a single transaction to the statements array' do
      account.deposit(1000)
      expect(account.statements).to eq [Time.now.strftime("%d/%m/%Y") + " || 1000.00 || || 1000.00"]
    end
  end

  describe "#withdraw" do
    it 'subtracts the amount given from the account balance' do
      expect{account.withdraw(1000)}.to change{account.balance}.by(-1000)
    end
  end

  describe '#print_statement' do
    it 'just prints headers if no transactions have been made' do
      expect{ account.print_statement }.to output("date || credit || debit || balance\n").to_stdout
    end
  end
end
