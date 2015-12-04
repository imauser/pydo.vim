import vim

def get_range():
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


import sys

if sys.argv[0] == "v":
    line = vim.current.line
    pos = vim.current.window.cursor[1]
    output = eval(get_range())

if sys.argv[1] == "h":
    vim.current.line = line[:pos]+str(output)+line[pos:]
