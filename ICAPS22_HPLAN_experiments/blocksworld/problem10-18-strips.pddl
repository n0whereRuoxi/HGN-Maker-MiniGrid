( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b437 - block
    b289 - block
    b58 - block
    b310 - block
    b876 - block
    b532 - block
    b998 - block
    b425 - block
    b455 - block
    b646 - block
    b68 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b437 )
    ( on b289 b437 )
    ( on b58 b289 )
    ( on b310 b58 )
    ( on b876 b310 )
    ( on b532 b876 )
    ( on b998 b532 )
    ( on b425 b998 )
    ( on b455 b425 )
    ( on b646 b455 )
    ( on b68 b646 )
    ( clear b68 )
  )
  ( :goal
    ( and
      ( clear b437 )
    )
  )
)
