return {
    "img-paste-devs/img-paste.vim",
    ft = "markdown",
    config = function()
        vim.cmd([[
        autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
        " there are some defaults for image directory and image name, you can change them
        " let g:mdip_imgdir = 'img'
        " let g:mdip_imgname = 'image'
        function! g:LatexPasteImage(relpath)
            execute "normal! i\\includegraphics{" . a:relpath . "}\r\\caption{I"
            let ipos = getcurpos()
            execute "normal! a" . "mage}"
            call setpos('.', ipos)
            execute "normal! ve\<C-g>"
        endfunction
        autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
        autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'
        ]])
    end,
}
