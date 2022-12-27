class UsersController < ApplicationController
  def index
    @users = User.all 
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(article_params)
    respond_to do |format|
      if @user.save 
        format.html { redirect_to @user, notice: "Renseignez vos informations de prestataire" }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(article_params)
        format.html { redirect_to @user, notice: "Renseignez vos informations de prestataire" }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other 
  end

  private

  def article_params
    params.require(:user).permit(:name, :phone_no)
  end

end
