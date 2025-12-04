import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["player", "button"]

  toggle() {
    if (!this.hasPlayerTarget) return

    if (this.playerTarget.paused) {
      this.playerTarget.currentTime = 0
      this.playerTarget.play()
      this.buttonTarget.innerHTML = '<i class="fa-solid fa-stop"></i>'
    } else {
      this.playerTarget.pause()
      this.playerTarget.currentTime = 0
      this.buttonTarget.innerHTML = '<i class="fa-solid fa-volume-high"></i>'
    }
  }

  connect() {
    if (!this.hasPlayerTarget) return

    this.playerTarget.addEventListener('ended', () => {
      this.buttonTarget.innerHTML = '<i class="fa-solid fa-volume-high"></i>'
    })
  }
}
