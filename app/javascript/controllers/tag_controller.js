import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    this.input = document.getElementById("tag-input")
    this.hidden = document.getElementById("tag-input-hidden")
    this.list = document.getElementById("tag-list")

    this.input.addEventListener("keydown", (e) => {
      if (e.key === "Enter") {
        e.preventDefault()
        this.addTag()
      }
    })
  }

  addTag() {

    const name = this.input.value.trim()
    if (!name) return

    const tags = this.hidden.value ? this.hidden.value.split(" ") : []

    if (tags.includes(name)) {
      this.input.value = ""
      return
    }

    tags.push(name)
    this.hidden.value = tags.join(" ")

    const span = document.createElement("span")
    span.className = "bg-gray-200 px-2 py-1 rounded text-sm flex items-center"

    const button = document.createElement("button")
    button.type = "button"
    button.className = "ml-1 text-red-500"
    button.dataset.tagName = name
    button.textContent = "×"

    button.addEventListener("click", (event) => this.remove(event))

    span.append(`#${name}`, button)

    this.list.appendChild(span)

    this.input.value = ""
  }

  remove(event) {

    const tagName = event.currentTarget.dataset.tagName
    const tagElement = event.currentTarget.closest("span")

    tagElement.remove()

    const tags = this.hidden.value.split(" ").filter(t => t !== tagName)
    this.hidden.value = tags.join(" ")
  }

}