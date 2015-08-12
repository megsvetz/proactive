class Exercise < ActiveRecord::Base
  belongs_to :user

  self.inheritance_column = :type

  def self.type
    %w(Endurance Strength Flexibility Balance)
  end

  def self.endurance
    where(type: 'Endurance')
  end

  def self.strength
    where(type: 'Strength')
  end

  def self.flexibility
    where(type: 'Flexibility')
  end

  def self.balance
    where(type: 'Balance')
  end

end
