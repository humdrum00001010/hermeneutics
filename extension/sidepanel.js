const response = await fetch("http://127.0.0.1:4000/", {credentials: "include"})
const page = new DOMParser().parseFromString(await response.text(), "text/html")
const root = page.querySelector("[data-phx-session]")

// Insert the LiveView root (which carries data-phx-session) into the panel,
// then map its left/right components into the two physical panel containers.
// The root stays in the DOM so app.js can mount ONE LiveView process over it.
document.querySelector("#panel-root").replaceWith(root)

document.querySelector("meta[name='csrf-token']").content =
  page.querySelector("meta[name='csrf-token']").content

await import("./app.js")
