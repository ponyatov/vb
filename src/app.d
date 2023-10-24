// import std.stdio;

import vibe.vibe;

class WebService {
    @path("/") void index(HTTPServerRequest req, HTTPServerResponse res) {
        logInfo("%s\t%s".format(req.method, req.requestURI));
        res.render!("index.dt", req);
    }
}

void main() {
    auto settings = new HTTPServerSettings;
    settings.port = 8888;
    settings.bindAddresses = ["127.0.0.1"];

    auto router = new URLRouter;
    router.registerWebInterface(new WebService);
    router.rebuild();

    listenHTTP(settings, router);

    runApplication();
}

// void index(HTTPServerRequest req, HTTPServerResponse res) {
//     res.
//     
// }
