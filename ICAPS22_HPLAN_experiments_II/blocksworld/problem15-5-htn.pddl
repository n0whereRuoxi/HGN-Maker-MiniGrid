( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b929 - block
    b68 - block
    b727 - block
    b99 - block
    b347 - block
    b747 - block
    b978 - block
    b630 - block
    b477 - block
    b50 - block
    b885 - block
    b60 - block
    b444 - block
    b604 - block
    b625 - block
    b390 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b929 )
    ( on b68 b929 )
    ( on b727 b68 )
    ( on b99 b727 )
    ( on b347 b99 )
    ( on b747 b347 )
    ( on b978 b747 )
    ( on b630 b978 )
    ( on b477 b630 )
    ( on b50 b477 )
    ( on b885 b50 )
    ( on b60 b885 )
    ( on b444 b60 )
    ( on b604 b444 )
    ( on b625 b604 )
    ( on b390 b625 )
    ( clear b390 )
  )
  ( :tasks
    ( Make-15Pile b68 b727 b99 b347 b747 b978 b630 b477 b50 b885 b60 b444 b604 b625 b390 )
  )
)
