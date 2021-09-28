class ErrorSerializer
  def self.error_json(messages)
    {
      errors: {
        status: "Not Valid",
        message: messages,
        code: 400
      }
    }
  end
end
