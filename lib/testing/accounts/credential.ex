defmodule Testing.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  alias Testing.Accounts.User

  schema "credentials" do
    field :email, :string
    belongs_to :user, User

    timestamps()
  end

  # @spec changeset(
  #         {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
  #         :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
  #       ) :: Ecto.Changeset.t()
  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
