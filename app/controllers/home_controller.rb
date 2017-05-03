class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @galery = Galery.all
  end
end
