defmodule HermeneuticsWeb.PanelLive do
  use HermeneuticsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    status = if connected?(socket), do: "WebSocket connected", else: "Connecting..."

    {:ok,
     assign(socket,
       count: 0,
       status: status,
       left_count: 0,
       right_count: 0
     )}
  end

  @impl true
  def handle_event("increment", _params, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def handle_event("left-increment", _params, socket) do
    {:noreply, update(socket, :left_count, &(&1 + 1))}
  end

  def handle_event("right-increment", _params, socket) do
    {:noreply, update(socket, :right_count, &(&1 + 1))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="panel-root" class="flex h-full">
      <aside id="left" class="w-1/2 border-r border-base-300 p-4">
        <h2 class="font-semibold">Left panel</h2>
        <p class="text-sm text-base-content/70">
          Left events: <strong id="left-count">{@left_count}</strong>
        </p>
        <button
          id="left-increment"
          type="button"
          phx-click="left-increment"
          class="cursor-pointer rounded-md bg-neutral px-4 py-2 text-sm font-medium text-neutral-content"
        >
          Left +1
        </button>
      </aside>

      <aside id="right" class="w-1/2 p-4">
        <h2 class="font-semibold">Right panel</h2>
        <p class="text-sm text-base-content/70">
          Right events: <strong id="right-count">{@right_count}</strong>
        </p>
        <button
          id="right-increment"
          type="button"
          phx-click="right-increment"
          class="cursor-pointer rounded-md bg-emerald-600 px-4 py-2 text-sm font-medium text-white"
        >
          Right +1
        </button>
      </aside>

      <p id="connection-status" class="text-xs text-base-content/50">
        {@status}
      </p>
    </div>
    """
  end
end
