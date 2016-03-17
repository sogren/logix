class LevelsController < ApplicationController
  respond_to :js, :html
  expose(:level)     { Level.find_by(id: params[:id]) }
  expose(:new_level) { Level.new(logix_params) }

  def play
    if level
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

  def create
    new_level.level_type = 'User made'
    new_level.creator    = current_user
    if new_level.save
      flash[:info] = "success"
    else
      flash[:warning] = "danger"
    end
    render nothing: true
  end

  def logix_params
    { blocks: params[:hash_blocks],
      homes: params[:hash_homes],
      map: params[:map_arr] }
  end
end
