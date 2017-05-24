class DailiesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_atletum, only: [:show, :edit, :update, :destroy]
  def index
    @daily = Daily.where('dailies.created_at >= ?', Time.zone.now.beginning_of_day)
  end
  def new
    @atletas = Atletum.where(:modalidades_id=>current_user.modalidades_id).order('nome ASC')
  end
  def edit
    @daily = Daily.where('dailies.created_at >= ?', Time.zone.now.beginning_of_day)#joins("inner join atleta on atleta.id=dailies.atletas_id and dailies.created_at >= '#{Time.zone.now.beginning_of_day}'")
  end
  def create
    params[:dailies]['professor_id']=Professor.find_by_users_id(current_user.id).id
    params[:dailies]['modalidade_id']=Professor.find_by_users_id(current_user.id).modalidades_id
    if Daily.find_by_atletum_id(params[:dailies]['atletum_id'])
      if (Daily.find_by_atletum_id(params[:dailies]['atletum_id']).created_at).to_date != DateTime.now.to_date
        if Daily.create(dailies_param)
          puts "==============created=================="
          render json: {message:  "Status cadastrado"}
        end
      elsif (Daily.find_by_atletum_id(params[:dailies]['atletum_id']).created_at).to_date == DateTime.now.to_date
        puts "==============else=================="
        puts "atleta #{params[:dailies]['atletum_id']}"
        daily = Daily.find_by_id(params[:dailies]['daily_id'])#where("atletum_id=? and created_at >= ?",params[:dailies]['atletum_id'],Time.zone.now.beginning_of_day)

        # puts daily.status = params[:dailies]['status'].to_i
        # saveDaily = Daily.find(daily.id)
        # saveDaily.status = daily[0].status
        daily.status = params[:dailies]['status'].to_i
        if daily.save
          puts "=============salvou================"
          render json: {message:  "Status atualizado"}
        end
      end
    else
      puts "===========ultimo else=================="
      Daily.create(dailies_param)
    end
  end
  private
  def dailies_param
    params.require(:dailies).permit(:status, :atletum_id, :professor_id,:daily_id, :modalidade_id)
  end
end
