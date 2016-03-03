sendContact = ->
  errorMessage   = $ 'div.error-message'
  successMessage = $ 'div.success-message'
  loadingMessage = $ 'div.loading-message'

  showSuccessMessage = ->
    errorMessage.hide 'false'
    successMessage.show 'slow'
    return

  showErrorMessage = (message)->
    errorMessage.find('.msg').text message
    successMessage.hide 'fast'
    errorMessage.show 'slow'
    return

  showLoading = ->
    $("#target :input").prop("disabled", true);
    $("#target :button").prop("disabled", true);
    $("#target :textarea").prop("disabled", true);

    errorMessage.hide 'fast'
    successMessage.hide 'fast'
    loadingMessage.show 'slow'
    return

  hideLoading = ->
    $("#target :input").prop("disabled", false);
    $("#target :button").prop("disabled", false);
    $("#target :textarea").prop("disabled", false);
    loadingMessage.hide 'fast'
    return

  showLoading()
  obj = {}
  form = $ 'form.tracking-server'

  form.serializeArray().forEach (attr)->
    obj[attr.name] = attr.value
    return

  trackingAnalytics.sendContact obj.name, obj.email, obj.message, (messageError, result)->
    hideLoading()
    return showErrorMessage(messageError) if messageError
    showSuccessMessage()
    return
  false

loaded = ->
  document.addEventListener "submit", (event) ->
    return if !$(event.target).hasClass 'tracking-server'
    event.preventDefault()
    sendContact()

window.addEventListener "load", loaded, false
