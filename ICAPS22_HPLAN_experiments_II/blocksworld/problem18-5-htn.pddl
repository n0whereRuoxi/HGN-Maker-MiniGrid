( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b337 - block
    b994 - block
    b904 - block
    b123 - block
    b577 - block
    b186 - block
    b386 - block
    b842 - block
    b897 - block
    b988 - block
    b519 - block
    b509 - block
    b415 - block
    b622 - block
    b960 - block
    b957 - block
    b707 - block
    b983 - block
    b433 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b337 )
    ( on b994 b337 )
    ( on b904 b994 )
    ( on b123 b904 )
    ( on b577 b123 )
    ( on b186 b577 )
    ( on b386 b186 )
    ( on b842 b386 )
    ( on b897 b842 )
    ( on b988 b897 )
    ( on b519 b988 )
    ( on b509 b519 )
    ( on b415 b509 )
    ( on b622 b415 )
    ( on b960 b622 )
    ( on b957 b960 )
    ( on b707 b957 )
    ( on b983 b707 )
    ( on b433 b983 )
    ( clear b433 )
  )
  ( :tasks
    ( Make-18Pile b994 b904 b123 b577 b186 b386 b842 b897 b988 b519 b509 b415 b622 b960 b957 b707 b983 b433 )
  )
)
