defmodule SlaxWeb.ChatRoomLive do
  use SlaxWeb, :live_view
  
  def render(assigns) do
    ~H"""
    <div class ="flext flex-col flex-grow shadow-lg">
    	<div class="flex justify-between items-center flex-shrint-0 h-16 bg-white border-b border-slate-300 px-4">
    		<div class="flex flext-col gap-1.5">
    			<h1 class="text-sm font-bold leading-none">
    				#room-name
    			</h1>
    			<div class="text-xs leading-none h-3.5">Placeholder topic</div>
    		</div>
    	</div>
    </div>
    """
  end
  
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
  
end
