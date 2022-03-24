( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b796 - block
    b783 - block
    b474 - block
    b458 - block
    b915 - block
    b965 - block
    b331 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b796 )
    ( on b783 b796 )
    ( on b474 b783 )
    ( on b458 b474 )
    ( on b915 b458 )
    ( on b965 b915 )
    ( on b331 b965 )
    ( clear b331 )
  )
  ( :tasks
    ( Make-6Pile b783 b474 b458 b915 b965 b331 )
  )
)
