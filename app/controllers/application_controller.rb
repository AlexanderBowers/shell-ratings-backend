require 'yaml'
class ApplicationController < ActionController::API
    secret = YAML.load(File.read("secret.yml"))
    def encode_token(payload)
        # should store secret in env variable
        JWT.encode(payload, secret)
      end
    
      def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
      end
    
      def decoded_token
        if auth_header
          token = auth_header.split(' ')[1]
          # header: { 'Authorization': 'Bearer <token>' }
          begin
            JWT.decode(token, secret, true, algorithm: 'HS256')
          rescue JWT::DecodeError
            nil
          end
        end
      end
end
