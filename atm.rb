class Atm
  STARTING_BALANCE = 100.0

  def initialize(filename = "balance.txt")
    @filename = filename
  end

  def run
    balance = STARTING_BALANCE
    printf "Welcome to the Ruby atm. What do you want to do?\n"
    print_menu
    selection = gets.chomp
    selection = selection.downcase
    while selection != 'q' do
      case selection
      when 'd'
        #deposit money
        balance = deposit_action(balance)
        balance_action(balance)
      when 'w'
        #withdraw money
      when 'b'
        #inspect balance
        balance_action(balance)
      else
        printf "Please choose a valid option.\n"
      end
      print_menu
      selection = gets.chomp
      selection = selection.downcase
    end
  end

  def print_menu
    printf "\n"
    printf "Deposit money: press D\n"
    printf "Withdraw money: press W\n"
    printf "Inspect balance: press B\n"
    printf "Quit: press Q\n"
    printf "\n"
  end

  def deposit_action(balance)
    amount = 0
    while amount <= 0 do
      printf "\nHow much money do you want to deposit? Specify the number in €\n"
      begin
        amount = gets.chomp.to_f
        if amount <= 0
          printf "\nYou can only deposit amount greater than 0.\n"
        end
      rescue
        printf "\nYou didn't introduce a number. Please introduce a number.\n"
      end
    end
    balance = balance + amount
    printf "\nYou deposited $%.2f\n", amount
    return balance
  end

  def balance_action(balance)
    printf "\nYour balance is $%.2f\n", balance
  end

end
