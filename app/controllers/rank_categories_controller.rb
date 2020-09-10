class RankCategoriesController < ApplicationController
  skip_before_action :authorized, only: :index

  def index
    @rank_categories = RankCategory.all
  end
end