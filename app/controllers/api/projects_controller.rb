module Api
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :update, :destroy]
    before_action :authenticate_user!

    def index
      @projects = Project.all
      render json: { projects: @projects }, status: :ok
    end

    def show
      render json: { project: @project, group: @project.groups}, status: :ok
    end

    def update
      if @project.update(project_params)
        head :no_content
        return
      end
      render json: @project.errors, status: :unprocessable_entity
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        render json: { project: @project }, status: :created
        return
      end
      render json: { errors: @project.errors }, status: :unprocessable_entity
    end

    def destroy
      if @project.destroy
        head :no_content
        return
      end
      render json: @project.errors, status: :unprocessable_entity
    end

    private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title)
    end
  end
end
