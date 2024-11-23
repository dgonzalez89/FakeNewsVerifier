class NewsController < ApplicationController
  def new
    # This is the form view
  end

  def verify
    content = params[:content]

    begin
      # Call the service to verify news content with enhanced prompt engineering
      verification_result = NewsVerificationService.new(content).verify

      @result = verification_result[:result] ? "True News" : "Fake News"
      @moral_category = verification_result[:moral_category]
      @accuracy_message = verification_result[:accuracy_message]
      @bias_message = verification_result[:bias_message]
    rescue StandardError => e
      # Handle and log the error
      Rails.logger.error("OpenAI API Error: #{e.message}")
      @error_message = "An error occurred while communicating with ChatGPT: #{e.message}"
    end

    # Render the same page with result, accuracy, and bias messages
    render :result
  end
end