class LevelsController < ApplicationController
  respond_to :js
  expose(:level) { Level.find_by(id: params[:id], level_type: 'basic') }
  expose(:new_level) { Level.new }

  def play
    render 'play'
  end

  def editor
    render 'editor'
  end

  def create

  end

  def show
    b = level.blocks
    h = level.homes
    m = level.map
    render 'level.js', locals: { blocks: b, homes: h, map: m }
  end
end
