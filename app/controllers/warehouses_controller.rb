class WarehousesController < ApplicationController
  def show
    id = params[:id]
    @warehouse = Warehouse.find(id)
  end

  def new
  end

  def create
    warehouse_params = params.require(:warehouse).permit(:name, :description, :code,
                                                        :address, :city, :cep, :area)
    w = Warehouse.new(warehouse_params)
    w.save()

    #flash[:notice] = "Galpão cadastrado com sucesso."
    redirect_to root_path, notice: "Galpão cadastrado com sucesso."
  end
end