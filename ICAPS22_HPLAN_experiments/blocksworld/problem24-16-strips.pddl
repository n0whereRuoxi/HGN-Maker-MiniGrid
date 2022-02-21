( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b734 - block
    b693 - block
    b936 - block
    b230 - block
    b287 - block
    b748 - block
    b932 - block
    b26 - block
    b43 - block
    b732 - block
    b14 - block
    b757 - block
    b871 - block
    b481 - block
    b946 - block
    b705 - block
    b644 - block
    b102 - block
    b205 - block
    b159 - block
    b778 - block
    b632 - block
    b56 - block
    b842 - block
    b826 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b734 )
    ( on b693 b734 )
    ( on b936 b693 )
    ( on b230 b936 )
    ( on b287 b230 )
    ( on b748 b287 )
    ( on b932 b748 )
    ( on b26 b932 )
    ( on b43 b26 )
    ( on b732 b43 )
    ( on b14 b732 )
    ( on b757 b14 )
    ( on b871 b757 )
    ( on b481 b871 )
    ( on b946 b481 )
    ( on b705 b946 )
    ( on b644 b705 )
    ( on b102 b644 )
    ( on b205 b102 )
    ( on b159 b205 )
    ( on b778 b159 )
    ( on b632 b778 )
    ( on b56 b632 )
    ( on b842 b56 )
    ( on b826 b842 )
    ( clear b826 )
  )
  ( :goal
    ( and
      ( clear b734 )
    )
  )
)
