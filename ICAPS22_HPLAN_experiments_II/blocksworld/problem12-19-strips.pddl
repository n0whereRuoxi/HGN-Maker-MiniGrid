( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b874 - block
    b834 - block
    b647 - block
    b31 - block
    b511 - block
    b284 - block
    b313 - block
    b856 - block
    b256 - block
    b759 - block
    b860 - block
    b439 - block
    b22 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b874 )
    ( on b834 b874 )
    ( on b647 b834 )
    ( on b31 b647 )
    ( on b511 b31 )
    ( on b284 b511 )
    ( on b313 b284 )
    ( on b856 b313 )
    ( on b256 b856 )
    ( on b759 b256 )
    ( on b860 b759 )
    ( on b439 b860 )
    ( on b22 b439 )
    ( clear b22 )
  )
  ( :goal
    ( and
      ( clear b874 )
    )
  )
)
