# frozen_string_literal: true

class Cabinet::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy profile]
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to cabinet_users_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        if @user.user?
          format.html { redirect_to cabinet_user_path(@user), notice: 'Your profile was successfully updated.' }
        else
          format.html { redirect_to cabinet_users_path, notice: 'User was successfully updated.' }
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_users_url, notice: 'User was successfully destroyed.' }
    end
  end

  def profile; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :avatar,
      :role,
      :email,
      :password,
      :password_confirmation,
      :full_name,
      :address,
      :city,
      :state,
      :country,
      :zip
    )
  end
end
