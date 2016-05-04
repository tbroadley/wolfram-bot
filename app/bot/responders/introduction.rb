module Responders
  class Introduction < ApplicationResponder
    respond_to "start-chatting"

    def can_handle?
      true
    end

    def handle
      text_response("Hi, I'm Wolfram Bot. Send me a message and I'll search for it on Wolfram Alpha.")
    end

  end
end
