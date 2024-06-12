import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "outputField", "outputContainer"]

  connect() {
    const passwordForm = document.getElementById("user_current_password")
    this.outputContainerTarget.hidden = true
    this.outputFieldTarget.disabled = true
  }

  displayPassword() {
    this.outputContainerTarget.hidden = (this.inputTarget.value === "")
    this.outputFieldTarget.disabled = (this.inputTarget.value === "")
  }
}
