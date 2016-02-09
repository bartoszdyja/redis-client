module ObjectsHelper
  def get_value(key)
    $redis.get(key) if $redis.type(key) == 'string'
  end

  def get_type(key)
    $redis.type(key)
  end
end
