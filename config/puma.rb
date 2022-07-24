max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"
port ENV.fetch("PORT") { 3030 }
environment ENV.fetch("RAILS_ENV") { "development" }
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

plugin :tmp_restart

if ENV['RAILS_ENV'] == 'development'
  localhost_key = "#{File.join('config', 'local-cert', 'localhost-key.pem')}" 
  localhost_crt = "#{File.join('config', 'local-cert', 'localhost.pem')}"

  ssl_bind 'localhost', 3000, {
    key: localhost_key,
    cert: localhost_crt,
    verify_mode: 'none'
  }
end
