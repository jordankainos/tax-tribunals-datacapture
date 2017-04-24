FROM ministryofjustice/ruby:2.3.3-webapp-onbuild

ENV PUMA_PORT 3000

ENV DATABASE_URL                 replace_this_at_build_time
ENV GLIMR_API_URL                replace_this_at_build_time
ENV EXTERNAL_URL                 replace_this_at_build_time
ENV PAYMENT_ENDPOINT             replace_this_at_build_time
ENV MOJ_FILE_UPLOADER_ENDPOINT   replace_this_at_build_time
ENV TAX_TRIBUNALS_DOWNLOADER_URL replace_this_at_build_time
ENV SENTRY_DSN                   replace_this_at_build_time
ENV GOVUK_NOTIFY_API_KEY         replace_this_at_build_time
ENV GA_TRACKING_ID               replace_this_at_build_time
ENV TAX_TRIBUNAL_EMAIL           replace_this_at_build_time

ENV NOTIFY_CASE_CONFIRMATION_TEMPLATE_ID        replace_this_at_build_time
ENV NOTIFY_FTT_CASE_NOTIFICATION_TEMPLATE_ID    replace_this_at_build_time
ENV NOTIFY_CASE_FIRST_REMINDER_TEMPLATE_ID      replace_this_at_build_time
ENV NOTIFY_CASE_LAST_REMINDER_TEMPLATE_ID       replace_this_at_build_time
ENV NOTIFY_NEW_CASE_SAVED_TEMPLATE_ID           replace_this_at_build_time
ENV NOTIFY_RESET_PASSWORD_TEMPLATE_ID           replace_this_at_build_time
ENV NOTIFY_CHANGE_PASSWORD_TEMPLATE_ID          replace_this_at_build_time

RUN touch /etc/inittab

RUN apt-get update && apt-get install -y

EXPOSE $PUMA_PORT

RUN bundle exec rake assets:precompile RAILS_ENV=production       SECRET_KEY_BASE=required_but_does_not_matter_for_assets

ENTRYPOINT ["./run.sh"]
