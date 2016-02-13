class LevelsController < ApplicationController
  respond_to :js
  expose(:level) { Level.find_by(id: params[:id], level_type: 'basic') }

  def choose_level
    b = level.blocks
    h = level.homes
    m = level.map
    render 'level.js', locals: { blocks: b, homes: h, map: m }
  end
end
