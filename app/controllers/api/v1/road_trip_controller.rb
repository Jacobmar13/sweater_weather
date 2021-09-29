class Api::V1::RoadTripController < ApplicationController
  before_action :validate_session, only: [:create]

  def create
    require 'pry';binding.pry
  end
end
