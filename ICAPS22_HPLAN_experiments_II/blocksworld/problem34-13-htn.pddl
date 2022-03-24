( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b630 - block
    b335 - block
    b146 - block
    b737 - block
    b470 - block
    b951 - block
    b139 - block
    b446 - block
    b626 - block
    b342 - block
    b256 - block
    b930 - block
    b782 - block
    b960 - block
    b253 - block
    b854 - block
    b819 - block
    b394 - block
    b325 - block
    b965 - block
    b110 - block
    b60 - block
    b25 - block
    b264 - block
    b300 - block
    b542 - block
    b550 - block
    b170 - block
    b234 - block
    b19 - block
    b467 - block
    b415 - block
    b667 - block
    b89 - block
    b113 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b630 )
    ( on b335 b630 )
    ( on b146 b335 )
    ( on b737 b146 )
    ( on b470 b737 )
    ( on b951 b470 )
    ( on b139 b951 )
    ( on b446 b139 )
    ( on b626 b446 )
    ( on b342 b626 )
    ( on b256 b342 )
    ( on b930 b256 )
    ( on b782 b930 )
    ( on b960 b782 )
    ( on b253 b960 )
    ( on b854 b253 )
    ( on b819 b854 )
    ( on b394 b819 )
    ( on b325 b394 )
    ( on b965 b325 )
    ( on b110 b965 )
    ( on b60 b110 )
    ( on b25 b60 )
    ( on b264 b25 )
    ( on b300 b264 )
    ( on b542 b300 )
    ( on b550 b542 )
    ( on b170 b550 )
    ( on b234 b170 )
    ( on b19 b234 )
    ( on b467 b19 )
    ( on b415 b467 )
    ( on b667 b415 )
    ( on b89 b667 )
    ( on b113 b89 )
    ( clear b113 )
  )
  ( :tasks
    ( Make-34Pile b335 b146 b737 b470 b951 b139 b446 b626 b342 b256 b930 b782 b960 b253 b854 b819 b394 b325 b965 b110 b60 b25 b264 b300 b542 b550 b170 b234 b19 b467 b415 b667 b89 b113 )
  )
)
