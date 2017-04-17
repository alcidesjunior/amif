class AtletaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_atletum, only: [:show, :edit, :update, :destroy]

  # GET /atleta
  # GET /atleta.json
  def index
    if current_user.user_type != 1
      @atleta = Atletum.where(:modalidades_id=>current_user.modalidades_id).order('nome ASC').paginate(:page => params[:page], :per_page => 10)
    else
      @atleta = Atletum.all.order('nome ASC').paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /atleta/1
  # GET /atleta/1.json
  def show
  end

  # GET /atleta/new
  def new
    @atletum = Atletum.new
  end

  # GET /atleta/1/edit
  def edit
  end

  # POST /atleta
  # POST /atleta.json
  def create
    @atletum = Atletum.new(atletum_params)

    respond_to do |format|
      if @atletum.save
        format.html { redirect_to @atletum, notice: 'Atletum was successfully created.' }
        format.json { render :show, status: :created, location: @atletum }
      else
        format.html { render :new }
        format.json { render json: @atletum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atleta/1
  # PATCH/PUT /atleta/1.json
  def update
    respond_to do |format|
      if @atletum.update(atletum_params)
        format.html { redirect_to @atletum, notice: 'Atletum was successfully updated.' }
        format.json { render :show, status: :ok, location: @atletum }
      else
        format.html { render :edit }
        format.json { render json: @atletum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atleta/1
  # DELETE /atleta/1.json
  def destroy
    @atletum.destroy
    respond_to do |format|
      format.html { redirect_to atleta_url, notice: 'Atletum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atletum
      @atletum = Atletum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atletum_params
      params.require(:atletum).permit(:nome, :sobrenome, :data_nascimento,:telefone1,:teleonfe2, :sexo, :email, :nacionalidade, :professors_id, :modalidades_id)
    end
end
