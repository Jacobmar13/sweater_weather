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

    def unauthorized_json
      {
        errors: {
          status: "Not Authorized",
          message: "Api Key is not valid/missing",
          code: 401
        }
      }
    end
  end
end
