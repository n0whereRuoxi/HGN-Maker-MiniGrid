( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b218 - block
    b651 - block
    b466 - block
    b619 - block
    b33 - block
    b694 - block
    b971 - block
    b319 - block
    b652 - block
    b171 - block
    b273 - block
    b232 - block
    b381 - block
    b806 - block
    b499 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b218 )
    ( on b651 b218 )
    ( on b466 b651 )
    ( on b619 b466 )
    ( on b33 b619 )
    ( on b694 b33 )
    ( on b971 b694 )
    ( on b319 b971 )
    ( on b652 b319 )
    ( on b171 b652 )
    ( on b273 b171 )
    ( on b232 b273 )
    ( on b381 b232 )
    ( on b806 b381 )
    ( on b499 b806 )
    ( clear b499 )
  )
  ( :tasks
    ( Make-14Pile b651 b466 b619 b33 b694 b971 b319 b652 b171 b273 b232 b381 b806 b499 )
  )
)
