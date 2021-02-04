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
                output = "<html><body><h1>hello</h1><form method='POST' enctype='multipart/form-data' action='/hello'><h2>What would you like me to say?</h2><input name='message' type='text'><input type='submit' value='Submit'></form></body></html>"
                self.wfile.write(str.encode(output))
                return None
        except IOError:
            self.send_error(500, "error")
        self.send_error(404, "file not found")
       
    def do_POST(self):
        try:
            self.send_response(301)
            self.end_headers()

            ctype, pdict = cgi.parse_header(self.headers['content-type'])
            pdict['boundary'] = bytes(pdict['boundary'], "utf-8")
        
            if ctype == 'multipart/form-data':
                fields=cgi.parse_multipart(self.rfile, pdict)

            messagecontent = fields.get('message')

            output = "<html><body><h2> ok </h2>"
            output += f'<h1>{messagecontent[0]}</h1></body></html>'

            self.wfile.write(str.encode(output))
        except:
            self.send_error(500, "error")
       
def main():
    try:
        server = HTTPServer(('', PORT), WebHandler)
        server.serve_forever()
    except:
        pass

if __name__ == '__main__':
    main()
```
