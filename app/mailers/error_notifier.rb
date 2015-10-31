class ErrorNotifier < ActionMailer::Base
    default :from => 'cave.survey.project@gmail.com'

    # send an error notification email
    def send_error_email(error)
      @error = error
      mail( :to => 'cave.survey.project+error@gmail.com',
            :subject => 'Error reported' )
    end
end
