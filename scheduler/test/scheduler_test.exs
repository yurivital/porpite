defmodule Scheduler.JobStepTest do
  use ExUnit.Case
  doctest Scheduler.JobStep

  test "Task lifecycle, a task is created in pending state" do
    state = %Scheduler.JobStep{id: "test"}.state
    assert state == :pending
  end

  test "Task lifecycle, a stated task is in running state" do
    state =
      %Scheduler.JobStep{id: "test"}
      |> Scheduler.JobStep.start()
      |> Map.get(:state)

    assert state == :running
  end

  test "Task lifecycle, a finished task is in terminated state" do
    state =
      %Scheduler.JobStep{id: "test"}
      |> Scheduler.JobStep.start()
      |> Scheduler.JobStep.stop()
      |> Map.get(:state)

    assert state == :terminated
  end
end
