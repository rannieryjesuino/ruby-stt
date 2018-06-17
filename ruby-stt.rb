# Imports the Google Cloud client library
require "google/cloud/speech"
require "dicionario.rb"

# Your Google Cloud Platform project ID
project_id = "ruby-stt"

# Instantiates a client
speech = Google::Cloud::Speech.new project: project_id

# The name of the audio file to transcribe
file_name = "audio-files/audo.amr"

# The audio file's encoding and sample rate
audio = speech.audio file_name, encoding:    :amr,
                                sample_rate: 8000,
                                language:    "pt-BR"

# Detects speech in the audio file
results = audio.recognize

saida = File.new("saida.md", "w")
# Each result represents a consecutive portion of the audio
results.each do |result|
  saida.puts("#{result.transcript}")
  puts result.transcript
end

saida.close
