import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { background: String }

  focus(event) {
    event.preventDefault()

    // Remove focus from all other completed nodes
    document.querySelectorAll('.node-completed--focused').forEach(node => {
      node.classList.remove('node-completed--focused')
    })

    // Add focus to this node
    this.element.classList.add('node-completed--focused')

    // Center on screen
    this.element.scrollIntoView({
      behavior: 'smooth',
      block: 'center'
    })

    // Change background
    const mapContainer = document.getElementById('map-container')
    if (mapContainer && this.backgroundValue) {
      mapContainer.style.backgroundImage = `url('${this.backgroundValue}')`
    }
  }
}
