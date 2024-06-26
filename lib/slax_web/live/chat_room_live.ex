defmodule SlaxWeb.ChatRoomLive do
  use SlaxWeb, :live_view
  
  alias Slax.Repo
  alias Slax.Chat.Room
  
  def render(assigns) do
    ~H"""
    <div class ="flext flex-col flex-grow shadow-lg">
    	<div class="flex justify-between items-center flex-shrint-0 h-16 bg-white border-b border-slate-300 px-4">
    		<div class="flex flext-col gap-1.5">
    			<h1 class="text-sm font-bold leading-none">
    				#<%= @room.name %>
    			</h1>
    			<div class="text-xs leading-none h-3.5" phx-click="toggle-topic">
    				<%= if @hide_topic? do %>
    					<span class="text-slate-600">[Topic hidden]</span>
    				<% else %>
    					<%= @room.topic %>
    				<% end %>
    			</div>
    		</div>
    	</div>
    </div>
    """
  end
  
  def mount(_params, _session, socket) do
  	# This room variable is passed to the render function.
  	room = Room
  	|> Repo.all()
		|> List.first()
    
  	{:ok, assign(socket, hide_topic?: false, room: room)}
  end
  
  def handle_event("toggle-topic", _params, socket) do
  	# Use update when an assign's new value depends on its old value
  	{:noreply, update(socket, :hide_topic?, &(!&1))}
  end
  
end
