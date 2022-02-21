( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b794 - block
    b242 - block
    b526 - block
    b639 - block
    b818 - block
    b899 - block
    b592 - block
    b730 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b794 )
    ( on b242 b794 )
    ( on b526 b242 )
    ( on b639 b526 )
    ( on b818 b639 )
    ( on b899 b818 )
    ( on b592 b899 )
    ( on b730 b592 )
    ( clear b730 )
  )
  ( :goal
    ( and
      ( clear b794 )
    )
  )
)
