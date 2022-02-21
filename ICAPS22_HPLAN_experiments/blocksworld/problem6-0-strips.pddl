( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b37 - block
    b462 - block
    b953 - block
    b883 - block
    b120 - block
    b876 - block
    b963 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b37 )
    ( on b462 b37 )
    ( on b953 b462 )
    ( on b883 b953 )
    ( on b120 b883 )
    ( on b876 b120 )
    ( on b963 b876 )
    ( clear b963 )
  )
  ( :goal
    ( and
      ( clear b37 )
      ( clear b37 )
      ( clear b37 )
      ( clear b37 )
      ( clear b37 )
      ( clear b37 )
      ( clear b37 )
    )
  )
)
