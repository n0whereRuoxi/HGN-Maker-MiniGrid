( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b593 - block
    b962 - block
    b484 - block
    b86 - block
    b94 - block
    b271 - block
    b580 - block
    b194 - block
    b306 - block
    b530 - block
    b814 - block
    b865 - block
    b159 - block
    b618 - block
    b340 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b593 )
    ( on b962 b593 )
    ( on b484 b962 )
    ( on b86 b484 )
    ( on b94 b86 )
    ( on b271 b94 )
    ( on b580 b271 )
    ( on b194 b580 )
    ( on b306 b194 )
    ( on b530 b306 )
    ( on b814 b530 )
    ( on b865 b814 )
    ( on b159 b865 )
    ( on b618 b159 )
    ( on b340 b618 )
    ( clear b340 )
  )
  ( :tasks
    ( Make-14Pile b962 b484 b86 b94 b271 b580 b194 b306 b530 b814 b865 b159 b618 b340 )
  )
)
