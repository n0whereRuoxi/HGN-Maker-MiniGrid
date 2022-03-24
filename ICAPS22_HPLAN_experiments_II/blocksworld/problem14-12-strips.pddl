( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b759 - block
    b54 - block
    b760 - block
    b610 - block
    b704 - block
    b79 - block
    b841 - block
    b767 - block
    b96 - block
    b165 - block
    b182 - block
    b416 - block
    b752 - block
    b951 - block
    b438 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b759 )
    ( on b54 b759 )
    ( on b760 b54 )
    ( on b610 b760 )
    ( on b704 b610 )
    ( on b79 b704 )
    ( on b841 b79 )
    ( on b767 b841 )
    ( on b96 b767 )
    ( on b165 b96 )
    ( on b182 b165 )
    ( on b416 b182 )
    ( on b752 b416 )
    ( on b951 b752 )
    ( on b438 b951 )
    ( clear b438 )
  )
  ( :goal
    ( and
      ( clear b759 )
    )
  )
)
