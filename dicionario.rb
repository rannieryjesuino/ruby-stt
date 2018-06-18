@dicionario = {
  "iniciar itálico" => " *",
  "finalizar itálico" => "*",
  "iniciar negrito" => " **",
  "finalizar negrito" => "**",
  # O padrão Markdown nao suporta sublinhado, portanto e necessario uma injecao de codigo html
  "iniciar sublinhado" => " <u>",
  "finalizar sublinhado" => "</u>",
  #-------------------------------------------------------------------------------------------
  "pular linha" => "  ",
  "ponto final" => ".",
  "vírgula" => ",",
  "ponto e vírgula" => ";"
}

def to_markdown(transcript)
  resultado = ""
  buffer = ""
  frase = transcript.split
  frase.each do |palavra|
    buffer = buffer + palavra
    if(buffer.downcase == "iniciar" || buffer.downcase == "finalizar"|| buffer.downcase == "pular"|| buffer.downcase == "ponto" || buffer.downcase == "ponto e")
      buffer = buffer + " "
      next
    end

    if @dicionario[buffer.downcase]
      resultado = resultado + @dicionario[buffer.downcase]
    else
      resultado = resultado + " " + buffer
    end
    puts resultado
    buffer = ""

  end

    return resultado
end
