defmodule Newchat.ChatmsgTest do
  use Newchat.DataCase

  alias Newchat.Chatmsg

  describe "messages" do
    alias Newchat.Chatmsg.Message

    import Newchat.ChatmsgFixtures

    @invalid_attrs %{message: nil, sender_name: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Chatmsg.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Chatmsg.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{message: "some message", sender_name: "some sender_name"}

      assert {:ok, %Message{} = message} = Chatmsg.create_message(valid_attrs)
      assert message.message == "some message"
      assert message.sender_name == "some sender_name"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chatmsg.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{message: "some updated message", sender_name: "some updated sender_name"}

      assert {:ok, %Message{} = message} = Chatmsg.update_message(message, update_attrs)
      assert message.message == "some updated message"
      assert message.sender_name == "some updated sender_name"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Chatmsg.update_message(message, @invalid_attrs)
      assert message == Chatmsg.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Chatmsg.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Chatmsg.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Chatmsg.change_message(message)
    end
  end
end
