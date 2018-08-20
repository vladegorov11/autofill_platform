module Api
  class TagsController < ApplicationController
    before_action :set_tag, only: [:show, :update, :destroy]

     def index
       @tags = Tag.all
       render json: { tags: @tags }, status: :ok
     end

    def show
      render json: { tag: @tag}, status: :ok
    end

    def update
      if @tag.update(tag_params)
        head :no_content
        return
      end
      render json: @tag.errors, status: :unprocessable_entity
    end

    def create
      @tag = Tag.new(tag_params)
      if @tag.save
        render json: { group: @tag }, status: :created
        return
      end
      render json: { errors: @tag.errors }, status: :unprocessable_entity
    end

    def destroy
      if @tag.destroy
        head :no_content
        return
      end
      render json: @tag.errors, status: :unprocessable_entity
    end

    private

    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
  end
end
