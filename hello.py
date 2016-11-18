def application(environ, start_response):
    status = '200 OK'
    response_headers = [
        ('Content-Type', 'text/plain'),
    ]

    query_string = environ.get('QUERY_STRING')
    params = query_string.split("&")
    response_body = '\n'.join(params)

    start_response(status, response_headers)
    return [response_body]