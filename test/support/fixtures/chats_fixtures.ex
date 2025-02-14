defmodule Newchat.ChatroomsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Newchat.Chatrooms` context.
  """

  @doc """
  Generate a room.
  """
  def room_fixture(attrs \\ %{}) do
    {:ok, room} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Newchat.Chatrooms.create_room()

    room
  end
end
