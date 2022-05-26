require "cgi"
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi["false"]
  "<html>
    <body>
      <p>低品質（false)のゴーヤ情報は下記になります</p>
      #{get}
    </body>
  </html>"
}