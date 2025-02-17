defmodule Newchat.Chatrooms.Room do
  use Ecto.Schema
  import Ecto.Changeset

  alias Newchat.Accounts.User
  alias Newchat.Chatmsg.Message

  schema "rooms" do
    field :name, :string
    belongs_to :user, User
    has_many :messages, Message

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name])
  end
end
