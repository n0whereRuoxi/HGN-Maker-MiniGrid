( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b152 - block
    b513 - block
    b206 - block
    b618 - block
    b769 - block
    b678 - block
    b256 - block
    b247 - block
    b137 - block
    b132 - block
    b78 - block
    b434 - block
    b136 - block
    b652 - block
    b368 - block
    b279 - block
    b25 - block
    b184 - block
    b74 - block
    b997 - block
    b482 - block
    b994 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b152 )
    ( on b513 b152 )
    ( on b206 b513 )
    ( on b618 b206 )
    ( on b769 b618 )
    ( on b678 b769 )
    ( on b256 b678 )
    ( on b247 b256 )
    ( on b137 b247 )
    ( on b132 b137 )
    ( on b78 b132 )
    ( on b434 b78 )
    ( on b136 b434 )
    ( on b652 b136 )
    ( on b368 b652 )
    ( on b279 b368 )
    ( on b25 b279 )
    ( on b184 b25 )
    ( on b74 b184 )
    ( on b997 b74 )
    ( on b482 b997 )
    ( on b994 b482 )
    ( clear b994 )
  )
  ( :goal
    ( and
      ( clear b152 )
    )
  )
)
