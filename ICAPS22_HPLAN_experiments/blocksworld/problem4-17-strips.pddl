( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b291 - block
    b874 - block
    b102 - block
    b745 - block
    b519 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b291 )
    ( on b874 b291 )
    ( on b102 b874 )
    ( on b745 b102 )
    ( on b519 b745 )
    ( clear b519 )
  )
  ( :goal
    ( and
      ( clear b291 )
      ( clear b291 )
      ( clear b291 )
      ( clear b291 )
      ( clear b291 )
    )
  )
)
