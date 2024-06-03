defmodule GiphyScraper do
  alias GiphyScraper.GiphyImage

  @amount_of_result 25
  @url "http://api.giphy.com/v1/gifs/search"
  @api "asy6RP61WbU8GsdtbO4129JZLWQYfG0C"

  def search(query) do
    %{body: %{"data" => images}} = Req.get!(Req.new(), url: prepare_query(query))
    images
    |> Enum.map(fn img -> GiphyImage.make(img) end)
  end

  def prepare_query(query) do
    "#{@url}?api_key=#{@api}&q='#{query}'&limit=#{@amount_of_result}"
  end
end
