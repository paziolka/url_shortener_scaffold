class UrlsController < ApplicationController
  def index
    @urls = Url.all.order(created_at: :asc)
  end

  def show
    # TODO: rename link to token
    service = RedirectService.new(link: params[:link])

    if service.call
      redirect_to service.redirect_url
    else
      # TODO: in general: add success and error objects with messages to pass here
      redirect_to urls_path, alert: 'Wrong URL.'
    end
  end

  def new
    @form = CreateUrlForm.new
  end

  def create
    @form = CreateUrlForm.new(url_params)
    service = CreateUrlService.new(form: @form)

    if service.call
      redirect_to urls_path, notice: 'Url was successfully created.'
    else
      render :new
    end
  end

  private

  def url_params
    params.require(:url_form).permit(:original)
  end
end
