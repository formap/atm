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
      when 'w'
        #withdraw money
      when 'b'
        #inspect balance
      else
        printf "Please choose a valid option.\n"
      end
      print_menu
      selection = gets.chomp
      selection = selection.downcase
    end
  end

  def print_menu
    printf "Deposit money: press D\n"
    printf "Withdraw money: press W\n"
    printf "Inspect balance: press B\n"
    printf "Quit: press Q\n"
  end

    #printf "Your balance is $%.2f\n", balance
end
