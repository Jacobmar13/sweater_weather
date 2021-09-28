class BackgroundFacade
  class << self
    def retrieve_image(address)
      image = UnsplashService.get_image(address)
      Image.new(image, address)
    end
  end
end
