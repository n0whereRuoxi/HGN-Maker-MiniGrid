( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b199 - block
    b344 - block
    b422 - block
    b633 - block
    b953 - block
    b408 - block
    b554 - block
    b262 - block
    b53 - block
    b327 - block
    b898 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b199 )
    ( on b344 b199 )
    ( on b422 b344 )
    ( on b633 b422 )
    ( on b953 b633 )
    ( on b408 b953 )
    ( on b554 b408 )
    ( on b262 b554 )
    ( on b53 b262 )
    ( on b327 b53 )
    ( on b898 b327 )
    ( clear b898 )
  )
  ( :tasks
    ( Make-10Pile b344 b422 b633 b953 b408 b554 b262 b53 b327 b898 )
  )
)
