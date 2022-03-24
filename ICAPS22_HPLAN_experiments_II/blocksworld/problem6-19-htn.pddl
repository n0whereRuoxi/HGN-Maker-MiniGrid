( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b340 - block
    b886 - block
    b912 - block
    b939 - block
    b446 - block
    b942 - block
    b789 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b340 )
    ( on b886 b340 )
    ( on b912 b886 )
    ( on b939 b912 )
    ( on b446 b939 )
    ( on b942 b446 )
    ( on b789 b942 )
    ( clear b789 )
  )
  ( :tasks
    ( Make-6Pile b886 b912 b939 b446 b942 b789 )
  )
)
