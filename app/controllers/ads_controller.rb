class AdsController < ApplicationController
  def index; end
  def show
    @ad = Ad.find(params[:id])
  end
end
