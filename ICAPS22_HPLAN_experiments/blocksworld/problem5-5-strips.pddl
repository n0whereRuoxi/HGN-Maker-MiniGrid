( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b542 - block
    b77 - block
    b971 - block
    b649 - block
    b391 - block
    b874 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b542 )
    ( on b77 b542 )
    ( on b971 b77 )
    ( on b649 b971 )
    ( on b391 b649 )
    ( on b874 b391 )
    ( clear b874 )
  )
  ( :goal
    ( and
      ( clear b542 )
    )
  )
)
