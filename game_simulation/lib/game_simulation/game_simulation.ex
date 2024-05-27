defmodule GameSimulation do
  @type game :: %{game_id: String.t(), kill: non_neg_integer(), death: non_neg_integer()}
  @type player :: %{nickname: String.t(), game_history: list(game)}
  @type best_game :: %{nickname: String.t(), kdr: Float.t(), game_id: String.t()}

  alias GameSimulation.JsonConverter

  @spec calculate_kdr_from_json(String.t()) :: best_game()
  def calculate_kdr_from_json(player) do
    {:ok, %{"nickname" => nick, "game_history" => games}} = Jason.decode(player)
    games
      |> calculate_kdr_for_games
      |> get_best_game
      |> JsonConverter.best_game_to_json(nick)
  end

  defp calculate_kdr_for_games(games) do
    Enum.map(games, fn game ->
      %{game_id: game["game_id"], kdr: game["kill"] / game["death"]}
    end)
  end

  defp get_best_game(games) do
    games
    |> Enum.sort(fn g1, g2 -> g1[:kdr] > g2[:kdr] end)
    |> hd
  end
end
