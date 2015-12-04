function pydoScripts#init()
    python << EOF
import vim

def get_visual_range():
    """
    cuts out the actual visual range from vim
    """
    buf = vim.current.buffer
    (lnum1, col1) = buf.mark('<')
    (lnum2, col2) = buf.mark('>')
    lines = vim.eval('getline({}, {})'.format(lnum1, lnum2))
    if len(lines) == 1:
        lines[0] = lines[0][col1:col2 + 1]
    else:
        lines[0] = lines[0][col1:]
        lines[-1] = lines[-1][:col2 + 1]
    return "\n".join(lines)

def delete_visual_selection():
    """
    deletes the current visual selection
    """
    buf = vim.current.buffer
    (lnum1, col1) = buf.mark('<')
    (lnum2, col2) = buf.mark('>')

    vim.current.buffer[lnum1] = vim.current.buffer[lnum1][:col1]
    vim.current.buffer[lnum2] = vim.current.buffer[lnum2][col2:]

    a = lnum2 - lnum1

    while a > 1:  # 1 cos the buffer has always a line
        a -= 1
        del buf[lnum1+1]


class PyDoer:

    def __init__(self):
        pass



    def visual_query_inplace(self, mode):
        """
        Takes the visual range calcs as python method and returns its value to the
        cursor position
        """
        line = vim.current.line
        pos = vim.current.window.cursor[1]
        output = eval(get_visual_range())
#        output = exec("print('peter')")

        #delete_visual_selection()

        vim.current.line = line[:pos]+str(output)+line[pos:]

    def visual_query_before(self):
        """
        Takes the visual range calcs as python method and returns its value to the
        cursor position
        """

        line = vim.current.line
        pos = vim.current.window.cursor[1]
        output = eval(get_visual_range())
        vim.current.line = line[:pos]+str(output)+line[pos:]


LittleHelper = PyDoer()
EOF
endfunc
