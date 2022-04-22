( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b178 - block
    b455 - block
    b429 - block
    b733 - block
    b758 - block
    b735 - block
    b353 - block
    b838 - block
    b450 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b178 )
    ( on b455 b178 )
    ( on b429 b455 )
    ( on b733 b429 )
    ( on b758 b733 )
    ( on b735 b758 )
    ( on b353 b735 )
    ( on b838 b353 )
    ( on b450 b838 )
    ( clear b450 )
  )
  ( :goal
    ( and
      ( clear b178 )
    )
  )
)
