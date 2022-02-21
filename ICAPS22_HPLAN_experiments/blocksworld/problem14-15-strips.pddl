( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b339 - block
    b208 - block
    b205 - block
    b206 - block
    b998 - block
    b581 - block
    b698 - block
    b187 - block
    b474 - block
    b445 - block
    b346 - block
    b7 - block
    b588 - block
    b670 - block
    b273 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b339 )
    ( on b208 b339 )
    ( on b205 b208 )
    ( on b206 b205 )
    ( on b998 b206 )
    ( on b581 b998 )
    ( on b698 b581 )
    ( on b187 b698 )
    ( on b474 b187 )
    ( on b445 b474 )
    ( on b346 b445 )
    ( on b7 b346 )
    ( on b588 b7 )
    ( on b670 b588 )
    ( on b273 b670 )
    ( clear b273 )
  )
  ( :goal
    ( and
      ( clear b339 )
    )
  )
)
