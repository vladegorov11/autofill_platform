module Api
  class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :update, :destroy]

     def index
       @groups = Group.all
       render json: { projects: @groups }, status: :ok
     end

    def show
      render json: { group: @group}, status: :ok
    end

    def update
      if @group.update(group_params)
        head :no_content
        return
      end
      render json: @group.errors, status: :unprocessable_entity
    end

    def create
      @group = Group.new(group_params)
      if @group.save
        render json: { group: @group }, status: :created
        return
      end
      render json: { errors: @group.errors }, status: :unprocessable_entity
    end

    def destroy
      if @group.destroy
        head :no_content
        return
      end
      render json: @group.errors, status: :unprocessable_entity
    end

    private

    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
  end
end
