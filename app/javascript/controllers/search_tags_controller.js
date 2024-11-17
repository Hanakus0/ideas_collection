import { Controller } from "@hotwired/stimulus"
import Tagify from '@yaireo/tagify'

// Connects to data-controller="tag"
export default class extends Controller {
  connect() {
    const tag_input = document.getElementById("search-tags-input");
    var tagify = new Tagify(tag_input, {
      pattern: /^.{0,10}$/, // 10文字制限
      originalInputValueFormat: valuesArr => valuesArr.map(item => item.value).join(','),
      whitelist:[],
      dropdown : {
        classname     : "color-blue",
        enabled       : 0,              // show the dropdown immediately on focus
        maxItems      : 5,
        position      : "input",         // place the dropdown near the typed text
        closeOnSelect : true,          // keep the dropdown open after selecting a suggestion
        highlightFirst: true
      }
    }),
    controller; // for aborting the call

    // listen to any keystrokes which modify tagify's input
    tagify.on('input', onInput)

    function onInput( e ){
      var value = e.detail.value
      tagify.whitelist = null // reset the whitelist

      // https://developer.mozilla.org/en-US/docs/Web/API/AbortController/abort
      controller && controller.abort()
      controller = new AbortController()

      // show loading animation.
      tagify.loading(true)

      const SEARCH_TAGS_URL = '/tags/search?value=';
      fetch(SEARCH_TAGS_URL + value, { signal:controller.signal })
        .then(RES => RES.json())
        .then(function(newWhitelist){
          console.log(newWhitelist);
          tagify.whitelist = newWhitelist // update whitelist Array in-place
          tagify.loading(false).dropdown.show(value) // render the suggestions dropdown
        });
    }
  }
}

