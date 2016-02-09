class ObjectsController < ApplicationController
  def new
    @redis = $redis.keys
  end

  def create
    $redis.set(params[:key], params[:value])
    redirect_to root_path
  end

  def destroy
    $redis.del(params[:key])
    redirect_to root_path
  end
end
