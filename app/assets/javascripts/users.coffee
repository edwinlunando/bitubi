$(document).on "page:receive", ->
  tinymce.remove()

$(document).on "ready page:load", ->
  tinymce.init({ selector: "selector" })
