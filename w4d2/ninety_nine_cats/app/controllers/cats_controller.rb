class CatsController < ApplicationController
    
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def new
        @cat = Cat.new
        render :new
    end
    
    def edit
        @cat = Cat.find(params[:id])
        render :edit
    end

    def create
        cat = Cat.new(cat_params)
        if cat.save
          redirect_to cats_url
        else
          render json: cat.errors.full_messages, status: 422
        end
    end

    def update
        cat = Cat.find(params[:id])
        if cat.update(cat_params)
            redirect_to cats_url
        else
            render json: cat.errors.full_messages
        end
    end

    def destroy
        cat = Cat.find(params[:id])
        cat.destroy
        redirect_to cats_url
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :color, :sex, :birth_date)
    end
end