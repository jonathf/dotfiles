from IPython.terminal.prompts import Prompts, Token


class MyPrompt(Prompts):

    def in_prompt_tokens(self, cli=None):
        self.current_prompt = Token.Prompt
        if self.shell.pt_app.app.vi_state.input_mode == "vi-navigation":
            self.current_prompt = Token.PromptNum
        if not self.shell.last_execution_succeeded:
            self.current_prompt = Token.Comment
        return [(self.current_prompt, ">>> ")]

    def continuation_prompt_tokens(self, cli=None, width=None):
        if width is None:
            width = self._width()
        return [(self.current_prompt, (' ' * (width - 4)) + '... ')]

    def rewrite_prompt_tokens(self):
        width = self._width()
        return [(self.current_prompt, ('-' * (width - 2)) + '> ')]

    def out_prompt_tokens(self):
        return [(Token.OutPromptNum, '<<< ')]
