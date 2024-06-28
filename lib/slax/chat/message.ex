defmodule Slax.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do

    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [])
    |> validate_required([])
  end
end
