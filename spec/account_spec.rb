require 'account'

describe Account do

  subject(:account) { described_class.new }

  it 'initialises with a balance of 0' do
    expect(account.balance).to eq 0
  end

  describe "#deposit" do
    it 'adds the amount given to the account balance' do
      expect{account.deposit(1000)}.to change{account.balance}.by(1000)
    end
  end

  describe "#withdraw" do
    it 'subtracts the amount given from the account balance' do
      expect{account.withdraw(1000)}.to change{account.balance}.by(-1000)
    end
  end
end
