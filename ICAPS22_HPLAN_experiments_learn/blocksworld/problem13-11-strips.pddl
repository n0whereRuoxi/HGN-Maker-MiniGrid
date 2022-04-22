( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b404 - block
    b837 - block
    b648 - block
    b988 - block
    b757 - block
    b514 - block
    b8 - block
    b605 - block
    b909 - block
    b770 - block
    b59 - block
    b37 - block
    b249 - block
    b205 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b404 )
    ( on b837 b404 )
    ( on b648 b837 )
    ( on b988 b648 )
    ( on b757 b988 )
    ( on b514 b757 )
    ( on b8 b514 )
    ( on b605 b8 )
    ( on b909 b605 )
    ( on b770 b909 )
    ( on b59 b770 )
    ( on b37 b59 )
    ( on b249 b37 )
    ( on b205 b249 )
    ( clear b205 )
  )
  ( :goal
    ( and
      ( clear b404 )
    )
  )
)
