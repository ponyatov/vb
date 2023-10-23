import std.stdio;

import vibe.vibe;

void main() {
    auto settings = new HTTPServerSettings();
    settings.port = 8888;
    settings.bindAddresses = ["127.0.0.1"];
    auto listener = listenHTTP(settings, &hello);
    scope (exit)
        listener.stopListening;
    logInfo("http://127.0.0.1:8888");
    runApplication();
}

void hello(HTTPServerRequest req, HTTPServerResponse res) {
    logInfo("%s\t%s".format(req.method, req.requestURI));
    res.writeBody("Hello, World!");
}
