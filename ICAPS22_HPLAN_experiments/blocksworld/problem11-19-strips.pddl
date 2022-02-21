( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b714 - block
    b360 - block
    b676 - block
    b39 - block
    b646 - block
    b399 - block
    b750 - block
    b542 - block
    b912 - block
    b724 - block
    b499 - block
    b583 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b714 )
    ( on b360 b714 )
    ( on b676 b360 )
    ( on b39 b676 )
    ( on b646 b39 )
    ( on b399 b646 )
    ( on b750 b399 )
    ( on b542 b750 )
    ( on b912 b542 )
    ( on b724 b912 )
    ( on b499 b724 )
    ( on b583 b499 )
    ( clear b583 )
  )
  ( :goal
    ( and
      ( clear b714 )
    )
  )
)
