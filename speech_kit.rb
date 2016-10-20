class SpeechKit
  def initialize(api_key)
    @api_key = api_key
  end

  def vocalize(text)
    require 'uri'
    require 'open-uri'
    female_speakers = %w(jane oksana alyss omazh)
    male_speakers = %w(zahar ermil)
    if text.bytesize > 2000
      text = text.byteslice(0..200)
    end
    params = {
      text: text,             #<текст для озвучивания>
      format: 'mp3',              #<формат аудио файла>
      lang: 'ru‑RU',              #<язык>
      speaker: female_speakers[1],  #<голос>
      key: @api_key                #<API‑ключ>

      #& [emotion=<эмоциональная окраска голоса>]
      #& [speed=<скорость речи>]
    }
    encoded_params = URI.encode_www_form(params)
    url = "https://tts.voicetech.yandex.net/generate?#{encoded_params}"
    open(url)
  end
end
