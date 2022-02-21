( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b849 - block
    b110 - block
    b439 - block
    b711 - block
    b725 - block
    b332 - block
    b912 - block
    b277 - block
    b443 - block
    b206 - block
    b556 - block
    b319 - block
    b568 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b849 )
    ( on b110 b849 )
    ( on b439 b110 )
    ( on b711 b439 )
    ( on b725 b711 )
    ( on b332 b725 )
    ( on b912 b332 )
    ( on b277 b912 )
    ( on b443 b277 )
    ( on b206 b443 )
    ( on b556 b206 )
    ( on b319 b556 )
    ( on b568 b319 )
    ( clear b568 )
  )
  ( :goal
    ( and
      ( clear b849 )
    )
  )
)
