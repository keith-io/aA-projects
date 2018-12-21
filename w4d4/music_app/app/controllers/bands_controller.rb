class BandsController < ApplicationController

  def new
    render :new
  end

  def create
    band = Band.new(band_params)

    if band.save
      redirect_to bands_url
    else
      flash.now[:errors] = ["Invalid name."]
      render :new
    end
  end

  # def edit

  # end

  # def destroy

  # end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end