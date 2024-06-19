require_relative "task"
require_relative "task_view"
require_relative "task_controller"

controller = TaskController.new

space_between_action = "\n" * 10

loop do
  puts "1. Display all your tasks"
  puts "2. Add a task to your list"
  puts "3. Remove a task from your list"
  puts "4. Mark a task as completed"
  puts "5. Update a task"
  puts "6. Exit the application"

  choice = gets.chomp.to_i

  case choice
  when 1
    controller.list
    puts space_between_action
  when 2
    controller.add
    puts space_between_action
  when 3
    controller.remove
    puts space_between_action
  when 4
    controller.mark_task_as_completed
    puts space_between_action
  when 5
    controller.update
    puts space_between_action
  when 6
    exit
  else
    puts "Please choose a valid action ! Between 1 to 6"
  end
end
