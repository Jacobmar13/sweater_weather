class ErrorSerializer
  class << self
    def error_json(messages)
      {
        errors: {
          status: "Not Valid",
          message: messages,
          code: 400
        }
      }
    end

    def credentials_json
      {
        errors: {
          status: "Not Valid",
          message: "Credentials are bad",
          code: 400
        }
      }
    end
  end
end
