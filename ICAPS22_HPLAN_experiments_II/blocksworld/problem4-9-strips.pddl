( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b657 - block
    b382 - block
    b660 - block
    b730 - block
    b768 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b657 )
    ( on b382 b657 )
    ( on b660 b382 )
    ( on b730 b660 )
    ( on b768 b730 )
    ( clear b768 )
  )
  ( :goal
    ( and
      ( clear b657 )
    )
  )
)
