import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// tagify
import Tagify from "@yaireo/tagify"

// document.addEventListener('turbo:load', (event) => {
//   new Tagify(document.querySelector('#recipe_tags'));
// });
