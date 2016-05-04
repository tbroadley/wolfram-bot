require "wolfram-alpha"
require "cgi"

module Responders
  class Wolfram < ApplicationResponder
    def make_text_response(pod)
      "#{pod.title}: \n\n" + pod.subpods.map { |subpod| subpod.plaintext }.join("\n")
    end

    def can_handle?
      true
    end

    def handle
      client = WolframAlpha::Client.new "635XJW-TQLYT6A9J8", format: "plaintext"

      api_response = client.query message["body"]

      api_response.drop(1).take(4).select {
        |pod| pod.subpods.any? { |subpod| subpod.plaintext != "" }
      }
      .map {
        |pod| text_response(make_text_response pod)
      }
      .push text_response("For more information, visit http://www.wolframalpha.com/input/?i=#{CGI.escape(message["body"])}")
    end
  end
end
