class ApplicationService < SmartInit::Base
  initialize_with_args :data
  is_callable

  def call
    responce(true, t('messages.application_service'))
  end

  protected

  def responce(is_success, message, data = nil)
    OpenStruct.new(success?: is_success, message: message, data: data)
  end
end
