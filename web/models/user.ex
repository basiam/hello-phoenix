defmodule HelloWorld.User do
  use HelloWorld.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :bio, :string
    field :number_of_pets, :integer

    timestamps
  end

  @required_fields ~w(name email bio)
  @optional_fields ~w(number_of_pets)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:bio, min: 10)
    |> validate_length(:bio, max: 140)
    |> validate_format(:email, ~r/@/)
  end
end
