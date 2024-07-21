defmodule SlaxWeb.OnlineUsers do
  alias SlaxWeb.Presence

  @topic "online_users"

  def list() do
    @topic
    |> Presence.list()
  end

  def track(pid, user) do
    {:ok, _} = Presence.track(pid, @topic, user.id, %{})
    :ok
  end
end
