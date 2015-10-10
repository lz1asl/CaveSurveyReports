class ErrorsController < ApplicationController
  respond_to :json

  def create
    begin
      report_body = ActiveSupport::JSON.decode request.body.string

      report = ErrorReport.new(
        android_device: report_body['android_device'],
        cave_survey_app: report_body['cave_survey_app'],
        error: report_body['error'],
        request: { ip: request.remote_ip }
      )

      report.save

      render nothing: true, status: 201
    rescue => e
      puts e, e.backtrace
      render nothing: true, status: 400
    end
  end
end
