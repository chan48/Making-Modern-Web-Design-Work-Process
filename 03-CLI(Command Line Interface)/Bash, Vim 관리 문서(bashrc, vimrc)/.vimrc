set autoindent
set cindent
set smartindent
set nocompatible
set visualbell
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set tabstop=4
set shiftwidth=4
set number

"한글 파일은 euc-kr로 읽어들이며, 유니코드는 유니코드로 읽어들이도록 설정
set fencs=ucs-bom,utf-8,euc-kr.latin1

if has("syntax")
syntax on
endif

colo evening

"=================== 로케일 설정 =================================
if has("unix")
set encoding=euc-kr
elseif has ("win32")
set encoding=cp949
endif

"======================= UTF-8, euc-kr 한글문서 그냥 열기 ====================
if v:lang =~ "^ko"
set encoding=cp949
set fileencodings=utf-8,cp949
set guifontset=-*-*-medium-r-normal--16-*-*-*-*-*-*-*
elseif v:lang =~ "^ja_JP"
set fileencodings=euc-jp
set guifontset=-misc-fixed-medium-r-normal--14-*-*-*-*-*-*-*
elseif v:lang =~ "^zh_TW"
set fileencodings=big5
set guifontset=-sony-fixed-medium-r-normal--16-150-75-75-c-80-iso8859-1,-taipei-fixed-medium-r-normal--16-150-75-75-c-160-big5-0
elseif v:lang =~ "^zh_CN"
set fileencodings=gb2312
set guifontset=*-r-*
endif

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
set encoding=utf-8
set fileencodings=utf-8,cp949
endif

"================= Key 매핑 ========================
map "맨 위로
map "맨 마지막으로
map :25vs ./ "F2: 탐색기 열기
map :only "창 최대화
map v]} zf "폴딩

"================= Gcc 컴파일 & 실행 설정 ==============
map :w! "현재 작업 저장
map :!g++ -W -Wall -O2 -g % -o %< "컴파일
map :!%< "실행

" 확장자가 launch인 파일을 xml과 같이 취급함 (하일라이트)
autocmd BufEnter *.launch set filetype=xml
" 확장자가 xacro인 파일을 xml과 같이 취급함 (하일라이트)
autocmd BufEnter *.xacro set filetype=xml

" 저장 후 다시 파일 편집 들어갈때, 최종 편집 지점에 커서를 위치하도록 설정.
au BufWinLeave * mkview
au BufWinEnter * silent loadview