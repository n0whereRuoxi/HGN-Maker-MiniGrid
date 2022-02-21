( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b346 - block
    b2 - block
    b103 - block
    b792 - block
    b455 - block
    b177 - block
    b419 - block
    b42 - block
    b984 - block
    b41 - block
    b252 - block
    b544 - block
    b740 - block
    b644 - block
    b657 - block
    b922 - block
    b906 - block
    b824 - block
    b473 - block
    b853 - block
    b843 - block
    b707 - block
    b628 - block
    b482 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b346 )
    ( on b2 b346 )
    ( on b103 b2 )
    ( on b792 b103 )
    ( on b455 b792 )
    ( on b177 b455 )
    ( on b419 b177 )
    ( on b42 b419 )
    ( on b984 b42 )
    ( on b41 b984 )
    ( on b252 b41 )
    ( on b544 b252 )
    ( on b740 b544 )
    ( on b644 b740 )
    ( on b657 b644 )
    ( on b922 b657 )
    ( on b906 b922 )
    ( on b824 b906 )
    ( on b473 b824 )
    ( on b853 b473 )
    ( on b843 b853 )
    ( on b707 b843 )
    ( on b628 b707 )
    ( on b482 b628 )
    ( clear b482 )
  )
  ( :goal
    ( and
      ( clear b346 )
    )
  )
)
