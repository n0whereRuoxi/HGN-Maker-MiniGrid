( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b996 - block
    b427 - block
    b70 - block
    b534 - block
    b460 - block
    b797 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b996 )
    ( on b427 b996 )
    ( on b70 b427 )
    ( on b534 b70 )
    ( on b460 b534 )
    ( on b797 b460 )
    ( clear b797 )
  )
  ( :goal
    ( and
      ( clear b996 )
      ( clear b996 )
      ( clear b996 )
      ( clear b996 )
      ( clear b996 )
      ( clear b996 )
    )
  )
)
