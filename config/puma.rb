web_threads = Integer(ENV.fetch('WEB_THREADS'))
web_processes = Integer(ENV.fetch('WEB_PROCESSES'))

threads web_threads, web_threads
workers web_processes
