class Atm

  def initialize(filename = "balance.txt")
    @filename = filename
    if File.exist?(@filename)
      @balance = File.read(@filename).to_f
      # to read the last line of the file
      #b = `tail -n 1 balance.txt`
      #@balance = b
    else
      @balance = 100.0
    end
  end

  def run
    balance = @balance
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
        balance = withdraw_action(balance)
        balance_action(balance)
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
    if !File.exist?(@filename)
      @filename = File.new(@filename, "w")
    end
    @filename.puts(balance)
    @filename.close
    printf "\nThe balance was written correctly.\n"
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
        amount = gets.to_f
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

  def withdraw_action(balance)
    amount = 0
    while amount <= 0 do
      printf "\nHow much money do you want to withdraw? Specify the number in €\n"
      begin
        amount = gets.chomp.to_f
        if amount <= 0
          printf "\nYou can only withdraw amounts greater than 0.\n"
        elsif amount > balance
          printf "\nYou don't have enough money in your account.\n"
        end
      rescue
        printf "\nYou didn't introduce a number. Please introduce a number.\n"
      end
    end
    balance = balance - amount
    return balance
  end

  def balance_action(balance)
    printf "\nYour balance is $%.2f\n", balance
  end

end
