class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    redirect_to "/" if current_user.user_type != 1
    @admins = User.all.order('user_type DESC')
    @user_type = ["Comum","Administrador"]
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    redirect_to "/" if current_user.user_type != 1
    @admin = User.new
    @url = "/admins"
    @action = "new"
  end

  # GET /admins/1/edit
  def edit
    if current_user.user_type == 0 && current_user.id != params[:id].to_i
      redirect_to "/"
    elsif current_user.user_type == 0 && current_user.id == params[:id].to_i || current_user.user_type == 1
      @url = "/admins/#{params[:id]}"
      @action = "edit"
    end
  end

  # POST /admins
  # POST /admins.json
  def create
    redirect_to "/" if current_user.user_type != 1
    @admin = User.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to '/admins', notice: 'Usuário criado com sucesso.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    if current_user.user_type == 0 && current_user.id == params[:id].to_i || current_user.user_type == 1
      respond_to do |format|
        if @admin.update(admin_params)
          format.html { redirect_to '/admins', notice: 'Usuário atualizado com sucesso.' }
          format.json { render :show, status: :ok, location: @admin }
        else
          format.html { render :edit }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to "/"
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    redirect_to "/" if current_user.user_type != 1
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Usuário excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:nome, :sobrenome, :email, :password, :modalidades_id, :user_type, :foto)
    end
end
