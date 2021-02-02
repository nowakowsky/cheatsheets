### Example python http server
[docs - not that good](https://python.readthedocs.io/en/stable/library/http.server.html)

```python
from http.server import BaseHTTPRequestHandler, HTTPServer

PORT = 80

class WebHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        try:
            if self.path.endswith("/hello"):
                self.send_response(200)
                self.send_header("Content-type", 'text/html')
                self.end_headers()

                self.wfile.write(str.encode("Hello!"))
                return None
        except IOError:
            self.send_error(500, "error")
        self.send_error(404, "file not found")
                
def main():
    try:
        server = HTTPServer(('', PORT), WebHandler)
        server.serve_forever()
    except:
        pass

if __name__ == '__main__':
    main()
```
