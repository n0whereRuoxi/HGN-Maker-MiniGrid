( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b327 - block
    b982 - block
    b179 - block
    b338 - block
    b486 - block
    b193 - block
    b994 - block
    b105 - block
    b496 - block
    b72 - block
    b62 - block
    b265 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b327 )
    ( on b982 b327 )
    ( on b179 b982 )
    ( on b338 b179 )
    ( on b486 b338 )
    ( on b193 b486 )
    ( on b994 b193 )
    ( on b105 b994 )
    ( on b496 b105 )
    ( on b72 b496 )
    ( on b62 b72 )
    ( on b265 b62 )
    ( clear b265 )
  )
  ( :goal
    ( and
      ( clear b327 )
    )
  )
)
