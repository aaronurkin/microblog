class UserController < ApplicationController
  before_action :check_permissions, only: %i[ edit update destroy ]
  before_action :set_user, only: %i[ show edit update destroy ]
  
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(params.require(:user).permit(:full_name))
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if !params["confirm_delete_user"]
      respond_to do |format|
        format.html { redirect_to signin_path, status: :bad_request, notice: "Missing confirmation phrase" }
        format.json { render json: { notice: "Missing confirmation phrase" }, status: :bad_request }
      end
    elsif params["confirm_delete_user"] != "delete"
      respond_to do |format|
        format.html { redirect_to signin_path, status: :bad_request, notice: "Please type exactly 'delete'" }
        format.json { render json: { notice: "Please type exactly 'delete'" }, status: :bad_request }
      end
    else
      @user.destroy

      respond_to do |format|
        format.html { redirect_to root_path, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    
    def check_permissions
      if params[:id] != current_user.id
        respond_to do |format|
          format.html { redirect_back fallback_location: root_path, status: :forbidden, notice: "Access denied" }
          format.json { render json: { notice: "Access denied" }, status: :forbidden }
        end
      end
    end
end
