$(document).on "turbolinks:load", ->
  TSICMS.imagePreview("#admin_image, #recommendation_image")
  TSICMS.imagePreview("#academic_image")
  TSICMS.imagePreview("#professor_image")
  $('[data-toggle="tooltip"]').tooltip()
