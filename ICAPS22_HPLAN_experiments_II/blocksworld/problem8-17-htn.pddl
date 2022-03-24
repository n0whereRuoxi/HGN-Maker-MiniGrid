( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b577 - block
    b836 - block
    b995 - block
    b234 - block
    b876 - block
    b514 - block
    b729 - block
    b705 - block
    b848 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b577 )
    ( on b836 b577 )
    ( on b995 b836 )
    ( on b234 b995 )
    ( on b876 b234 )
    ( on b514 b876 )
    ( on b729 b514 )
    ( on b705 b729 )
    ( on b848 b705 )
    ( clear b848 )
  )
  ( :tasks
    ( Make-8Pile b836 b995 b234 b876 b514 b729 b705 b848 )
  )
)
