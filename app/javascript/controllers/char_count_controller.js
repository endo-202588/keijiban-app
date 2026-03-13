import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="char-count"
export default class extends Controller {
  static targets = ["input", "counter"]

  update() {
    const length = this.inputTarget.value.length
    this.counterTarget.textContent = `${length} / 200`
  }
}
