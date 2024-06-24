class TaskView

  def display_tasks(tasks)
    tasks.each_with_index do |task, index|
      status = task.completed ? "[X]" : "[ ]"
      puts "┌──────────────────────────────────────────────┐"
      puts "│ Task n°#{index + 1} #{status}                 "
      puts "│ For: #{task.name}                             "
      puts "│ Description: #{task.description}              "
      puts "└──────────────────────────────────────────────┘"
    end
  end

  # Start Methods for interaction with the user
  def ask_user_new_task_name
    puts "For whom is the task?"
    return gets.chomp
  end

  def ask_user_new_task_description
    puts "What's the description of the task?"
    return gets.chomp
  end

  def ask_user_index_for_completion
    puts "Please enter the task number to mark as completed:"
    gets.chomp.to_i - 1
  end

  def ask_user_index(tasks)
    puts "Pick with the index!"
    return gets.chomp.to_i - 1
  end
  # End Methods for interaction with the user

  # Start Methods for displaying messages to the user
  def message_empty_list
    puts "┌───────────────────────────────────────┐"
    puts "│ 📭 There is no tasks in your list!    |"
    puts "└───────────────────────────────────────┘"
  end

  def message_added_with_success
    puts "┌────────────────────────────────────────────┐"
    puts "│ 🎉 Your task has been added successfully!  |"
    puts "└────────────────────────────────────────────┘"
  end

  def message_deleted_with_success
    puts "┌──────────────────────────────────────────────┐"
    puts "│ 🗑️  Your task has been removed successfully!  |"
    puts "└──────────────────────────────────────────────┘"
  end

  def message_marked_with_success
    puts "┌───────────────────────────────────────┐"
    puts "│ ✅ Task marked as completed!          |"
    puts "└───────────────────────────────────────┘"
  end

  def message_updated_tasks(new_name, new_description)
    puts "┌────────────────────────────────────────────────────────────┐"
    if new_name.empty? && new_description.empty?
      puts "│ ❌  There is no update on the task!                    "
    elsif !new_name.empty? && !new_description.empty?
      puts "│ ✏️  Both the name and the description have been updated!  "
    else
      puts "│ ✏️  #{new_name.empty? ? "Only the description" : "Only the name"} has been updated!  "
    end
    puts "└────────────────────────────────────────────────────────────┘"
  end

  def error_message
    puts "┌──────────────────────────────────────────┐"
    puts "│ ⚠️  An error occurred, please try again!  │"
    puts "└──────────────────────────────────────────┘"
  end
  # End Methods for displaying messages to the user
end
