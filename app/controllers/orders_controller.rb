class OrdersController < ApplicationController
    def index
      @order = ItemForm.new
    end

    def create
        # formのデータを受け取る
        @order =ItemForm.new(order_params)
        
        if @order.valid?
            @order.save
           redirect_to root_path
        else
           render 'index'
        end    
    end

    private
    def order_params
      params.require(:item_form).permit(:postal_code, :start_area_id, :municipality, :address, :building_name, :phone_number, :management).merge(user_id: current_user.id, item_id: params[:item_id].to_i)
    end

end