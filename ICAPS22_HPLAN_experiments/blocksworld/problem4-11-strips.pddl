( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b338 - block
    b822 - block
    b316 - block
    b546 - block
    b910 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b338 )
    ( on b822 b338 )
    ( on b316 b822 )
    ( on b546 b316 )
    ( on b910 b546 )
    ( clear b910 )
  )
  ( :goal
    ( and
      ( clear b338 )
      ( clear b338 )
      ( clear b338 )
      ( clear b338 )
      ( clear b338 )
    )
  )
)
