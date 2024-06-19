require_relative 'task'
require_relative 'task_view'

class TaskController

  def initialize
    @tasks = []
    @view = TaskView.new
  end

  def list
    if @tasks.empty?
      @view.message_empty_list
      # return
    else
      @view.display_tasks(@tasks)
    end
  end

  def add
    name = @view.ask_user_new_task_name
    description = @view.ask_user_new_task_description
    task = Task.new(name, description)
    @tasks << task
    @view.message_added_with_success
  end

  def remove
    list
    unless @tasks.empty?
      index = @view.ask_user_index(@tasks)
      if index >= 0 && index < @tasks.length
        @tasks.delete_at(index)
        @view.message_deleted_with_success
      else
        @view.error_message
      end
    end
  end

  def mark_task_as_completed
    list
    unless @tasks.empty?
      index = @view.ask_user_index_for_completion
      if index >= 0 && index < @tasks.length
        @tasks[index].mark_as_completed
        @view.message_marked_with_success
      else
        @view.error_message
      end
    end
  end

  def update
    list
    unless @tasks.empty?
      index = @view.ask_user_index(@tasks)
      if index >= 0 && index < @tasks.length
        task = @tasks[index]
        new_name = @view.ask_user_new_task_name
        new_description = @view.ask_user_new_task_description
        task.name = new_name unless new_name.empty?
        task.description = new_description unless new_description.empty?
        @view.message_updated_tasks(new_name, new_description)
      else
        @view.error_message
      end
    end
  end
end
