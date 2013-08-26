class RecognizeRailtie < Rails::Railtie
  rake_tasks do
    load 'tasks/recognize.rake'
  end
end
