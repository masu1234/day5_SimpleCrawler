defmodule SimpleCrawler2 do
  def main do
    showURL("https://thewaggletraining.github.io/")
  end

  def showURL(url) do
    html = HTTPoison.get(url)
    {:ok, document} = Floki.parse_document(elem(html,1).body)
    document
      |> Floki.find("a")
      |> Floki.attribute("href")
  end

end
