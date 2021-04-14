class ItemsController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show]

    def index
      @items = Item.all.order("created_at DESC")
    end

    def new
      @item = Item.new
    end

    def create
      #formのデータを受け取る
      @item =Item.new(item_params)
      if @item.save
        redirect_to items_path
      else
        render 'new'
      end
    end

    def show
      @item = Item.find(params[:id])
    end

    def edit
      @item= Item.find(params[:id])
    end

    def update
      if @item.save
        redirect_to item_path
      else
        render :edit
      end
    end

    private
    def item_params
      params.require(:item).permit(:name, :image, :text, :category_id, :status_id, :delivery_burden_id, :start_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
    end
end
