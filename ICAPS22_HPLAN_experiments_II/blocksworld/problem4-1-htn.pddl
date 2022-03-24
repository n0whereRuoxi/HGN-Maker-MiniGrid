( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b871 - block
    b334 - block
    b500 - block
    b842 - block
    b793 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b871 )
    ( on b334 b871 )
    ( on b500 b334 )
    ( on b842 b500 )
    ( on b793 b842 )
    ( clear b793 )
  )
  ( :tasks
    ( Make-4Pile b334 b500 b842 b793 )
  )
)
