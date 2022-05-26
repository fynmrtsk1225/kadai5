require "cgi"
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi["transferee"]
  "<html>
    <body>
      <p>自家消費以外のゴーヤ情報は下記になります</p>
      #{get}
    </body>
  </html>"
}