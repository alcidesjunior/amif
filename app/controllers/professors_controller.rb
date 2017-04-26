class ProfessorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_professor, only: [:show, :edit, :update, :destroy]

  def bgImages
    @bgModals = []
    Modalidade.all.order('id asc').each do |z|
      @bgModals.push({id: z.id,imagem: z.imagem.url(:original)})
    end
    @bgModals.to_json.to_s.html_safe
  end
  # GET /professors
  # GET /professors.json
  def index
    @professors = Professor.all #if current_user.user_type == 1
  end

  # GET /professors/1
  # GET /professors/1.json
  def show
  end

  # GET /professors/new
  def new
    @professor = Professor.new
    @bgModals = bgImages()
  end

  # GET /professors/1/edit
  def edit
    @bgModals = bgImages()
  end

  # POST /professors
  # POST /professors.json
  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'Professor was successfully created.' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professors/1
  # PATCH/PUT /professors/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_params)
        format.html { redirect_to @professor, notice: 'Professor was successfully updated.' }
        format.json { render :show, status: :ok, location: @professor }
      else
        format.html { render :edit }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @professor.destroy
    respond_to do |format|
      format.html { redirect_to professors_url, notice: 'Professor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:nome, :sobrenome, :modalidades_id, :graduacao)
    end
end
