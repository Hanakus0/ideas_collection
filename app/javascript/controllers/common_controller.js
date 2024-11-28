import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'comment' ];
  
  connect() {
    console.log(this.commentTarget);
    // this.commentTarget.value = "";
  }
}
