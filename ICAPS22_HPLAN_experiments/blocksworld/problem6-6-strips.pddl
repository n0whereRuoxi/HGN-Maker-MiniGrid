( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b811 - block
    b537 - block
    b327 - block
    b569 - block
    b4 - block
    b168 - block
    b410 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b811 )
    ( on b537 b811 )
    ( on b327 b537 )
    ( on b569 b327 )
    ( on b4 b569 )
    ( on b168 b4 )
    ( on b410 b168 )
    ( clear b410 )
  )
  ( :goal
    ( and
      ( clear b811 )
      ( clear b811 )
      ( clear b811 )
      ( clear b811 )
      ( clear b811 )
      ( clear b811 )
      ( clear b811 )
    )
  )
)
