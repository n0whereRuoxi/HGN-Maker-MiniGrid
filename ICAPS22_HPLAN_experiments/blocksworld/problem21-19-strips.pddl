( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b106 - block
    b665 - block
    b376 - block
    b865 - block
    b483 - block
    b952 - block
    b424 - block
    b55 - block
    b812 - block
    b133 - block
    b487 - block
    b792 - block
    b806 - block
    b397 - block
    b561 - block
    b344 - block
    b407 - block
    b81 - block
    b517 - block
    b358 - block
    b195 - block
    b330 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b106 )
    ( on b665 b106 )
    ( on b376 b665 )
    ( on b865 b376 )
    ( on b483 b865 )
    ( on b952 b483 )
    ( on b424 b952 )
    ( on b55 b424 )
    ( on b812 b55 )
    ( on b133 b812 )
    ( on b487 b133 )
    ( on b792 b487 )
    ( on b806 b792 )
    ( on b397 b806 )
    ( on b561 b397 )
    ( on b344 b561 )
    ( on b407 b344 )
    ( on b81 b407 )
    ( on b517 b81 )
    ( on b358 b517 )
    ( on b195 b358 )
    ( on b330 b195 )
    ( clear b330 )
  )
  ( :goal
    ( and
      ( clear b106 )
    )
  )
)
