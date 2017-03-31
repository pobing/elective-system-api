class HealthCheckController < ApplicationController
  def index
    render plain: "Hey buddy! We are good.", status: :ok
  end
end
