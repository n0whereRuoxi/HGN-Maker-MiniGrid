( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b394 - block
    b825 - block
    b293 - block
    b936 - block
    b708 - block
    b267 - block
    b374 - block
    b701 - block
    b975 - block
    b544 - block
    b945 - block
    b357 - block
    b872 - block
    b344 - block
    b830 - block
    b914 - block
    b941 - block
    b82 - block
    b509 - block
    b298 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b394 )
    ( on b825 b394 )
    ( on b293 b825 )
    ( on b936 b293 )
    ( on b708 b936 )
    ( on b267 b708 )
    ( on b374 b267 )
    ( on b701 b374 )
    ( on b975 b701 )
    ( on b544 b975 )
    ( on b945 b544 )
    ( on b357 b945 )
    ( on b872 b357 )
    ( on b344 b872 )
    ( on b830 b344 )
    ( on b914 b830 )
    ( on b941 b914 )
    ( on b82 b941 )
    ( on b509 b82 )
    ( on b298 b509 )
    ( clear b298 )
  )
  ( :goal
    ( and
      ( clear b394 )
    )
  )
)
