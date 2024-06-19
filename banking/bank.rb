class BankAccount

  attr_reader :account_number, :balance

  @@created_account = 0

  def initialize(account_number, balance=0, password)
    @account_number = account_number
    @balance = balance
    @password = password
    @@created_account += 1
  end

  def deposit(amount, password)
    authenticate(password)
    if amount < 10
      puts "Minimum 10 euros for a deposit"
    else
      @balance += amount
      puts "Your made a deposit of #{amount}€\nYour balance is #{@balance}"
    end
  end

  def withdraw(amount, password)
    authenticate(password)
    if @balance <= 0 || amount > @balance
      puts "insufficient funds"
    else
      @balance -= amount
      puts "Your withdrawn #{amount}€\nYour balance is #{@balance}"
    end
  end

  def display_balance
    puts "Your balance is #{balance}€"
  end

  def self.total_accounts
    puts "Total number of bank accounts : #{@@created_account}"
  end

  private

  def authenticate(password)
    raise "Incorrect password" unless password == @password
  end
end
