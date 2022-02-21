( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b409 - block
    b634 - block
    b285 - block
    b803 - block
    b119 - block
    b249 - block
    b830 - block
    b475 - block
    b881 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b409 )
    ( on b634 b409 )
    ( on b285 b634 )
    ( on b803 b285 )
    ( on b119 b803 )
    ( on b249 b119 )
    ( on b830 b249 )
    ( on b475 b830 )
    ( on b881 b475 )
    ( clear b881 )
  )
  ( :goal
    ( and
      ( clear b409 )
    )
  )
)
