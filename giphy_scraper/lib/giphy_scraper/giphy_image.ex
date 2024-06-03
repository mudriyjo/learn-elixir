defmodule GiphyScraper.GiphyImage do
  defstruct id: "", url: "", username: "", title: ""

  def make(%{"id" => id, "url" => url, "username" => name, "title" => title}) do
    %__MODULE__{id: id, url: url, username: name, title: title}
  end
end
