class ItemsController < ApplicationController
  before_action :set_item, only: %i[ destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    render :new, status: :unprocessable_entity unless @item.save
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:text)
    end
end
