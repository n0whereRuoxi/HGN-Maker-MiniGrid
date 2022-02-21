( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b371 - block
    b607 - block
    b172 - block
    b932 - block
    b782 - block
    b505 - block
    b400 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b371 )
    ( on b607 b371 )
    ( on b172 b607 )
    ( on b932 b172 )
    ( on b782 b932 )
    ( on b505 b782 )
    ( on b400 b505 )
    ( clear b400 )
  )
  ( :goal
    ( and
      ( clear b371 )
      ( clear b371 )
      ( clear b371 )
      ( clear b371 )
      ( clear b371 )
      ( clear b371 )
      ( clear b371 )
    )
  )
)
