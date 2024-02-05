class ProjectsController < ApplicationController
    def index
        @projects = Project.includes(tasks: [:subtasks]).all
        render json: @projects, each_serializer: NestedProjectSerializer, include: '**'
    end

    def update
        @project = Project.find(params[:id])
        if @project.update(project_params)
            @project.save
            render json: @project
        else
            render json: 'Failed to update'
        end
    end

    private

    def project_params
        params.require(:project).permit(:id, :name, :description, tasks_attributes: [:id, :name, :description, subtasks_attributes: [:id, :name, :description, :due_date]])
    end
end
