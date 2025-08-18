defmodule Scheduler.JobStep do
  @moduledoc """
  Documentation for `Scheduler JobStep`.
  """
  alias Scheduler.JobStep

  @doc """
  JobStep.

  JobStep is the smallest element that can be scheduled.
  The life cyclecycle is straightforward :
    - Pending, once created, default state.
    - Running, ongoing state
    - Terminated, once finished, succesfully or not.

  iex> %Scheduler.JobStep{ id: "test", created_at: ~U[2024-01-01 00:01:00.00Z]}
  %Scheduler.JobStep{ state: :pending, id: "test", created_at: ~U[2024-01-01 00:01:00.00Z] }

  """

  defstruct state: :pending, id: nil, created_at: nil

  @type t() :: %Scheduler.JobStep{id: String, created_at: DateTime, state: atom()}

  def start(job) do
    Map.put(job, :state, :running)
  end

  def stop(job) do
    Map.put(job, :state, :terminated)
  end
end
