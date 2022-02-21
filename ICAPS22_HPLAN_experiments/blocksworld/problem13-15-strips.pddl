( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b805 - block
    b683 - block
    b136 - block
    b984 - block
    b938 - block
    b201 - block
    b656 - block
    b919 - block
    b705 - block
    b789 - block
    b394 - block
    b457 - block
    b439 - block
    b812 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b805 )
    ( on b683 b805 )
    ( on b136 b683 )
    ( on b984 b136 )
    ( on b938 b984 )
    ( on b201 b938 )
    ( on b656 b201 )
    ( on b919 b656 )
    ( on b705 b919 )
    ( on b789 b705 )
    ( on b394 b789 )
    ( on b457 b394 )
    ( on b439 b457 )
    ( on b812 b439 )
    ( clear b812 )
  )
  ( :goal
    ( and
      ( clear b805 )
    )
  )
)
