( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b700 - block
    b617 - block
    b52 - block
    b747 - block
    b49 - block
    b783 - block
    b717 - block
    b614 - block
    b356 - block
    b393 - block
    b927 - block
    b510 - block
    b176 - block
    b137 - block
    b504 - block
    b505 - block
    b379 - block
    b362 - block
    b778 - block
    b892 - block
    b750 - block
    b409 - block
    b127 - block
    b96 - block
    b200 - block
    b452 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b700 )
    ( on b617 b700 )
    ( on b52 b617 )
    ( on b747 b52 )
    ( on b49 b747 )
    ( on b783 b49 )
    ( on b717 b783 )
    ( on b614 b717 )
    ( on b356 b614 )
    ( on b393 b356 )
    ( on b927 b393 )
    ( on b510 b927 )
    ( on b176 b510 )
    ( on b137 b176 )
    ( on b504 b137 )
    ( on b505 b504 )
    ( on b379 b505 )
    ( on b362 b379 )
    ( on b778 b362 )
    ( on b892 b778 )
    ( on b750 b892 )
    ( on b409 b750 )
    ( on b127 b409 )
    ( on b96 b127 )
    ( on b200 b96 )
    ( on b452 b200 )
    ( clear b452 )
  )
  ( :goal
    ( and
      ( clear b700 )
    )
  )
)
