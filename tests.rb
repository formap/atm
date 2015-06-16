require "./atm.rb"
require "minitest/autorun"

describe Atm do

  before do
    @atm = Atm.new
  end

  describe "when checking the balance" do
    it "must equal to the balance" do
      assert_output "\nYour balance is $700.00\n" do
        @atm.balance_action(700.0)
      end
    end
  end

  describe "when checking withdrawing money" do
    it "must equal to the old balance and the deposit" do
      
    end
  end

end
