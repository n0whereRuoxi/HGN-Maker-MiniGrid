( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b353 - block
    b203 - block
    b425 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b353 )
    ( on b203 b353 )
    ( on b425 b203 )
    ( clear b425 )
  )
  ( :goal
    ( and
      ( clear b353 )
    )
  )
)
