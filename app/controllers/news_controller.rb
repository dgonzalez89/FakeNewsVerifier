class NewsController < ApplicationController
  def new
    # This is the form view
  end

  def verify
    content = params[:content]

    begin
      # Call the service to verify news content
      verification_result = NewsVerificationService.new(content).verify

      @result = verification_result[:result] ? "True News" : "Fake News"
      @moral_category = verification_result[:moral_category]
    rescue StandardError => e
      # Handle and log the error
      Rails.logger.error("OpenAI API Error: #{e.message}")
      @error_message = "An error occurred while communicating with ChatGPT: #{e.message}"
    end

    # Render the same page with result or error
    render :result
  end
end
