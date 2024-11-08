import { Controller } from "@hotwired/stimulus"
import Tagify from '@yaireo/tagify'

// Connects to data-controller="tag"
export default class extends Controller {
  connect() {
    const tag_input = document.getElementById("search-tags-input");
    var tagify = new Tagify(tag_input, {
      pattern: /^.{0,10}$/, // 10文字制限
      originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(',')
    });
  }
}
