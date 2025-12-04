require 'open-uri'
require 'uri'
require 'json'

class VoiceVoxService
  MAX_RETRIES = 2
  RETRY_DELAY = 0.5

  def initialize(apiKey)
    @apiKey = apiKey
  end

  def speakers
    speaker_endpoint = "https://api.tts.quest/v3/voicevox/speakers_array?key=#{@apiKey}"
    speakers_serialized = URI.parse(speaker_endpoint).read
    JSON.parse(speakers_serialized)
  rescue StandardError => e
    Rails.logger.error "VoiceVox speakers error: #{e.message}"
    nil
  end

  def synthesize(text, speaker = 13)
    text = URI.encode_www_form_component(text)
    synthesize_endpoint = "https://api.tts.quest/v3/voicevox/synthesis?speaker=#{speaker}&text=#{text}&key=#{@apiKey}"

    retries = 0
    begin
      tts_serialized = URI.parse(synthesize_endpoint).read
      JSON.parse(tts_serialized)
    rescue StandardError => e
      retries += 1
      if retries <= MAX_RETRIES
        Rails.logger.warn "VoiceVox retry #{retries}/#{MAX_RETRIES}: #{e.message}"
        sleep(RETRY_DELAY)
        retry
      else
        Rails.logger.error "VoiceVox failed after #{MAX_RETRIES} retries: #{e.message}"
        nil
      end
    end
  end
end
