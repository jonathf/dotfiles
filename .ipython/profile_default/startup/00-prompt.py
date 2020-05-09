from IPython.terminal.prompts import Prompts, Token

MODES = {
    "vi-insert": [(Token.Prompt, '>>> ')],
    "vi-navigation": [(Token.Prompt, 'vi> ')]
}

class MyPrompt(Prompts):

    def in_prompt_tokens(self, cli=None):
        try:
            mode = self.shell.pt_app.app.vi_state.input_mode
        except AttributeError:
            mode = "vi-insert"
        if mode not in MODES:
            print("unsupported vi-mode", mode)
            mode = "vi-insert"
        return MODES[mode]

    def continuation_prompt_tokens(self, cli=None, width=None):
        if width is None:
            width = self._width()
        return [(Token.Prompt, (' ' * (width - 4)) + '... ')]

    def rewrite_prompt_tokens(self):
        width = self._width()
        return [(Token.Prompt, ('-' * (width - 2)) + '> ')]

    def out_prompt_tokens(self):
        return [(Token.OutPrompt, '<<< ')]
