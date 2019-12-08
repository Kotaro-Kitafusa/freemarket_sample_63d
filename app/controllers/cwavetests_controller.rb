class CwavetestsController < ApplicationController
  def index

  end

  def create
    Cwavetest.create(img_params)
    redirect_to cwavetests_path
  end

  def new
  @cwavetest = Cwavetest.new
  end

  private
  def img_params
    params.require(:cwavetest).permit(:image)
  end
end
