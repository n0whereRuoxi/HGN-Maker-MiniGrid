( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b520 - block
    b848 - block
    b438 - block
    b460 - block
    b3 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b520 )
    ( on b848 b520 )
    ( on b438 b848 )
    ( on b460 b438 )
    ( on b3 b460 )
    ( clear b3 )
  )
  ( :tasks
    ( Make-4Pile b848 b438 b460 b3 )
  )
)
