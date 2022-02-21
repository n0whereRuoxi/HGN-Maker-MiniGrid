( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b57 - block
    b427 - block
    b622 - block
    b90 - block
    b351 - block
    b827 - block
    b606 - block
    b484 - block
    b731 - block
    b161 - block
    b100 - block
    b676 - block
    b126 - block
    b888 - block
    b325 - block
    b759 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b57 )
    ( on b427 b57 )
    ( on b622 b427 )
    ( on b90 b622 )
    ( on b351 b90 )
    ( on b827 b351 )
    ( on b606 b827 )
    ( on b484 b606 )
    ( on b731 b484 )
    ( on b161 b731 )
    ( on b100 b161 )
    ( on b676 b100 )
    ( on b126 b676 )
    ( on b888 b126 )
    ( on b325 b888 )
    ( on b759 b325 )
    ( clear b759 )
  )
  ( :goal
    ( and
      ( clear b57 )
    )
  )
)
