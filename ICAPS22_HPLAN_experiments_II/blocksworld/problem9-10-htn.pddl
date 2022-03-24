( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b952 - block
    b15 - block
    b898 - block
    b19 - block
    b773 - block
    b166 - block
    b597 - block
    b222 - block
    b217 - block
    b738 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b952 )
    ( on b15 b952 )
    ( on b898 b15 )
    ( on b19 b898 )
    ( on b773 b19 )
    ( on b166 b773 )
    ( on b597 b166 )
    ( on b222 b597 )
    ( on b217 b222 )
    ( on b738 b217 )
    ( clear b738 )
  )
  ( :tasks
    ( Make-9Pile b15 b898 b19 b773 b166 b597 b222 b217 b738 )
  )
)
