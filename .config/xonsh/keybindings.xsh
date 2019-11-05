@events.on_ptk_create
def custom_keybindings(bindings, **kw):
    handler = bindings.add

    @handler(Keys.ControlX, Keys.ControlF)
    def pemacs(event):
        file = $(fd -H -t f| peco).strip()
        if file:
            emacs @(file)
        event.cli.renderer.erase()

    @handler(Keys.ControlR)
    def phistory(event):
        all_history = list(dict.fromkeys(reversed([
            command['inp']
            for command in __xonsh__.history.all_items()
        ])))
        command = $(echo @('\n'.join(all_history)) | peco).strip()
        if command:
            event.current_buffer.insert_text(command)
        else:
            event.cli.renderer.erase()

    @handler(Keys.ControlX, Keys.ControlJ)
    def cdhistory(event):
        cd_history = list(dict.fromkeys($(dirs -p).split('\n')))
        dest = $(echo @('\n'.join(cd_history)) | peco).strip()
        if dest:
            cd @(dest)
        event.cli.renderer.erase()
