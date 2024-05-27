defmodule GameSimulationApi do
  defdelegate get_best_game(json), to: GameSimulation, as: :calculate_kdr_from_json
end
