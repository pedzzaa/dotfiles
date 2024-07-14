require('toggleterm').setup{
    size = 15,
    open_mapping = [[<M-t>]],
    shade_filetypes = {'java', 'py', 'lua', 'c', 'cpp', 'js', 'sh'},
    shade_terminals = true,
    shading_factor = '2',
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal'
}
