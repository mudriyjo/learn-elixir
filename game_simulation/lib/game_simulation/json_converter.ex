defmodule GameSimulation.JsonConverter do
  def best_game_to_json(game, name) do
    game
    |> Map.put(:nickname, name)
    |> Jason.encode!
  end
end
