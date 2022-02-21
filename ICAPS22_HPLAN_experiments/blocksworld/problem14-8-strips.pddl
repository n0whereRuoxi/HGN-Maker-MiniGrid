( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b430 - block
    b820 - block
    b563 - block
    b917 - block
    b219 - block
    b591 - block
    b329 - block
    b319 - block
    b215 - block
    b84 - block
    b651 - block
    b184 - block
    b565 - block
    b459 - block
    b96 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b430 )
    ( on b820 b430 )
    ( on b563 b820 )
    ( on b917 b563 )
    ( on b219 b917 )
    ( on b591 b219 )
    ( on b329 b591 )
    ( on b319 b329 )
    ( on b215 b319 )
    ( on b84 b215 )
    ( on b651 b84 )
    ( on b184 b651 )
    ( on b565 b184 )
    ( on b459 b565 )
    ( on b96 b459 )
    ( clear b96 )
  )
  ( :goal
    ( and
      ( clear b430 )
    )
  )
)
