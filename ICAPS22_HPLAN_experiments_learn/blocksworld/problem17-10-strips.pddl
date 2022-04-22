( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b5 - block
    b100 - block
    b343 - block
    b499 - block
    b113 - block
    b59 - block
    b656 - block
    b794 - block
    b3 - block
    b919 - block
    b175 - block
    b516 - block
    b703 - block
    b508 - block
    b965 - block
    b663 - block
    b540 - block
    b212 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b5 )
    ( on b100 b5 )
    ( on b343 b100 )
    ( on b499 b343 )
    ( on b113 b499 )
    ( on b59 b113 )
    ( on b656 b59 )
    ( on b794 b656 )
    ( on b3 b794 )
    ( on b919 b3 )
    ( on b175 b919 )
    ( on b516 b175 )
    ( on b703 b516 )
    ( on b508 b703 )
    ( on b965 b508 )
    ( on b663 b965 )
    ( on b540 b663 )
    ( on b212 b540 )
    ( clear b212 )
  )
  ( :goal
    ( and
      ( clear b5 )
    )
  )
)
