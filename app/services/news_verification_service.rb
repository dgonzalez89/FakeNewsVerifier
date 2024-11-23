class NewsVerificationService
  def initialize(content)
    @content = content
    @client = OpenAI::Client.new
  end

  def verify
    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: "You are a fact-checking assistant. Analyze the provided content and determine if it is likely fake news or true news. Categorize it ethically." },
          { role: "user", content: "Content: #{@content}" }
        ]
      }
    )

    result_text = response.dig("choices", 0, "message", "content")
    parse_response(result_text)
  end

  private

  def parse_response(response_text)
    # Example: GPT might return "This is likely fake news. Moral Category: Deceptive."
    if response_text.match(/fake news/i)
      {
        result: false,
        moral_category: response_text[/Moral Category: (.+)$/, 1] || 'Unknown'
      }
    else
      {
        result: true,
        moral_category: response_text[/Moral Category: (.+)$/, 1] || 'Ethical'
      }
    end
  end
end
