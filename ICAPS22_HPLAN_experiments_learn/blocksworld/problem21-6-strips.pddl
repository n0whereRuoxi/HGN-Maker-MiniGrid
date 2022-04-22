( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b463 - block
    b871 - block
    b598 - block
    b120 - block
    b27 - block
    b341 - block
    b244 - block
    b577 - block
    b491 - block
    b736 - block
    b696 - block
    b299 - block
    b765 - block
    b573 - block
    b200 - block
    b855 - block
    b513 - block
    b518 - block
    b522 - block
    b860 - block
    b946 - block
    b574 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b463 )
    ( on b871 b463 )
    ( on b598 b871 )
    ( on b120 b598 )
    ( on b27 b120 )
    ( on b341 b27 )
    ( on b244 b341 )
    ( on b577 b244 )
    ( on b491 b577 )
    ( on b736 b491 )
    ( on b696 b736 )
    ( on b299 b696 )
    ( on b765 b299 )
    ( on b573 b765 )
    ( on b200 b573 )
    ( on b855 b200 )
    ( on b513 b855 )
    ( on b518 b513 )
    ( on b522 b518 )
    ( on b860 b522 )
    ( on b946 b860 )
    ( on b574 b946 )
    ( clear b574 )
  )
  ( :goal
    ( and
      ( clear b463 )
    )
  )
)
