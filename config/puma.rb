max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

if ENV['RAILS_ENV'] == 'production'
  port        ENV.fetch("PORT")
  environment ENV.fetch("RAILS_ENV")
  pidfile     ENV.fetch("PIDFILE")
end


if ENV['RAILS_ENV'] == 'development'
  localhost_key = "#{File.join('config', 'local-cert', 'localhost-key.pem')}" 
  localhost_crt = "#{File.join('config', 'local-cert', 'localhost.pem')}"

  worker_timeout  3600
  port            3030
  environment     "development"
  pidfile         "tmp/pids/server.pid"

  ssl_bind 'localhost', 3000, {
    key: localhost_key,
    cert: localhost_crt,
    verify_mode: 'none'
  }
end

plugin :tmp_restart