defmodule Ambi.Reading do
  use Ecto.Schema
  import Ecto.Changeset

  schema "readings" do
    field :air_purity, :string
    field :dust_concentration, :float
    field :humidity, :float
    field :pressure, :integer
    field :temperature, :float

    timestamps()
  end

  @doc false
  def changeset(reading, attrs) do
    reading
    |> IO.inspect(label: "before")
    |> cast(attrs, [:temperature, :humidity, :dust_concentration, :pressure, :air_purity])
    |> IO.inspect(label: "cast")
    |> validate_required([:temperature, :humidity, :dust_concentration, :pressure, :air_purity])
    |> IO.inspect(label: "validate_required")
  end
end
