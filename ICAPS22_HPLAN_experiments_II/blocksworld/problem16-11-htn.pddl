( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b531 - block
    b64 - block
    b802 - block
    b137 - block
    b158 - block
    b87 - block
    b27 - block
    b726 - block
    b642 - block
    b286 - block
    b667 - block
    b676 - block
    b20 - block
    b694 - block
    b385 - block
    b778 - block
    b374 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b531 )
    ( on b64 b531 )
    ( on b802 b64 )
    ( on b137 b802 )
    ( on b158 b137 )
    ( on b87 b158 )
    ( on b27 b87 )
    ( on b726 b27 )
    ( on b642 b726 )
    ( on b286 b642 )
    ( on b667 b286 )
    ( on b676 b667 )
    ( on b20 b676 )
    ( on b694 b20 )
    ( on b385 b694 )
    ( on b778 b385 )
    ( on b374 b778 )
    ( clear b374 )
  )
  ( :tasks
    ( Make-16Pile b64 b802 b137 b158 b87 b27 b726 b642 b286 b667 b676 b20 b694 b385 b778 b374 )
  )
)
