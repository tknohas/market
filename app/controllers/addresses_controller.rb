class AddressesController < ApplicationController
  def new
    @address = current_user.build_address
  end

  def create
    @address = current_user.build_address(address_params)
    if @address.save
      redirect_to edit_address_path(@address), notice: '登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @address = current_user.address
  end

  def update
    @address = current_user.address
    if @address.update(address_params)
      redirect_to edit_address_path(@address), notice: '変更しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.expect(address: %i[zip_code prefecture city street building])
  end
end
