defmodule Newchat.Chatmsg.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias Newchat.Chatrooms.Room
  alias Newchat.Accounts.User

  schema "messages" do
    field :message, :string
    field :sender_name, :string
    belongs_to :room, Room
    belongs_to :sender, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:message, :sender_id, :sender_name])
    |> validate_required([:message, :sender_name])
  end
end
