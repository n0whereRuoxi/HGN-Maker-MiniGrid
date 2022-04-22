( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b877 - block
    b374 - block
    b729 - block
    b819 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b877 )
    ( on b374 b877 )
    ( on b729 b374 )
    ( on b819 b729 )
    ( clear b819 )
  )
  ( :goal
    ( and
      ( clear b877 )
    )
  )
)
