class SubtasksController < ApplicationController
  def index
    @page_number = params[:page].to_i.positive? ? params[:page].to_i : 1
    @per_page = params[:perPage] || 10

    @sort_column = params[:sort_column] || 'id'
    @sort_direction = params[:sort_direction] || 'asc'

    @offset = (@page_number.to_i - 1) * @per_page.to_i

    @total = Subtask.count
    @total_pages = (@total.to_f / @per_page.to_f).ceil
    @subtasks = Subtask
                  .includes(task: [:project])
                  .order("#{@sort_column} #{@sort_direction}")
                  .limit(@per_page)
                  .offset(@offset)
    @tasks = @subtasks.map(&:task).uniq
    @projects = @subtasks.map { |subtask| subtask.task.project }.uniq
    render json: {
      page: @page_number,
      totalPages: @total_pages,
      pageSize: @per_page,
      totalCount: @total,
      data: {
        subtasks: ActiveModelSerializers::SerializableResource.new(@subtasks, each_serializer: SubtaskSerializer),
        tasks: ActiveModelSerializers::SerializableResource.new(@tasks, each_serializer: TaskSerializer),
        projects: ActiveModelSerializers::SerializableResource.new(@projects, each_serializer: ProjectSerializer)
      }
    }
  end
end
