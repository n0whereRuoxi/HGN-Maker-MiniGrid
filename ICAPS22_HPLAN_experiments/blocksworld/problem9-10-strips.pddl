( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b761 - block
    b704 - block
    b236 - block
    b520 - block
    b22 - block
    b548 - block
    b777 - block
    b985 - block
    b294 - block
    b948 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b761 )
    ( on b704 b761 )
    ( on b236 b704 )
    ( on b520 b236 )
    ( on b22 b520 )
    ( on b548 b22 )
    ( on b777 b548 )
    ( on b985 b777 )
    ( on b294 b985 )
    ( on b948 b294 )
    ( clear b948 )
  )
  ( :goal
    ( and
      ( clear b761 )
    )
  )
)
