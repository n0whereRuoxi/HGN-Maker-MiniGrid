( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b546 - block
    b626 - block
    b947 - block
    b264 - block
    b211 - block
    b619 - block
    b348 - block
    b852 - block
    b855 - block
    b343 - block
    b925 - block
    b240 - block
    b372 - block
    b679 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b546 )
    ( on b626 b546 )
    ( on b947 b626 )
    ( on b264 b947 )
    ( on b211 b264 )
    ( on b619 b211 )
    ( on b348 b619 )
    ( on b852 b348 )
    ( on b855 b852 )
    ( on b343 b855 )
    ( on b925 b343 )
    ( on b240 b925 )
    ( on b372 b240 )
    ( on b679 b372 )
    ( clear b679 )
  )
  ( :goal
    ( and
      ( clear b546 )
    )
  )
)
