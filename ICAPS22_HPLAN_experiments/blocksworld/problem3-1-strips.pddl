( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b271 - block
    b855 - block
    b577 - block
    b260 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b271 )
    ( on b855 b271 )
    ( on b577 b855 )
    ( on b260 b577 )
    ( clear b260 )
  )
  ( :goal
    ( and
      ( clear b271 )
      ( clear b271 )
      ( clear b271 )
      ( clear b271 )
    )
  )
)
