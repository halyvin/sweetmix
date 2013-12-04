$(document).ready () ->
  if (cmf = $("#call-me-form")).length
    cmf.on 'ajax:before', (evnt) ->
      cmf.find("input[type=submit]").addClass('disable').prop 'disabled', true
      cmf.find('.ahtung').hide()
      true
    cmf.on 'ajax:complete', (evnt) ->
      cmf.find("input[type=submit]").removeClass('disable').prop 'disabled', false
      true
    cmf.on 'ajax:success', (evnt) ->
      cmf.closest('.popup_wrap').toggleClass('active');
      true
    cmf.on 'ajax:error', (xhr, status) ->
      cmf.find('.ahtung').show()
      true