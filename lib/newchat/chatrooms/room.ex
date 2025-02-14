defmodule Newchat.Chatrooms.Room do
  use Ecto.Schema
  import Ecto.Changeset

  alias Newchat.Accounts.User

  schema "rooms" do
    field :name, :string
    belongs_to :user, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
