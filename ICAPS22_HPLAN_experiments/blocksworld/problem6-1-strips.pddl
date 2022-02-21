( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b726 - block
    b655 - block
    b340 - block
    b857 - block
    b219 - block
    b687 - block
    b695 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b726 )
    ( on b655 b726 )
    ( on b340 b655 )
    ( on b857 b340 )
    ( on b219 b857 )
    ( on b687 b219 )
    ( on b695 b687 )
    ( clear b695 )
  )
  ( :goal
    ( and
      ( clear b726 )
      ( clear b726 )
      ( clear b726 )
      ( clear b726 )
      ( clear b726 )
      ( clear b726 )
      ( clear b726 )
    )
  )
)
