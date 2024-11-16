import { Controller } from "@hotwired/stimulus"
import Tagify from '@yaireo/tagify'

// Connects to data-controller="tag"
export default class extends Controller {
  connect() {
    const tag_input = document.getElementById("search-words-input");
    var tagify = new Tagify(tag_input, {
      originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(',')
    });
  }
}
