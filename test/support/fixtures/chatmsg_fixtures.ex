defmodule Newchat.ChatmsgFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Newchat.Chatmsg` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        message: "some message",
        sender_name: "some sender_name"
      })
      |> Newchat.Chatmsg.create_message()

    message
  end
end
