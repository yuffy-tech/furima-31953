class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sold_out_item
  

    def index
      @order = ItemForm.new
    end

    def create

        # formのデータを受け取る
        @order =ItemForm.new(order_params)
        
        if @order.valid?
            pay_item
            @order.save
            return redirect_to root_path
          else
            render 'index'
          end
    end

    private

    def set_item
      @item = Item.find(params[:item_id])
    end

    def contributor_confirmation
      return redirect_to root_path if current_user.id == @item.user_id
    end
    
    def order_params
      params.require(:item_form).permit(:postal_code, :start_area_id, :municipality, :address, :building_name, :phone_number, :management).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id].to_i)
    end

    def sold_out_item
      redirect_to root_path if @item.management.present?
    end

    def pay_item
        Payjp.api_key = "sk_test_3243892f2a3a737684e0ace0" 
        Payjp::Charge.create(
          amount: @item.price,  
          card: order_params[:token], 
          currency: 'jpy'       
        )
      end
end