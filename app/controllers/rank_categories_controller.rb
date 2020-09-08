class RankCategoriesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    @rank_categories = RankCategory.all
  end

  def show
    @rank_category = RankCategory.find(params[:id])
  end
end