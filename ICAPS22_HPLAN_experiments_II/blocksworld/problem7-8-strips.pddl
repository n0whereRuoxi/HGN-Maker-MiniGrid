( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b596 - block
    b945 - block
    b500 - block
    b778 - block
    b935 - block
    b777 - block
    b384 - block
    b971 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b596 )
    ( on b945 b596 )
    ( on b500 b945 )
    ( on b778 b500 )
    ( on b935 b778 )
    ( on b777 b935 )
    ( on b384 b777 )
    ( on b971 b384 )
    ( clear b971 )
  )
  ( :goal
    ( and
      ( clear b596 )
    )
  )
)
