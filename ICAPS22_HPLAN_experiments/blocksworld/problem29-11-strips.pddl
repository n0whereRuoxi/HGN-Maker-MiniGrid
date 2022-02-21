( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b627 - block
    b869 - block
    b381 - block
    b242 - block
    b214 - block
    b729 - block
    b780 - block
    b426 - block
    b366 - block
    b427 - block
    b395 - block
    b112 - block
    b915 - block
    b92 - block
    b921 - block
    b302 - block
    b853 - block
    b563 - block
    b287 - block
    b282 - block
    b74 - block
    b787 - block
    b70 - block
    b248 - block
    b782 - block
    b319 - block
    b933 - block
    b414 - block
    b354 - block
    b846 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b627 )
    ( on b869 b627 )
    ( on b381 b869 )
    ( on b242 b381 )
    ( on b214 b242 )
    ( on b729 b214 )
    ( on b780 b729 )
    ( on b426 b780 )
    ( on b366 b426 )
    ( on b427 b366 )
    ( on b395 b427 )
    ( on b112 b395 )
    ( on b915 b112 )
    ( on b92 b915 )
    ( on b921 b92 )
    ( on b302 b921 )
    ( on b853 b302 )
    ( on b563 b853 )
    ( on b287 b563 )
    ( on b282 b287 )
    ( on b74 b282 )
    ( on b787 b74 )
    ( on b70 b787 )
    ( on b248 b70 )
    ( on b782 b248 )
    ( on b319 b782 )
    ( on b933 b319 )
    ( on b414 b933 )
    ( on b354 b414 )
    ( on b846 b354 )
    ( clear b846 )
  )
  ( :goal
    ( and
      ( clear b627 )
    )
  )
)
