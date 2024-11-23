class NewsVerificationService
  def initialize(content)
    @content = content
  end

  def verify
    # Generate the custom prompt based on the content
    prompt = generate_prompt(@content)

    # Make the API call with the custom prompt
    response = openai_api_call(prompt)

    {
      result: response['result'],  # True or Fake
      moral_category: response['moral_category'],
      accuracy_message: generate_accuracy_message(response),
      bias_message: generate_bias_message(response)
    }
  end

  private

  def openai_api_call(prompt)
    # Example API call to OpenAI with custom prompt
    client = OpenAI::Client.new(api_key: ENV['OPENAI_API_KEY'])
    response = client.completions(
      parameters: {
        model: 'gpt-3.5-turbo',
        prompt: prompt,
        max_tokens: 150
      }
    )
    
    # Extract the results from the response
    {
      'result' => response['choices'][0]['text'].include?("fake") ? false : true,
      'moral_category' => "ethical",  # Example, this would be more detailed in real case
    }
  end

  def generate_prompt(content)
    # Basic example of how we can use different types of prompt engineering
    # You can add logic here to change the prompt based on content or complexity
    
    if content.include?("science") || content.include?("health")
      # More specific prompt for scientific or health-related content
      return "Evaluate whether the following scientific/health news is true or fake. Provide a detailed explanation of the accuracy, biases, and any limitations you notice in this news article:\n\n#{content}"
    elsif content.include?("politics") || content.include?("government")
      # Specific prompt for politics-related content, highlighting potential biases
      return "Evaluate whether the following political news article is true or fake. Pay attention to political biases and provide a thorough evaluation of the accuracy:\n\n#{content}"
    else
      # General prompt for other content types
      return "Evaluate whether the following news article is true or fake. Explain the reasoning behind your assessment:\n\n#{content}"
    end
  end

  def generate_accuracy_message(response)
    # Provide a message on accuracy
    "The accuracy of this result may vary. The model's judgment is based on available data up to its last training date."
  end

  def generate_bias_message(response)
    # Provide a message about biases and limitations
    "AI models may have biases or limitations, especially with sensitive topics. The response might reflect historical data and might not always be aligned with real-world facts."
  end
end