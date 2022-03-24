( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b32 - block
    b664 - block
    b182 - block
    b985 - block
    b753 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b32 )
    ( on b664 b32 )
    ( on b182 b664 )
    ( on b985 b182 )
    ( on b753 b985 )
    ( clear b753 )
  )
  ( :tasks
    ( Make-4Pile b664 b182 b985 b753 )
  )
)
