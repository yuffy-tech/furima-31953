class ItemsController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show]
 before_action :set_item, only: [:show, :update, :edit, :destroy]
 before_action :contributor_confirmation, only: [:edit, :update]

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
    end

    def edit
    end

    def destroy
      if current_user.id == @item.user_id
         @item.destroy
        end
         redirect_to root_path
    end


    def update
      if @item.update(item_params)
        redirect_to item_path(@item)
      else
        render :edit
      end
    end

    private
    def item_params
      params.require(:item).permit(:name, :image, :text, :category_id, :status_id, :delivery_burden_id, :start_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
    end

    def contributor_confirmation
      if @item.user.id != current_user.id 
        redirect_to root_path(@item)
      end 
    end
    

    def set_item
      @item = Item.find(params[:id])
    end
end
