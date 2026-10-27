rex.bind("cmd+h", "client.tab.previous")
rex.bind("cmd+l", "client.tab.next")

rex.bind("cmd+w", "client.tab.close")
rex.bind("cmd+s", "session.switch")
rex.bind("cmd+shift+s", "session.rename")
rex.bind("cmd+shift+t", "client.tab.rename")


rex.bind("cmd+d", "pane.split.right")
rex.bind("cmd+shift+d", "pane.split.down")

rex.bind("cmd+j", "pane.focus.down")
rex.bind("cmd+k", "pane.focus.up")
rex.bind("cmd+l", "client.tab.next")

rex.bind("cmd+z", "pane.zoom")

rex.bind("cmd+shift+h", "pane.resize", { direction = "left" })
rex.bind("cmd+shift+l", "pane.resize", { direction = "right" })
rex.bind("cmd+shift+w", "pane.close")
