class ApiKey
  attr_reader :id, :api_key
  def initialize(user)
    @id = user.id
    @api_key = SecureRandom.hex(13)
  end
end
