from IPython.terminal.prompts import Prompts, Token

class MyPrompt(Prompts):

    def in_prompt_tokens(self, cli=None):
        mode = self.shell.pt_app.app.vi_state.input_mode
        out = {
            "vi-insert": [(Token.Prompt, '>>> ')],
            "vi-navigation": [(Token.Prompt, 'vi> ')]
        }
        if mode not in out:
            print("unsupported vi-mode", mode)
            mode = "vi-insert"
        return out[mode]

    def continuation_prompt_tokens(self, cli=None, width=None):
        if width is None:
            width = self._width()
        return [(Token.Prompt, (' ' * (width - 4)) + '... ')]

    def rewrite_prompt_tokens(self):
        width = self._width()
        return [(Token.Prompt, ('-' * (width - 2)) + '> ')]

    def out_prompt_tokens(self):
        return [(Token.OutPrompt, '<<< ')]
