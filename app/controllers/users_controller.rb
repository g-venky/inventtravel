class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  def index
    @users = User.all
  end
  
  
  # GET /users/:id.:format
  def show
    @user = User.find(params[:id])
    # authorize! :read, @user
  end
 def edit
    @user = User.find(params[:id])
  end  
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  # PATCH/PUT /users/:id.:format
  #def update
    # authorize! :update, @user
   # respond_to do |format|
     # if @user.update(user_params)
     #   sign_in(@user == current_user ? @user : current_user, :bypass => true)
       # format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
      #  format.json { head :no_content }
      #else
       # format.html { render action: 'edit' }
       # format.json { render json: @user.errors, status: :unprocessable_entity }
      #end
   # end
  #end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
    private
  
    def correct_user
      # .to_i converts values to integers here because params[:id] is a string
      # Without this current_user.id and params[:id] would never match
      if current_user.id != params[:id].to_i
        redirect_to root_url
      end
    end
    
    def user_params
      params.require(:user).permit(:bio)
    end
  
 # private
  #  def set_user
   #   @user = User.find(params[:id])
   # end

   # def user_params
    #  accessible = [ :name, :email ] # extend with your own params
    #  accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    #  params.require(:user).permit(accessible)
   # end

end