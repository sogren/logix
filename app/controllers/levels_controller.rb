class LevelsController < ApplicationController
  respond_to :js
  expose(:level) { Level.find_by(id: params[:id], level_type: 'basic') }
  expose(:new_level) { Level.new(logix_params) }

  def play
    render 'play'
  end

  def editor
    render 'editor'
  end

  def create
    blocks = params[:hash_blocks]
    homes = params[:hash_homes]
    map = params[:map_arr]
    @brand_new_level = Level.new(blocks: blocks, homes: homes, map:map, level_type: 'user_made')
    if @brand_new_level.save
      flash[:notice] = "success"
    else
      flash[:warning] = "danger"
    end
    logger.debug @brand_new_level
    render nothing: true
  end

  def show
    b = level.blocks
    h = level.homes
    m = level.map
    render 'level.js', locals: { blocks: b, homes: h, map: m }
  end

  def logix_params
    { blocks: params[:hash_blocks].to_json,
      homes: params[:hash_homes].to_json,
      map: params[:map_arr].to_json }
  end
end
