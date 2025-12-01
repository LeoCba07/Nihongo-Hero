import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = {newExp: Number, oldExp: Number, levelUp: Boolean}
  connect() {
    console.log(this.element, this.newExpValue)
    this.element.style.width = `${this.newExpValue}%`
  }
}
