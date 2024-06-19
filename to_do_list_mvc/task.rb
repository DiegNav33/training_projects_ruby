class Task

  attr_accessor :name, :description, :completed

  def initialize(name, description)
    @name = name
    @description = description
    @completed = false
  end

  def mark_as_completed
    @completed = true
  end
end
