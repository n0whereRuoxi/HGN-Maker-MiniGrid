( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b738 - block
    b11 - block
    b272 - block
    b706 - block
    b575 - block
    b100 - block
    b965 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b738 )
    ( on b11 b738 )
    ( on b272 b11 )
    ( on b706 b272 )
    ( on b575 b706 )
    ( on b100 b575 )
    ( on b965 b100 )
    ( clear b965 )
  )
  ( :goal
    ( and
      ( clear b738 )
      ( clear b738 )
      ( clear b738 )
      ( clear b738 )
      ( clear b738 )
      ( clear b738 )
      ( clear b738 )
    )
  )
)
