class LevelsController < ApplicationController
  respond_to :js, :html
  expose(:level)     { Level.find_by(id: params[:id]) }
  expose(:new_level) { Level.new(logix_params) }

  def play
    if params[:id]
      b = level.blocks
      h = level.homes
      m = level.map
      respond_to do |format|
        format.js   { render 'play.js',   locals: { blocks: b, homes: h, map: m } }
        format.html { render 'play.html', locals: { blocks: b, homes: h, map: m } }
      end
    else
      render 'play'
    end
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
      flash[:info] = "success"
    else
      flash[:warning] = "danger"
    end
    logger.debug @brand_new_level
    render nothing: true
  end

  def logix_params
    { blocks: params[:hash_blocks].to_json,
      homes: params[:hash_homes].to_json,
      map: params[:map_arr].to_json }
  end
end
