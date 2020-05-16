class Cabinet::AdsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ad, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @ads = if current_user.user?
             Ad.where(user_id: current_user.id)
           else
             Ad.all
           end
  end

  def show; end

  def new
    @ad = Ad.new
  end

  def edit; end

  def create
    @ad = Ad.new(ad_params)

    respond_to do |format|
      if @ad.save
        format.html { redirect_to cabinet_ads_path, notice: 'AD was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to cabinet_ads_path, notice: 'AD was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_ads_url, notice: 'AD was successfully destroyed.' }
    end
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:name, :description, :user_id, :image)
  end
end
