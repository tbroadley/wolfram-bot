module Responders
  class Default < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"

    def can_handle?
      true
    end

    def handle
      text_response("Sorry, I don't know how to respond to that.")
    end

  end
end
