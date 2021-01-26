import tornado.ioloop

import chat


def make_app():
    return tornado.web.Application([
        (r"/chat", chat.Chat)
    ])


if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()
