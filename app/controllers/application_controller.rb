class ApplicationController < ActionController::API

	private

	def render_error_not_found
		render json: {err_message: 'Not Found'}, status: :not_found
	end
end
