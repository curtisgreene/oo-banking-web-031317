require 'pry'
class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? && self.status == 'pending' && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if valid? && self.status == 'complete' && receiver.balance > amount
      receiver.balance -= amount
      sender.balance += amount
      self.status = 'reversed'
    else
      reject_transfer
    end
  end



end
