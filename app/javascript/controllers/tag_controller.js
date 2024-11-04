import { Controller } from "@hotwired/stimulus"
import Tagify from '@yaireo/tagify'

// Connects to data-controller="tag"
export default class extends Controller {
  connect() {
    // var input = document.getElementById("tags-input");  
    console.log(input);
    // new Tagify(input);
  }
}
