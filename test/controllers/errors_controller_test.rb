require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase

  @controller = ErrorsController.new

  test 'should create error report' do
    # none initially
    count_errors = ErrorReport.count
    assert_equal 0, count_errors

    # create
    report = { android_device: { 'MANUFACTURER' => 'some manifacturer', 'MODEL' => 'some model', 'VERSION' => '4.0.4' },
               cave_survey_app: { 'version' => '1.16'},
               error: 'Error doing something'
    }
    post :create, ActiveSupport::JSON.encode(report), format: 'json'
    assert_response :success

    # one created
    count_errors = ErrorReport.count
    assert_equal 1, count_errors

    # verify
    error_report = ErrorReport.first
    assert_equal report[:error], error_report[:error]
    assert_equal report[:cave_survey_app], eval(error_report[:cave_survey_app])
    assert_equal report[:android_device], eval(error_report[:android_device])
    assert !error_report[:request].empty?

  end

=begin
  test 'should handle errors' do
    post :create, '', format: 'json'
    assert_response :bad_request

    post :create, {}, format: 'json'
    assert_response :bad_request

    post :create, ActiveSupport::JSON.encode({}), format: 'json'
    assert_response :bad_request

    post :create, ActiveSupport::JSON.encode({error: '123'}), format: 'json'
    assert_response :bad_request
  end
=end

  test 'should route to create error report' do
    assert_routing({ path: 'errors', method: :post }, { controller: 'errors', action: 'create' })
  end

end
