require 'account'

describe Account do

  subject(:account) { described_class.new }

  it 'initialises with a balance of 0' do
    expect(account.balance).to eq 0
  end

  describe "#deposit" do
    it 'adds the amount to the account balance' do
      expect{account.deposit(1000)}.to change{account.balance}.by(1000)
    end
  end
end
