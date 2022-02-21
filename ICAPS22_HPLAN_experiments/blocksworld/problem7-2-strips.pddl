( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b848 - block
    b683 - block
    b602 - block
    b582 - block
    b469 - block
    b676 - block
    b412 - block
    b461 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b848 )
    ( on b683 b848 )
    ( on b602 b683 )
    ( on b582 b602 )
    ( on b469 b582 )
    ( on b676 b469 )
    ( on b412 b676 )
    ( on b461 b412 )
    ( clear b461 )
  )
  ( :goal
    ( and
      ( clear b848 )
    )
  )
)
