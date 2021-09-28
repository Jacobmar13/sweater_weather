class Image
  attr_reader :id,
    :image

  def initialize(image, location)
    @id = nil
    @image = image_formatter(image[:results][0], location)
  end

  def image_formatter(image, location)
    {
      location: location,
      image_url: image[:urls][:full],
      credit: {
        source: "https://unsplash.com/?utm_source=sweater_weather&utm_medium=referral",
        photographer: image[:user][:name],
        photographer_url: "#{image[:user][:links][:html]}?utm_source=sweater_weather&utm_medium=referral"
      }
    }
  end
end
