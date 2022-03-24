( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b496 - block
    b808 - block
    b346 - block
    b945 - block
    b123 - block
    b699 - block
    b27 - block
    b361 - block
    b273 - block
    b330 - block
    b755 - block
    b759 - block
    b864 - block
    b219 - block
    b581 - block
    b257 - block
    b35 - block
    b92 - block
    b321 - block
    b541 - block
    b909 - block
    b954 - block
    b23 - block
    b830 - block
    b596 - block
    b140 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b496 )
    ( on b808 b496 )
    ( on b346 b808 )
    ( on b945 b346 )
    ( on b123 b945 )
    ( on b699 b123 )
    ( on b27 b699 )
    ( on b361 b27 )
    ( on b273 b361 )
    ( on b330 b273 )
    ( on b755 b330 )
    ( on b759 b755 )
    ( on b864 b759 )
    ( on b219 b864 )
    ( on b581 b219 )
    ( on b257 b581 )
    ( on b35 b257 )
    ( on b92 b35 )
    ( on b321 b92 )
    ( on b541 b321 )
    ( on b909 b541 )
    ( on b954 b909 )
    ( on b23 b954 )
    ( on b830 b23 )
    ( on b596 b830 )
    ( on b140 b596 )
    ( clear b140 )
  )
  ( :goal
    ( and
      ( clear b496 )
    )
  )
)
