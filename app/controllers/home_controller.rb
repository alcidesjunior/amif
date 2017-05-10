class HomeController < ApplicationController
  before_action :authenticate_user!, :except=>[:blog]
  def index
    @galery = Galery.all
    @frontPanel = FrontPanel.all.order('id asc')
  end
  def blog
    @galery = Galery.all
    @frontPanel = FrontPanel.all.order('id asc')
  end
  def saveFrontPanel
    if current_user.user_type == 1
      if params['frontPanel']['titulo'] != nil
          panel = FrontPanel.find_by_id(params[:id])
          if panel.update(panel_params)
            render json: {message: "Dado atualizado!"}
          elsif
            render json: {message: "Erro ao atualizar dado!"}
          end

      elsif params['frontPanel']['conteudo'] != nil
        panel = FrontPanel.find_by_id(params[:id])
        if panel.update(:id=>params[:id],:conteudo=> panel_params['conteudo'])
          render json: {message: "Dado atualizado!"}
        elsif
          render json: {message: "Erro ao atualizar dado!"}
        end
      end
    end
end
  private
  def panel_params
    params.require(:frontPanel).permit(:titulo,:conteudo)
  end
end
