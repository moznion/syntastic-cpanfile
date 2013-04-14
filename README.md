# syntastic-cpanfile

cpanfile syntax checker for [syntastic](https://github.com/scrooloose/syntastic)


# How to install

Copy syntax\_checker/cpanfile to the syntastic directory.  
e.g.)

    cp -R syntax_checker/cpanfile/ ~/.vim/bundle/syntastic/syntax_checkers/

And also you can use symbolic link. (I think, this way is better...)


# Configuration and Environment

Please configure into .vimrc like so;

    ...
    au BufNewFile,BufRead cpanfile set filetype=cpanfile
    au BufNewFile,BufRead cpanfile set syntax=perl.cpanfile
    ...


# Dependencies

- [Module::CPANfile](https://metacpan.org/release/Module-CPANfile)
- [syntastic](https://github.com/scrooloose/syntastic)


#License

MIT License

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
