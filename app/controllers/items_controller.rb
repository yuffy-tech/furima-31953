class ItemsController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show]

    #def index
      #@items = Item.order("created_at DESC")
    #end

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

    private
    def item_params
      params.require(:item).permit(:name, :image, :text, :category_id, :status_id, :delivery_burden_id, :start_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
    end
end
