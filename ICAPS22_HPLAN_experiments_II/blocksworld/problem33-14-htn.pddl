( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b978 - block
    b408 - block
    b466 - block
    b533 - block
    b749 - block
    b192 - block
    b798 - block
    b831 - block
    b9 - block
    b177 - block
    b914 - block
    b433 - block
    b872 - block
    b428 - block
    b581 - block
    b343 - block
    b161 - block
    b743 - block
    b984 - block
    b863 - block
    b788 - block
    b300 - block
    b789 - block
    b409 - block
    b145 - block
    b935 - block
    b625 - block
    b901 - block
    b404 - block
    b227 - block
    b879 - block
    b127 - block
    b149 - block
    b534 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b978 )
    ( on b408 b978 )
    ( on b466 b408 )
    ( on b533 b466 )
    ( on b749 b533 )
    ( on b192 b749 )
    ( on b798 b192 )
    ( on b831 b798 )
    ( on b9 b831 )
    ( on b177 b9 )
    ( on b914 b177 )
    ( on b433 b914 )
    ( on b872 b433 )
    ( on b428 b872 )
    ( on b581 b428 )
    ( on b343 b581 )
    ( on b161 b343 )
    ( on b743 b161 )
    ( on b984 b743 )
    ( on b863 b984 )
    ( on b788 b863 )
    ( on b300 b788 )
    ( on b789 b300 )
    ( on b409 b789 )
    ( on b145 b409 )
    ( on b935 b145 )
    ( on b625 b935 )
    ( on b901 b625 )
    ( on b404 b901 )
    ( on b227 b404 )
    ( on b879 b227 )
    ( on b127 b879 )
    ( on b149 b127 )
    ( on b534 b149 )
    ( clear b534 )
  )
  ( :tasks
    ( Make-33Pile b408 b466 b533 b749 b192 b798 b831 b9 b177 b914 b433 b872 b428 b581 b343 b161 b743 b984 b863 b788 b300 b789 b409 b145 b935 b625 b901 b404 b227 b879 b127 b149 b534 )
  )
)
