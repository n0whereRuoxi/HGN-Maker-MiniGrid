( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b401 - block
    b691 - block
    b469 - block
    b177 - block
    b634 - block
    b974 - block
    b124 - block
    b195 - block
    b517 - block
    b531 - block
    b832 - block
    b491 - block
    b939 - block
    b965 - block
    b821 - block
    b368 - block
    b22 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b401 )
    ( on b691 b401 )
    ( on b469 b691 )
    ( on b177 b469 )
    ( on b634 b177 )
    ( on b974 b634 )
    ( on b124 b974 )
    ( on b195 b124 )
    ( on b517 b195 )
    ( on b531 b517 )
    ( on b832 b531 )
    ( on b491 b832 )
    ( on b939 b491 )
    ( on b965 b939 )
    ( on b821 b965 )
    ( on b368 b821 )
    ( on b22 b368 )
    ( clear b22 )
  )
  ( :tasks
    ( Make-16Pile b691 b469 b177 b634 b974 b124 b195 b517 b531 b832 b491 b939 b965 b821 b368 b22 )
  )
)
